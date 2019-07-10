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


###
### Run with root or ansible user?
###
if ! env | grep -q '^USER='; then
	exec "${@}"
elif [ "${USER}" != "ansible" ]; then
	exec "${@}"
fi



###
### Gather new UID/GID
###
if env | grep -q '^UID='; then
	# Change UID
	MY_UID="$( env | grep '^UID=' | sed 's/^UID=//g' )"
	# Change GID (maybe)
	if env | grep -q '^GID='; then
		MY_GID="$( env | grep '^GID=' | sed 's/^GID=//g' )"
	fi
elif env | grep -q '^GID='; then
	# Change GID
	MY_GID="$( env | grep '^GID=' | sed 's/^GID=//g' )"
fi


###
### Recreate user (alpine has no usermod by default, so that's currently the only way)
###
if [ "${MY_UID}" != "${DEFAULT_UID}" ] || [ "${MY_GID}" != "${DEFAULT_GID}" ]; then
	# Remove previous user/group
	deluser "${MY_USER}"
	# Add new user/group
	addgroup -g ${MY_GID} ${MY_GROUP}
	adduser -h /home/ansible -s /bin/bash -G ${MY_GROUP} -D -u ${MY_UID} ${MY_USER}
fi


###
### Execute command as 'ansible' user
###
exec su "${MY_USER}" -c "${@}"
