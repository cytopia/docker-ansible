#!/usr/bin/env bash

set -e
set -u
set -o pipefail

# Variables set in Dockerfile
#
# MY_USER=ansible
# MY_GROUP=ansible
# MY_UID=1000
# MY_GID=1000

USE_NONROOT=0
INIT_GPG=0


# ------------------------------------------------------------------------------
# FUNCTIONS
# ------------------------------------------------------------------------------
update_uid_gid() {
	local user="${1}"
	local group="${2}"
	local uid="${3}"
	local gid="${4}"


	echo "[INFO] Adjusting local user with uid:${uid} and gid:${gid}"

	# Remove previous user/group
	if ! deluser "${user}"; then
		>&2 echo "[ERR]  Failed to delete user: ${user}"
		exit 1
	fi

	# Add new user/group
	if ! addgroup -g "${gid}" "${group}"; then
		>&2 echo "[ERR]  Failed to add group ${group} (gid:${gid})"
		exit 1
	fi
	if ! adduser -h /home/ansible -s /bin/bash -G "${group}" -D -u "${uid}" "${user}"; then
		>&2 echo "[ERR]  Failed to add user ${user} (uid:${uid})"
		exit 1
	fi

	# Adjust filesystem permissions accordingly
	if [ -d /home/ansible/.gnupg ]; then
		echo "[INFO] Adjusting ownership on directory: ~/.gnupg/"
		if ! chown "${user}:${group}" /home/ansible/.gnupg/; then
			>&2 echo "[ERR]  Failed to 'chown ${user}:${group} ~/.gnupg'"
			exit 1
		fi
	fi
	if [ -d /home/ansible/.ssh ]; then
		echo "[INFO] Adjusting ownership on directory: ~/.ssh/"
		if ! chown "${user}:${group}" /home/ansible/.ssh/; then
			>&2 echo "[ERR]  Failed to 'chown ${user}:${group} ~/.ssh'"
			exit 1
		fi
	fi
	if [ -d /home/ansible/.aws ]; then
		echo "[INFO] Adjusting ownership on directory: ~/.aws/"
		if ! chown "${user}:${group}" /home/ansible/.aws/; then
			>&2 echo "[ERR]  Failed to 'chown ${user}:${group} ~/.aws'"
			exit 1
		fi
	fi
	if [ -d /home/ansible/.helm ]; then
		echo "[INFO] Adjusting ownership on directory: ~/.helm/"
		if ! chown "${user}:${group}" /home/ansible/.helm/; then
			>&2 echo "[ERR]  Failed to 'chown ${user}:${group} ~/.helm'"
			exit 1
		fi
	fi
}

init_gpg_key_cmd() {
	local user="${1}"
	local cmd="${2}"

	if [ "${user}" = "root" ]; then
		if ! eval "${cmd}"; then
			>&2 echo "[ERR]  Failed to initialize GPG via: ${cmd}"
			exit 1
		else
			echo "[INFO] GPG initialized successfully via: ${cmd}"
		fi
	else
		if ! su "${user}" -c "${cmd}"; then
			>&2 echo "[ERR]  Failed to initialize GPG via: ${cmd}"
			exit 1
		else
			echo "[INFO] GPG initialized successfully via: ${cmd}"
		fi
	fi
}

init_gpg_key_pass() {
	local user="${1}"
	local key="${2}"
	local pass="${3}"

	if [ "${user}" = "root" ]; then
		if ! gpg --list-key "${key}" >/dev/null 2>&1; then
			>&2 echo "[ERR]  GPG key does not exist: ${key}"
			exit 1
		fi

		if ! echo "test" \
			| gpg --armor --pinentry-mode loopback --passphrase "${pass}" --recipient "${key}" --encrypt 2>/dev/null \
			| gpg --pinentry-mode loopback --passphrase "${pass}" --decrypt 2>/dev/null \
			| grep -q '^test$'; then
			>&2 echo "[ERR]  Failed to initialize GPG"
			exit 1
		else
			echo "[INFO] GPG initialized successfully"
		fi
	else
		if ! su "${user}" -c "gpg --list-key '${key}' >/dev/null 2>&1"; then
			>&2 echo "[ERR]  GPG key does not exist: ${key}"
			exit 1
		fi
		if ! su "${user}" -c "
			echo 'test' \
			| gpg --armor --pinentry-mode loopback --passphrase '${pass}' --recipient '${key}' --encrypt 2>/dev/null \
			| gpg --pinentry-mode loopback --passphrase '${pass}' --decrypt 2>/dev/null \
			| grep -q '^test$'"; then
			>&2 echo "[ERR]  Failed to initialize GPG"
			exit 1
		else
			echo "[INFO] GPG initialized successfully"
		fi
	fi
}


