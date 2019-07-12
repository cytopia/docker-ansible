# Docker image for `ansible`

[![Build Status](https://travis-ci.com/cytopia/docker-ansible.svg?branch=master)](https://travis-ci.com/cytopia/docker-ansible)
[![Tag](https://img.shields.io/github/tag/cytopia/docker-ansible.svg)](https://github.com/cytopia/docker-ansible/releases)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest "ansible")
[![](https://img.shields.io/badge/github-cytopia%2Fdocker--ansible-red.svg)](https://github.com/cytopia/docker-ansible "github.com/cytopia/docker-ansible")
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

> #### All [#awesome-ci](https://github.com/topics/awesome-ci) Docker images
>
> [ansible](https://github.com/cytopia/docker-ansible) **•**
> [ansible-lint](https://github.com/cytopia/docker-ansible-lint) **•**
> [awesome-ci](https://github.com/cytopia/awesome-ci) **•**
> [black](https://github.com/cytopia/docker-black) **•**
> [checkmake](https://github.com/cytopia/docker-checkmake) **•**
> [eslint](https://github.com/cytopia/docker-eslint) **•**
> [file-lint](https://github.com/cytopia/docker-file-lint) **•**
> [gofmt](https://github.com/cytopia/docker-gofmt) **•**
> [goimports](https://github.com/cytopia/docker-goimports) **•**
> [golint](https://github.com/cytopia/docker-golint) **•**
> [jsonlint](https://github.com/cytopia/docker-jsonlint) **•**
> [phpcbf](https://github.com/cytopia/docker-phpcbf) **•**
> [phpcs](https://github.com/cytopia/docker-phpcs) **•**
> [php-cs-fixer](https://github.com/cytopia/docker-php-cs-fixer) **•**
> [pycodestyle](https://github.com/cytopia/docker-pycodestyle) **•**
> [pylint](https://github.com/cytopia/docker-pylint) **•**
> [terraform-docs](https://github.com/cytopia/docker-terraform-docs) **•**
> [terragrunt](https://github.com/cytopia/docker-terragrunt) **•**
> [terragrunt-fmt](https://github.com/cytopia/docker-terragrunt-fmt) **•**
> [yamllint](https://github.com/cytopia/docker-yamllint)


> #### All [#awesome-ci](https://github.com/topics/awesome-ci) Makefiles
>
> Visit **[cytopia/makefiles](https://github.com/cytopia/makefiles)** for seamless project integration, minimum required best-practice code linting and CI.

View **[Dockerfile](https://github.com/cytopia/docker-ansible/blob/master/Dockerfile)** on GitHub.

[![Docker hub](http://dockeri.co/image/cytopia/ansible?&kill_cache=1)](https://hub.docker.com/r/cytopia/ansible)

Tiny Alpine-based multistage-build dockerized version of [Ansible](https://github.com/ansible/ansible)<sup>[1]</sup> in many different flavours.
The image is built nightly against multiple stable versions and pushed to Dockerhub.

<sup>[1] Official project: https://github.com/ansible/ansible</sup>


## Available Docker image versions

### Ansible base
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest "ansible")

The following Ansible Docker images are as small as possible and only contain Ansible itself.

| Docker tag | Build from                          |
|------------|-------------------------------------|
| `latest`   | Latest stable Ansible version       |
| `2.8`      | Latest stable Ansible 2.8.x version |
| `2.7`      | Latest stable Ansible 2.7.x version |
| `2.6`      | Latest stable Ansible 2.6.x version |
| `2.5`      | Latest stable Ansible 2.5.x version |
| `2.4`      | Latest stable Ansible 2.4.x version |
| `2.3`      | Latest stable Ansible 2.3.x version |

### Ansible tools
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-tools.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-tools "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-tools.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-tools "ansible")

The following Ansible Docker images contain everything from `Ansible base` and additionally: `bash`, `git`, `gpg`, `jq` and `ssh`.

| Docker tag     | Build from                          |
|----------------|-------------------------------------|
| `latest-tools` | Latest stable Ansible version       |
| `2.8-tools`    | Latest stable Ansible 2.8.x version |
| `2.7-tools`    | Latest stable Ansible 2.7.x version |
| `2.6-tools`    | Latest stable Ansible 2.6.x version |
| `2.5-tools`    | Latest stable Ansible 2.5.x version |
| `2.4-tools`    | Latest stable Ansible 2.4.x version |
| `2.3-tools`    | Latest stable Ansible 2.3.x version |

### Ansible aws
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-aws.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-aws "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-aws.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-aws "ansible")

The following Ansible Docker images contain everything from `Ansible tools` and additionally: `aws-cli`, `boto`, `boto3` and `botocore`.

| Docker tag   | Build from                          |
|--------------|-------------------------------------|
| `latest-aws` | Latest stable Ansible version       |
| `2.8-aws`    | Latest stable Ansible 2.8.x version |
| `2.7-aws`    | Latest stable Ansible 2.7.x version |
| `2.6-aws`    | Latest stable Ansible 2.6.x version |
| `2.5-aws`    | Latest stable Ansible 2.5.x version |
| `2.4-aws`    | Latest stable Ansible 2.4.x version |
| `2.3-aws`    | Latest stable Ansible 2.3.x version |

### Ansible awsk8s
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awsk8s.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awsk8s "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awsk8s.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awsk8s "ansible")

The following Ansible Docker images contain everything from `Ansible aws` and additionally: `openshift` and `kubectl`.

| Docker tag      | Build from                          |
|-----------------|-------------------------------------|
| `latest-awsk8s` | Latest stable Ansible version       |
| `2.8-awsk8s`    | Latest stable Ansible 2.8.x version |
| `2.7-awsk8s`    | Latest stable Ansible 2.7.x version |
| `2.6-awsk8s`    | Latest stable Ansible 2.6.x version |
| `2.5-awsk8s`    | Latest stable Ansible 2.5.x version |
| `2.4-awsk8s`    | Latest stable Ansible 2.4.x version |
| `2.3-awsk8s`    | Latest stable Ansible 2.3.x version |

### Ansible awskops
The following Ansible Docker images contain everything from `Ansible awsk8s` and additionally: `kops` in its latest patch level version.

#### Kops 1.12 (latest 1.12.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.12.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.12 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.12.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.12 "ansible")

| Docker tag           | Build from                          |
|----------------------|-------------------------------------|
| `latest-awskops1.12` | Latest stable Ansible version       |
| `2.8-awskops1.12`    | Latest stable Ansible 2.8.x version |
| `2.7-awskops1.12`    | Latest stable Ansible 2.7.x version |
| `2.6-awskops1.12`    | Latest stable Ansible 2.6.x version |
| `2.5-awskops1.12`    | Latest stable Ansible 2.5.x version |
| `2.4-awskops1.12`    | Latest stable Ansible 2.4.x version |
| `2.3-awskops1.12`    | Latest stable Ansible 2.3.x version |

#### Kops 1.11 (latest 1.11.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.11.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.11 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.11.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.11 "ansible")

| Docker tag           | Build from                          |
|----------------------|-------------------------------------|
| `latest-awskops1.11` | Latest stable Ansible version       |
| `2.8-awskops1.11`    | Latest stable Ansible 2.8.x version |
| `2.7-awskops1.11`    | Latest stable Ansible 2.7.x version |
| `2.6-awskops1.11`    | Latest stable Ansible 2.6.x version |
| `2.5-awskops1.11`    | Latest stable Ansible 2.5.x version |
| `2.4-awskops1.11`    | Latest stable Ansible 2.4.x version |
| `2.3-awskops1.11`    | Latest stable Ansible 2.3.x version |

#### Kops 1.10 (latest 1.10.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.10.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.10 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.10.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.10 "ansible")

| Docker tag           | Build from                          |
|----------------------|-------------------------------------|
| `latest-awskops1.10` | Latest stable Ansible version       |
| `2.8-awskops1.10`    | Latest stable Ansible 2.8.x version |
| `2.7-awskops1.10`    | Latest stable Ansible 2.7.x version |
| `2.6-awskops1.10`    | Latest stable Ansible 2.6.x version |
| `2.5-awskops1.10`    | Latest stable Ansible 2.5.x version |
| `2.4-awskops1.10`    | Latest stable Ansible 2.4.x version |
| `2.3-awskops1.10`    | Latest stable Ansible 2.3.x version |

#### Kops 1.9 (latest 1.9.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.9.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.9 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.9.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.9 "ansible")

| Docker tag           | Build from                          |
|----------------------|-------------------------------------|
| `latest-awskops1.9` | Latest stable Ansible version       |
| `2.8-awskops1.9`    | Latest stable Ansible 2.8.x version |
| `2.7-awskops1.9`    | Latest stable Ansible 2.7.x version |
| `2.6-awskops1.9`    | Latest stable Ansible 2.6.x version |
| `2.5-awskops1.9`    | Latest stable Ansible 2.5.x version |
| `2.4-awskops1.9`    | Latest stable Ansible 2.4.x version |
| `2.3-awskops1.9`    | Latest stable Ansible 2.3.x version |

#### Kops 1.8 (latest 1.8.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.8.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.8 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.8.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.8 "ansible")

| Docker tag           | Build from                          |
|----------------------|-------------------------------------|
| `latest-awskops1.8` | Latest stable Ansible version       |
| `2.8-awskops1.8`    | Latest stable Ansible 2.8.x version |
| `2.7-awskops1.8`    | Latest stable Ansible 2.7.x version |
| `2.6-awskops1.8`    | Latest stable Ansible 2.6.x version |
| `2.5-awskops1.8`    | Latest stable Ansible 2.5.x version |
| `2.4-awskops1.8`    | Latest stable Ansible 2.4.x version |
| `2.3-awskops1.8`    | Latest stable Ansible 2.3.x version |

### Ansible awshelm
The following Ansible Docker images contain everything from `Ansible awsk8s` and additionally: `helm` in its latest patch level version.

#### Helm 2.14 (latest 2.14.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm2.14.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.14 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm2.14.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.14 "ansible")

| Docker tag           | Build from                          |
|----------------------|-------------------------------------|
| `latest-awshelm2.14` | Latest stable Ansible version       |
| `2.8-awshelm2.14`    | Latest stable Ansible 2.8.x version |
| `2.7-awshelm2.14`    | Latest stable Ansible 2.7.x version |
| `2.6-awshelm2.14`    | Latest stable Ansible 2.6.x version |
| `2.5-awshelm2.14`    | Latest stable Ansible 2.5.x version |
| `2.4-awshelm2.14`    | Latest stable Ansible 2.4.x version |
| `2.3-awshelm2.14`    | Latest stable Ansible 2.3.x version |

#### Heml 2.13 (latest 2.13.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm2.13.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.13 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm2.13.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.13 "ansible")

| Docker tag           | Build from                          |
|----------------------|-------------------------------------|
| `latest-awshelm2.13` | Latest stable Ansible version       |
| `2.8-awshelm2.13`    | Latest stable Ansible 2.8.x version |
| `2.7-awshelm2.13`    | Latest stable Ansible 2.7.x version |
| `2.6-awshelm2.13`    | Latest stable Ansible 2.6.x version |
| `2.5-awshelm2.13`    | Latest stable Ansible 2.5.x version |
| `2.4-awshelm2.13`    | Latest stable Ansible 2.4.x version |
| `2.3-awshelm2.13`    | Latest stable Ansible 2.3.x version |

#### Helm 2.12 (latest 2.12.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm2.12.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.12 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm2.12.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.12 "ansible")

| Docker tag           | Build from                          |
|----------------------|-------------------------------------|
| `latest-awshelm2.12` | Latest stable Ansible version       |
| `2.8-awshelm2.12`    | Latest stable Ansible 2.8.x version |
| `2.7-awshelm2.12`    | Latest stable Ansible 2.7.x version |
| `2.6-awshelm2.12`    | Latest stable Ansible 2.6.x version |
| `2.5-awshelm2.12`    | Latest stable Ansible 2.5.x version |
| `2.4-awshelm2.12`    | Latest stable Ansible 2.4.x version |
| `2.3-awshelm2.12`    | Latest stable Ansible 2.3.x version |

#### Helm 2.11 (latest 2.11.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm2.11.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.11 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm2.11.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.11 "ansible")

| Docker tag           | Build from                          |
|----------------------|-------------------------------------|
| `latest-awshelm2.11` | Latest stable Ansible version       |
| `2.8-awshelm2.11`    | Latest stable Ansible 2.8.x version |
| `2.7-awshelm2.11`    | Latest stable Ansible 2.7.x version |
| `2.6-awshelm2.11`    | Latest stable Ansible 2.6.x version |
| `2.5-awshelm2.11`    | Latest stable Ansible 2.5.x version |
| `2.4-awshelm2.11`    | Latest stable Ansible 2.4.x version |
| `2.3-awshelm2.11`    | Latest stable Ansible 2.3.x version |


## Docker environment variables

Environment variables are available for all flavours except for `Ansible base`.

| Variable | Default | Allowed values | Description |
|----------|---------|----------------|-------------|
| `USER`   | ``      | `ansible`      | Set this to `ansible` to have everything run inside the container by the user `ansible` instead of `root` |
| `UID`    | `1000`  | integer        | If your local uid is not `1000` set it to your uid to syncronize file/dir permissions during mounting |
| `GID`    | `1000`  | integer        | If your local gid is not `1000` set it to your gid to syncronize file/dir permissions during mounting |


## Docker mounts

The working directory inside the Docker container is **`/data/`** and should be mounted locally to
the root of your project where your Ansible playbooks are.


## Examples

### Run Ansible playbook
```bash
docker run --rm -v $(pwd):/data cytopia/ansible ansible-playbook playbook.yml
```

### Run Ansible playbook with non-root user
```bash
# Use 'ansible' user inside Docker container
docker run --rm \
  -e USER=ansible \
  -v $(pwd):/data \
  cytopia/ansible:latest-tools ansible-playbook playbook.yml
```
```bash
# Use 'ansible' user inside Docker container
# Use custom uid/gid for 'ansible' user inside Docker container
docker run --rm \
  -e USER=ansible \
  -e MY_UID=1000 \
  -e MY_GID=1000 \
  -v $(pwd):/data \
  cytopia/ansible:latest-tools ansible-playbook playbook.yml
```

### Run Ansible playbook with local ssh keys mounted
```bash
# Ensure to set same uid/gid as on your local system for Docker user
# to prevent permission issues during docker mounts
docker run --rm \
  -e USER=ansible \
  -e MY_UID=1000 \
  -e MY_GID=1000 \
  -v ${HOME}/.ssh/:/home/ansible/.ssh/:ro \
  -v $(pwd):/data \
  cytopia/ansible:latest-tools ansible-playbook playbook.yml
```

### Run Ansible playbook with local gpg keys mounted
```bash
# Ensure to set same uid/gid as on your local system for Docker user
# to prevent permission issues during docker mounts
docker run --rm \
  -e USER=ansible \
  -e MY_UID=1000 \
  -e MY_GID=1000 \
  -v ${HOME}/.gnupg/:/home/ansible/.gnupg/ \
  -v $(pwd):/data \
  cytopia/ansible:latest-tools ansible-playbook playbook.yml
```

### Run Ansible Galaxy
```bash
# Ensure to set same uid/gid as on your local system for Docker user
# to prevent permission issues during docker mounts
docker run --rm \
  -e USER=ansible \
  -e MY_UID=1000 \
  -e MY_GID=1000 \
  -v $(pwd):/data \
  cytopia/ansible:latest-tools ansible-galaxy install -r requirements.yml
```

### Run Ansible playbook with AWS credentials
```bash
# Basic
docker run --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -v $(pwd):/data \
  cytopia/ansible:latest-aws ansible-playbook playbook.yml
```
```bash
# With AWS Session Token
docker run --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \
  -v $(pwd):/data \
  cytopia/ansible:latest-aws ansible-playbook playbook.yml
```
```bash
# With ~/.aws/ config and credentials directories mounted (read/only)
# If you want to make explicit use of aws profiles, use this variant
# Ensure to set same uid/gid as on your local system for Docker user
# to prevent permission issues during docker mounts
docker run --rm \
  -e USER=ansible \
  -e MY_UID=1000 \
  -e MY_GID=1000 \
  -v ${HOME}/.aws/config:/home/ansible/.aws/config:ro \
  -v ${HOME}/.aws/credentials:/home/ansible/.aws/credentials:ro \
  -v $(pwd):/data \
  cytopia/ansible:latest-aws ansible-playbook playbook.yml
```

### Run Ansible playbook against AWS and gpg vault initialization
Imagine your Ansible vault uses a script to gpg encrypt the passphrase for team members against
multiple gpg keys. Using Docker will not allow you to have a popup open where you can enter the
gpg key password. To circumvent this, you will need to initialize the gpg key password and then
run Ansible.

The following Ansible vault script which can be shows how this is setup:
```bash
#!/bin/sh
# Read password from argument
if [ "${#}" -gt "0" ]; then
	gpg --pinentry-mode loopback --passphrase "${1}" --decrypt vault/pass.gpg
# Ask for password or use keyring (does not work inside Docker)
else
	gpg --batch --use-agent --decrypt vault/pass.gpg
fi
```

With this in mind the Ansible call would look as follows
```bash
# Ensure to set same uid/gid as on your local system for Docker user
# to prevent permission issues during docker mounts
docker run --rm \
  -e USER=ansible \
  -e MY_UID=1000 \
  -e MY_GID=1000 \
  -v ${HOME}/.aws/config:/home/ansible/.aws/config:ro \
  -v ${HOME}/.aws/credentials:/home/ansible/.aws/credentials:ro \
  -v ${HOME}/.gnupg/:/home/ansible/.gnupg/ \
  -v $(pwd):/data \
  cytopia/ansible \
  sh -c './vault/open_vault.sh '''THE_GPG_PASSWORD_HERE'''; ansible-playbook playbook.yml'
```
* **Note 1:** the quoting for the GPG password is required in case you are using a `!` as part of the passwort
* **Note 2:** every `$` sign in your password will require 3 backslashes in front of it: `\\\$`

As the command is getting pretty long, you could wrap it into a Makefile.
```make
ifneq (,)
.error This Makefile requires GNU Make.
endif

.PHONY: dry run

CURRENT_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
GPG_PASS =

dry:
	docker run --rm \
		-e USER=ansible \
		-e MY_UID=1000 \
		-e MY_GID=1000 \
		-v $${HOME}/.aws/config:/home/ansible/.aws/config:ro \
		-v $${HOME}/.aws/credentials:/home/ansible/.aws/credentials:ro \
		-v $${HOME}/.gnupg/:/home/ansible/.gnupg/ \
		-v $(CURRENT_DIR):/data \
		cytopia/ansible \
		sh -c './vault/open_vault.sh '''$(GPG_PASS)'''; ansible-playbook playbook.yml --check'

run:
	docker run --rm \
		-e USER=ansible \
		-e MY_UID=1000 \
		-e MY_GID=1000 \
		-v $${HOME}/.aws/config:/home/ansible/.aws/config:ro \
		-v $${HOME}/.aws/credentials:/home/ansible/.aws/credentials:ro \
		-v $${HOME}/.gnupg/:/home/ansible/.gnupg/ \
		-v $(CURRENT_DIR):/data \
		cytopia/ansible \
		sh -c './vault/open_vault.sh '''$(GPG_PASS)'''; ansible-playbook playbook.yml'
```

Then you can call it easily:
```bash
make dry GPG_PASS='THE_GPG_PASSWORD_HERE'
make run GPG_PASS='THE_GPG_PASSWORD_HERE'
```


## Related [#awesome-ci](https://github.com/topics/awesome-ci) projects

### Docker images

Save yourself from installing lot's of dependencies and pick a dockerized version of your favourite
linter below for reproducible local or remote CI tests:

| Docker image | Type | Description |
|--------------|------|-------------|
| [awesome-ci](https://github.com/cytopia/awesome-ci) | Basic | Tools for git, file and static source code analysis |
| [file-lint](https://github.com/cytopia/docker-file-lint) | Basic | Baisc source code analysis |
| [jsonlint](https://github.com/cytopia/docker-jsonlint) | Basic | Lint JSON files **<sup>[1]</sup>** |
| [yamllint](https://github.com/cytopia/docker-yamllint) | Basic | Lint Yaml files |
| [ansible](https://github.com/cytopia/docker-ansible) | Ansible | Multiple versoins of Ansible |
| [ansible-lint](https://github.com/cytopia/docker-ansible-lint) | Ansible | Lint  Ansible |
| [gofmt](https://github.com/cytopia/docker-gofmt) | Go | Format Go source code **<sup>[1]</sup>** |
| [goimports](https://github.com/cytopia/docker-goimports) | Go | Format Go source code **<sup>[1]</sup>** |
| [golint](https://github.com/cytopia/docker-golint) | Go | Lint Go code |
| [eslint](https://github.com/cytopia/docker-eslint) | Javascript | Lint Javascript code |
| [checkmake](https://github.com/cytopia/docker-checkmake) | Make | Lint Makefiles |
| [phpcbf](https://github.com/cytopia/docker-phpcbf) | PHP | PHP Code Beautifier and Fixer |
| [phpcs](https://github.com/cytopia/docker-phpcs) | PHP | PHP Code Sniffer |
| [php-cs-fixer](https://github.com/cytopia/docker-php-cs-fixer) | PHP | PHP Coding Standards Fixer |
| [black](https://github.com/cytopia/docker-black) | Python | The uncompromising Python code formatter |
| [pycodestyle](https://github.com/cytopia/docker-pycodestyle) | Python | Python style guide checker |
| [pylint](https://github.com/cytopia/docker-pylint) | Python | Python source code, bug and quality checker |
| [terraform-docs](https://github.com/cytopia/docker-terraform-docs) | Terraform | Terraform doc generator (TF 0.12 ready) **<sup>[1]</sup>** |
| [terragrunt](https://github.com/cytopia/docker-terragrunt) | Terraform | Terragrunt and Terraform |
| [terragrunt-fmt](https://github.com/cytopia/docker-terragrunt-fmt) | Terraform | `terraform fmt` for Terragrunt files **<sup>[1]</sup>** |

> **<sup>[1]</sup>** Uses a shell wrapper to add **enhanced functionality** not available by original project.


### Makefiles

Visit **[cytopia/makefiles](https://github.com/cytopia/makefiles)** for dependency-less, seamless project integration and minimum required best-practice code linting for CI.
The provided Makefiles will only require GNU Make and Docker itself removing the need to install anything else.


## License

**[MIT License](LICENSE)**

Copyright (c) 2019 [cytopia](https://github.com/cytopia)
