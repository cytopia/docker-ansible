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

DEFAULT_UID=1000
DEFAULT_GID=1000

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
	if ! addgroup -g ${gid} ${group}; then
		>&2 echo "[ERR]  Failed to add group ${group} (gid:${gid})"
		exit 1
	fi
	if ! adduser -h /home/ansible -s /bin/bash -G ${group} -D -u ${uid} ${user}; then
		>&2 echo "[ERR]  Failed to add user ${user} (uid:${uid})"
		exit 1
	fi
}

init_gpg_key() {
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
if env | grep -q '^INIT_GPG_KEY='; then
	if ! env | grep -q '^INIT_GPG_PASS='; then
		>&2 echo "[ERR]  When using \$INIT_GPG_KEY, you also need to specify \$INIT_GPG_PASS"
		exit 1
	fi
fi
if env | grep -q '^INIT_GPG_PASS='; then
	if ! env | grep -q '^INIT_GPG_KEY='; then
		>&2 echo "[ERR]  When using \$INIT_GPG_PASS, you also need to specify \$INIT_GPG_KEY"
		exit 1
	else
		echo "[INFO] Initializing gpg key for ${INIT_GPG_KEY}"
		INIT_GPG=1
	fi
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

	if [ "${INIT_GPG}" = "1" ]; then
		init_gpg_key "${MY_USER}" "${INIT_GPG_KEY}" "${INIT_GPG_PASS}"
	fi
	echo "[INFO] ansible> ${*}"
	exec su "${MY_USER}" -c "${*}"

else

	if [ "${INIT_GPG}" = "1" ]; then
		init_gpg_key "root" "${INIT_GPG_KEY}" "${INIT_GPG_PASS}"
	fi
	echo "[INFO] root> ${*}"
	exec "${@}"
fi