# ------------------------------------------------------------------------------
# ENTRYPOINT (ENV VARIABLES
# ------------------------------------------------------------------------------

###
### Initialize GPG key
###
INIT_GPG=

# Custom specified command to initliaze GPG key
if [ -n "${INIT_GPG_CMD:=}" ]; then
	if [ -n "${INIT_GPG_KEY:=}" ]; then
		>&2 echo "[ERR]  When using \$INIT_GPG_CMD, you cannot specify \$INIT_GPG_KEY."
		exit 1
	fi
	if [ -n "${INIT_GPG_PASS:=}" ]; then
		>&2 echo "[ERR]  When using \$INIT_GPG_CMD, you cannot specify \$INIT_GPG_PASS."
		exit 1
	fi
	echo "[INFO] Initializing gpg key with custom command: ${INIT_GPG_CMD}"
	INIT_GPG="CMD"

# Use GPG key/pass from environment
elif [ -n "${INIT_GPG_KEY:=}" ] && [ -n "${INIT_GPG_PASS:=}" ]; then
	echo "[INFO] Initializing gpg key for ${INIT_GPG_KEY}"
	INIT_GPG="PASS"

# GPG_KEY set, but GPG_PASS missing
elif [ -n "${INIT_GPG_KEY:=}" ] && [ -z "${INIT_GPG_PASS:=}" ]; then
	>&2 echo "[ERR]  When using \$INIT_GPG_KEY, you also need to specify \$INIT_GPG_PASS"
	exit 1

# GPG_KEY missing, but GPG_PASS set
elif [ -z "${INIT_GPG_KEY:=}" ] && [ -n "${INIT_GPG_PASS:=}" ]; then
	>&2 echo "[ERR]  When using \$INIT_GPG_PASS, you also need to specify \$INIT_GPG_KEY"
	exit 1
fi



###
### Run with root or ansible user?
###
if env | grep -q '^USER='; then
	if [ "${USER}" = "ansible" ]; then
		echo "[INFO] Running container with user 'ansible'"
		USE_NONROOT=1
	else
		>&2 echo "[ERR}  \$USER can only be set to 'ansible'. If you want to run as root, omit the env var."
		exit 1
	fi
fi


###
### Gather new UID/GID
###
if env | grep -q '^UID='; then
	# Change UID
	MY_UID="$( env | grep '^UID=' | sed 's/^UID=//g' )"
	echo "[INFO] Changing UID to ${MY_UID}"
	# Change GID (maybe)
	if env | grep -q '^GID='; then
		echo "[INFO] Changing GID to ${MY_GID}"
		MY_GID="$( env | grep '^GID=' | sed 's/^GID=//g' )"
	fi
elif env | grep -q '^GID='; then
	# Change GID
	MY_GID="$( env | grep '^GID=' | sed 's/^GID=//g' )"
	echo "[INFO] Changing GID to ${MY_GID}"
fi


# ------------------------------------------------------------------------------
# ENTRYPOINT (CONFIGURATION)
# ------------------------------------------------------------------------------

if [ "${USE_NONROOT}" = "1" ]; then

	update_uid_gid "${MY_USER}" "${MY_GROUP}" "${MY_UID}" "${MY_GID}"

	if [ "${INIT_GPG}" = "CMD" ]; then
		init_gpg_key_cmd "${MY_USER}" "${INIT_GPG_CMD}"
	elif [ "${INIT_GPG}" = "PASS" ]; then
		init_gpg_key_pass "${MY_USER}" "${INIT_GPG_KEY}" "${INIT_GPG_PASS}"
	fi
	echo "[INFO] ansible> ${*}"
	exec su "${MY_USER}" -c "${*}"

else

	if [ "${INIT_GPG}" = "CMD" ]; then
		init_gpg_key_cmd "root" "${INIT_GPG_CMD}"
	elif [ "${INIT_GPG}" = "PASS" ]; then
		init_gpg_key_pass "root" "${INIT_GPG_KEY}" "${INIT_GPG_PASS}"
	fi
	echo "[INFO] root> ${*}"
	exec "${@}"
fi
