# Docker image for `ansible`

[![Tag](https://img.shields.io/github/tag/cytopia/docker-ansible.svg)](https://github.com/cytopia/docker-ansible/releases)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest "ansible")
[![](https://img.shields.io/docker/pulls/cytopia/ansible.svg)](https://hub.docker.com/r/cytopia/ansible)
[![](https://img.shields.io/badge/github-cytopia%2Fdocker--ansible-red.svg)](https://github.com/cytopia/docker-ansible "github.com/cytopia/docker-ansible")
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

[![Build Status](https://github.com/cytopia/docker-ansible/workflows/lint/badge.svg)](https://github.com/cytopia/docker-ansible/actions?workflow=lint)
[![Build Status](https://github.com/cytopia/docker-ansible/workflows/build/badge.svg)](https://github.com/cytopia/docker-ansible/actions?workflow=build)
[![Build Status](https://github.com/cytopia/docker-ansible/workflows/build-kops/badge.svg)](https://github.com/cytopia/docker-ansible/actions?workflow=build-kops)
[![Build Status](https://github.com/cytopia/docker-ansible/workflows/build-helm/badge.svg)](https://github.com/cytopia/docker-ansible/actions?workflow=build-helm)

[![Build Status](https://github.com/cytopia/docker-ansible/workflows/nightly/badge.svg)](https://github.com/cytopia/docker-ansible/actions?workflow=nightly)
[![Build Status](https://github.com/cytopia/docker-ansible/workflows/nightly-kops/badge.svg)](https://github.com/cytopia/docker-ansible/actions?workflow=nightly-kops)
[![Build Status](https://github.com/cytopia/docker-ansible/workflows/nightly-helm/badge.svg)](https://github.com/cytopia/docker-ansible/actions?workflow=nightly-helm)


> #### All [#awesome-ci](https://github.com/topics/awesome-ci) Docker images
>
> [ansible][ansible-git-lnk] **•**
> [ansible-lint][alint-git-lnk] **•**
> [awesome-ci][aci-git-lnk] **•**
> [black][black-git-lnk] **•**
> [checkmake][cm-git-lnk] **•**
> [eslint][elint-git-lnk] **•**
> [file-lint][flint-git-lnk] **•**
> [gofmt][gfmt-git-lnk] **•**
> [goimports][gimp-git-lnk] **•**
> [golint][glint-git-lnk] **•**
> [jsonlint][jlint-git-lnk] **•**
> [linkcheck][linkcheck-git-lnk] **•**
> [mypy][mypy-git-lnk] **•**
> [phpcbf][pcbf-git-lnk] **•**
> [phpcs][pcs-git-lnk] **•**
> [phplint][plint-git-lnk] **•**
> [php-cs-fixer][pcsf-git-lnk] **•**
> [pycodestyle][pycs-git-lnk] **•**
> [pydocstyle][pyds-git-lnk] **•**
> [pylint][pylint-git-lnk] **•**
> [terraform-docs][tfdocs-git-lnk] **•**
> [terragrunt][tg-git-lnk] **•**
> [terragrunt-fmt][tgfmt-git-lnk] **•**
> [yamlfmt][yfmt-git-lnk] **•**
> [yamllint][ylint-git-lnk]

> #### All [#awesome-ci](https://github.com/topics/awesome-ci) Makefiles
>
> Visit **[cytopia/makefiles](https://github.com/cytopia/makefiles)** for seamless project integration, minimum required best-practice code linting and CI.

View **[Dockerfile](https://github.com/cytopia/docker-ansible/blob/master/Dockerfile)** on GitHub.

[![Docker hub](http://dockeri.co/image/cytopia/ansible?&kill_cache=1)](https://hub.docker.com/r/cytopia/ansible)

Tiny Alpine-based multistage-build dockerized version of [Ansible](https://github.com/ansible/ansible)<sup>[1]</sup> in many different flavours.
It comes with **[Mitogen](https://github.com/dw/mitogen)**<sup>[2]</sup> to speed up your runs by up to **600%**<sup>[3][4]</sup> (see [Examples](#run-ansible-playbook-with-mitogen)).
The image is built nightly against multiple stable versions and pushed to Dockerhub.

* <sup>[1] Official project: https://github.com/ansible/ansible</sup>
* <sup>[2] Official project: https://github.com/dw/mitogen</sup>
* <sup>[3] [How to Speed Up Your Ansible Playbooks Over 600%](https://www.toptechskills.com/ansible-tutorials-courses/speed-up-ansible-playbooks-pipelining-mitogen/)</sup>
* <sup>[4] [Mitogen for Ansible](https://networkgenomics.com/ansible/)</sup>


## Available Docker image versions

This repository provides many different Ansible flavours (each flavour also divided into different Ansible versions).
The following table shows a quick overview. For more details see further down below.

| Flavour | Based on | Additional Python libs | Additional binaries |
|---------|---------------|------------------------|---------------------|
| base    | -        | `cffi`, `cryptography`, `Jinja2`, `paramiko`, `PyYAML` | - |
| tools   | base     | `dnspython`, `mitogen` | `bash`, `git`, `gpg`, `jq`, `ssh`, `yq` |
| infra   | tools    | `docker`, `docker-compose`, `jsondiff`, `pexpect`, `psycopg2`, `pypsexec`, `pymongo`, `PyMySQL`, `smbprotocol` | `rsync` |
| azure   | tools    | `azure-*`              | - |
| aws     | tools    | `awscli`, `botocore`, `boto`, `boto3` | `aws`, `aws-iam-authenticator` |
| awsk8s  | aws      | `openshift`            | `kubectl`, `oc` |
| awskops | awsk8s   | -                      | `kops` |
| awshelm | awsk8s   | -                      | `helm` |


### Ansible base
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest "ansible")

The following Ansible Docker images are as small as possible and only contain Ansible itself.

| Docker tag | Build from                           |
|------------|--------------------------------------|
| `latest`   | Latest stable Ansible version        |
| `2.10`     | Latest stable Ansible 2.10.x version |
| `2.9`      | Latest stable Ansible 2.9.x version  |
| `2.8`      | Latest stable Ansible 2.8.x version  |
| `2.7`      | Latest stable Ansible 2.7.x version  |
| `2.6`      | Latest stable Ansible 2.6.x version  |
| `2.5`      | Latest stable Ansible 2.5.x version  |
| `2.4`      | Latest stable Ansible 2.4.x version  |
| `2.3`      | Latest stable Ansible 2.3.x version  |

### Ansible tools
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-tools.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-tools "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-tools.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-tools "ansible")

The following Ansible Docker images contain everything from `Ansible base` and additionally: `bash`, `git`, `gpg`, `jq`, `ssh` and `dnspython` and Ansible **`mitogen`** strategy plugin (see [Examples](#run-ansible-playbook-with-mitogen)).

| Docker tag     | Build from                           |
|----------------|--------------------------------------|
| `latest-tools` | Latest stable Ansible version        |
| `2.10-tools`   | Latest stable Ansible 2.10.x version |
| `2.9-tools`    | Latest stable Ansible 2.9.x version  |
| `2.8-tools`    | Latest stable Ansible 2.8.x version  |
| `2.7-tools`    | Latest stable Ansible 2.7.x version  |
| `2.6-tools`    | Latest stable Ansible 2.6.x version  |
| `2.5-tools`    | Latest stable Ansible 2.5.x version  |
| `2.4-tools`    | Latest stable Ansible 2.4.x version  |
| `2.3-tools`    | Latest stable Ansible 2.3.x version  |

### Ansible infra
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-infra.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-infra "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-infra.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-infra "ansible")

The following Ansible Docker images contain everything from `Ansible tools` and additionally: `docker`, `pexpect`, `psycopg2`, `pypsexec`, `pymongo`, `PyMySQL` and `smbprotocol` Python libraries.

| Docker tag     | Build from                           |
|----------------|--------------------------------------|
| `latest-infra` | Latest stable Ansible version        |
| `2.10-infra`   | Latest stable Ansible 2.10.x version |
| `2.9-infra`    | Latest stable Ansible 2.9.x version  |
| `2.8-infra`    | Latest stable Ansible 2.8.x version  |
| `2.7-infra`    | Latest stable Ansible 2.7.x version  |
| `2.6-infra`    | Latest stable Ansible 2.6.x version  |
| `2.5-infra`    | Latest stable Ansible 2.5.x version  |
| `2.4-infra`    | Latest stable Ansible 2.4.x version  |
| `2.3-infra`    | Latest stable Ansible 2.3.x version  |

### Ansible azure
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-azure.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-azure "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-azure.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-azure "ansible")

The following Ansible Docker images contain everything from `Ansible tools` and additionally: `azure`.

| Docker tag     | Build from                           |
|----------------|--------------------------------------|
| `latest-azure` | Latest stable Ansible version        |
| `2.10-azure`   | Latest stable Ansible 2.10.x version |
| `2.9-azure`    | Latest stable Ansible 2.9.x version  |
| `2.8-azure`    | Latest stable Ansible 2.8.x version  |
| `2.7-azure`    | Latest stable Ansible 2.7.x version  |
| `2.6-azure`    | Latest stable Ansible 2.6.x version  |
| `2.5-azure`    | Latest stable Ansible 2.5.x version  |
| `2.4-azure`    | Latest stable Ansible 2.4.x version  |
| `2.3-azure`    | Latest stable Ansible 2.3.x version  |

### Ansible aws
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-aws.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-aws "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-aws.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-aws "ansible")

The following Ansible Docker images contain everything from `Ansible tools` and additionally: `aws-cli`, `boto`, `boto3` and `botocore`.

| Docker tag   | Build from                           |
|--------------|--------------------------------------|
| `latest-aws` | Latest stable Ansible version        |
| `2.10-aws`   | Latest stable Ansible 2.10.x version |
| `2.9-aws`    | Latest stable Ansible 2.9.x version  |
| `2.8-aws`    | Latest stable Ansible 2.8.x version  |
| `2.7-aws`    | Latest stable Ansible 2.7.x version  |
| `2.6-aws`    | Latest stable Ansible 2.6.x version  |
| `2.5-aws`    | Latest stable Ansible 2.5.x version  |
| `2.4-aws`    | Latest stable Ansible 2.4.x version  |
| `2.3-aws`    | Latest stable Ansible 2.3.x version  |

### Ansible awsk8s
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awsk8s.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awsk8s "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awsk8s.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awsk8s "ansible")

The following Ansible Docker images contain everything from `Ansible aws` and additionally: `openshift` and `kubectl`.

| Docker tag      | Build from                           |
|-----------------|--------------------------------------|
| `latest-awsk8s` | Latest stable Ansible version        |
| `2.10-awsk8s`   | Latest stable Ansible 2.10.x version |
| `2.9-awsk8s`    | Latest stable Ansible 2.9.x version  |
| `2.8-awsk8s`    | Latest stable Ansible 2.8.x version  |
| `2.7-awsk8s`    | Latest stable Ansible 2.7.x version  |
| `2.6-awsk8s`    | Latest stable Ansible 2.6.x version  |
| `2.5-awsk8s`    | Latest stable Ansible 2.5.x version  |
| `2.4-awsk8s`    | Latest stable Ansible 2.4.x version  |
| `2.3-awsk8s`    | Latest stable Ansible 2.3.x version  |

### Ansible awskops
The following Ansible Docker images contain everything from `Ansible awsk8s` and additionally: `kops` in its latest patch level version.

> https://github.com/kubernetes/kops/releases

#### Kops 1.18 (latest 1.18.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.18.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.18 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.18.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.18 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awskops1.18` | Latest stable Ansible version        |
| `2.10-awskops1.18`   | Latest stable Ansible 2.10.x version |
| `2.9-awskops1.18`    | Latest stable Ansible 2.9.x version  |
| `2.8-awskops1.18`    | Latest stable Ansible 2.8.x version  |
| `2.7-awskops1.18`    | Latest stable Ansible 2.7.x version  |
| `2.6-awskops1.18`    | Latest stable Ansible 2.6.x version  |
| `2.5-awskops1.18`    | Latest stable Ansible 2.5.x version  |
| `2.4-awskops1.18`    | Latest stable Ansible 2.4.x version  |
| `2.3-awskops1.18`    | Latest stable Ansible 2.3.x version  |

#### Kops 1.17 (latest 1.17.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.17.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.17 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.17.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.17 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awskops1.17` | Latest stable Ansible version        |
| `2.10-awskops1.17`   | Latest stable Ansible 2.10.x version |
| `2.9-awskops1.17`    | Latest stable Ansible 2.9.x version  |
| `2.8-awskops1.17`    | Latest stable Ansible 2.8.x version  |
| `2.7-awskops1.17`    | Latest stable Ansible 2.7.x version  |
| `2.6-awskops1.17`    | Latest stable Ansible 2.6.x version  |
| `2.5-awskops1.17`    | Latest stable Ansible 2.5.x version  |
| `2.4-awskops1.17`    | Latest stable Ansible 2.4.x version  |
| `2.3-awskops1.17`    | Latest stable Ansible 2.3.x version  |

#### Kops 1.16 (latest 1.16.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.16.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.16 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.16.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.16 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awskops1.16` | Latest stable Ansible version        |
| `2.10-awskops1.16`   | Latest stable Ansible 2.10.x version |
| `2.9-awskops1.16`    | Latest stable Ansible 2.9.x version  |
| `2.8-awskops1.16`    | Latest stable Ansible 2.8.x version  |
| `2.7-awskops1.16`    | Latest stable Ansible 2.7.x version  |
| `2.6-awskops1.16`    | Latest stable Ansible 2.6.x version  |
| `2.5-awskops1.16`    | Latest stable Ansible 2.5.x version  |
| `2.4-awskops1.16`    | Latest stable Ansible 2.4.x version  |
| `2.3-awskops1.16`    | Latest stable Ansible 2.3.x version  |

#### Kops 1.15 (latest 1.15.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.15.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.15 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.15.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.15 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awskops1.15` | Latest stable Ansible version        |
| `2.10-awskops1.15`   | Latest stable Ansible 2.10.x version |
| `2.9-awskops1.15`    | Latest stable Ansible 2.9.x version  |
| `2.8-awskops1.15`    | Latest stable Ansible 2.8.x version  |
| `2.7-awskops1.15`    | Latest stable Ansible 2.7.x version  |
| `2.6-awskops1.15`    | Latest stable Ansible 2.6.x version  |
| `2.5-awskops1.15`    | Latest stable Ansible 2.5.x version  |
| `2.4-awskops1.15`    | Latest stable Ansible 2.4.x version  |
| `2.3-awskops1.15`    | Latest stable Ansible 2.3.x version  |

#### Kops 1.14 (latest 1.14.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.14.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.14 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.14.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.14 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awskops1.14` | Latest stable Ansible version        |
| `2.10-awskops1.14`   | Latest stable Ansible 2.10.x version |
| `2.9-awskops1.14`    | Latest stable Ansible 2.9.x version  |
| `2.8-awskops1.14`    | Latest stable Ansible 2.8.x version  |
| `2.7-awskops1.14`    | Latest stable Ansible 2.7.x version  |
| `2.6-awskops1.14`    | Latest stable Ansible 2.6.x version  |
| `2.5-awskops1.14`    | Latest stable Ansible 2.5.x version  |
| `2.4-awskops1.14`    | Latest stable Ansible 2.4.x version  |
| `2.3-awskops1.14`    | Latest stable Ansible 2.3.x version  |

#### Kops 1.13 (latest 1.13.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.13.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.13 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.13.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.13 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awskops1.13` | Latest stable Ansible version        |
| `2.10-awskops1.13`   | Latest stable Ansible 2.10.x version |
| `2.9-awskops1.13`    | Latest stable Ansible 2.9.x version  |
| `2.8-awskops1.13`    | Latest stable Ansible 2.8.x version  |
| `2.7-awskops1.13`    | Latest stable Ansible 2.7.x version  |
| `2.6-awskops1.13`    | Latest stable Ansible 2.6.x version  |
| `2.5-awskops1.13`    | Latest stable Ansible 2.5.x version  |
| `2.4-awskops1.13`    | Latest stable Ansible 2.4.x version  |
| `2.3-awskops1.13`    | Latest stable Ansible 2.3.x version  |

#### Kops 1.12 (latest 1.12.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.12.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.12 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.12.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.12 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awskops1.12` | Latest stable Ansible version        |
| `2.10-awskops1.12`   | Latest stable Ansible 2.10.x version |
| `2.9-awskops1.12`    | Latest stable Ansible 2.9.x version  |
| `2.8-awskops1.12`    | Latest stable Ansible 2.8.x version  |
| `2.7-awskops1.12`    | Latest stable Ansible 2.7.x version  |
| `2.6-awskops1.12`    | Latest stable Ansible 2.6.x version  |
| `2.5-awskops1.12`    | Latest stable Ansible 2.5.x version  |
| `2.4-awskops1.12`    | Latest stable Ansible 2.4.x version  |
| `2.3-awskops1.12`    | Latest stable Ansible 2.3.x version  |

#### Kops 1.11 (latest 1.11.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.11.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.11 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.11.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.11 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awskops1.11` | Latest stable Ansible version        |
| `2.10-awskops1.11`   | Latest stable Ansible 2.10.x version |
| `2.9-awskops1.11`    | Latest stable Ansible 2.9.x version  |
| `2.8-awskops1.11`    | Latest stable Ansible 2.8.x version  |
| `2.7-awskops1.11`    | Latest stable Ansible 2.7.x version  |
| `2.6-awskops1.11`    | Latest stable Ansible 2.6.x version  |
| `2.5-awskops1.11`    | Latest stable Ansible 2.5.x version  |
| `2.4-awskops1.11`    | Latest stable Ansible 2.4.x version  |
| `2.3-awskops1.11`    | Latest stable Ansible 2.3.x version  |

#### Kops 1.10 (latest 1.10.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.10.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.10 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.10.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.10 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awskops1.10` | Latest stable Ansible version        |
| `2.10-awskops1.10`   | Latest stable Ansible 2.10.x version |
| `2.9-awskops1.10`    | Latest stable Ansible 2.9.x version  |
| `2.8-awskops1.10`    | Latest stable Ansible 2.8.x version  |
| `2.7-awskops1.10`    | Latest stable Ansible 2.7.x version  |
| `2.6-awskops1.10`    | Latest stable Ansible 2.6.x version  |
| `2.5-awskops1.10`    | Latest stable Ansible 2.5.x version  |
| `2.4-awskops1.10`    | Latest stable Ansible 2.4.x version  |
| `2.3-awskops1.10`    | Latest stable Ansible 2.3.x version  |

#### Kops 1.9 (latest 1.9.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.9.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.9 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.9.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.9 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awskops1.9`  | Latest stable Ansible version        |
| `2.10-awskops1.9`    | Latest stable Ansible 2.10.x version |
| `2.9-awskops1.9`     | Latest stable Ansible 2.9.x version  |
| `2.8-awskops1.9`     | Latest stable Ansible 2.8.x version  |
| `2.7-awskops1.9`     | Latest stable Ansible 2.7.x version  |
| `2.6-awskops1.9`     | Latest stable Ansible 2.6.x version  |
| `2.5-awskops1.9`     | Latest stable Ansible 2.5.x version  |
| `2.4-awskops1.9`     | Latest stable Ansible 2.4.x version  |
| `2.3-awskops1.9`     | Latest stable Ansible 2.3.x version  |

#### Kops 1.8 (latest 1.8.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awskops1.8.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.8 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awskops1.8.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awskops1.8 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awskops1.8`  | Latest stable Ansible version        |
| `2.10-awskops1.8`    | Latest stable Ansible 2.10.x version |
| `2.9-awskops1.8`     | Latest stable Ansible 2.9.x version  |
| `2.8-awskops1.8`     | Latest stable Ansible 2.8.x version  |
| `2.7-awskops1.8`     | Latest stable Ansible 2.7.x version  |
| `2.6-awskops1.8`     | Latest stable Ansible 2.6.x version  |
| `2.5-awskops1.8`     | Latest stable Ansible 2.5.x version  |
| `2.4-awskops1.8`     | Latest stable Ansible 2.4.x version  |
| `2.3-awskops1.8`     | Latest stable Ansible 2.3.x version  |

### Ansible awshelm
The following Ansible Docker images contain everything from `Ansible awsk8s` and additionally: `helm` in its latest patch level version.

> https://github.com/helm/helm/releases

#### Helm 3.4 (latest 3.4.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm3.4.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm3.4 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm3.4.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm3.4 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awshelm3.4`  | Latest stable Ansible version        |
| `2.10-awshelm3.4`    | Latest stable Ansible 2.10.x version |
| `2.9-awshelm3.4`     | Latest stable Ansible 2.9.x version  |
| `2.8-awshelm3.4`     | Latest stable Ansible 2.8.x version  |
| `2.7-awshelm3.4`     | Latest stable Ansible 2.7.x version  |
| `2.6-awshelm3.4`     | Latest stable Ansible 2.6.x version  |
| `2.5-awshelm3.4`     | Latest stable Ansible 2.5.x version  |
| `2.4-awshelm3.4`     | Latest stable Ansible 2.4.x version  |
| `2.3-awshelm3.4`     | Latest stable Ansible 2.3.x version  |

#### Helm 3.3 (latest 3.3.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm3.3.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm3.3 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm3.3.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm3.3 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awshelm3.3`  | Latest stable Ansible version        |
| `2.10-awshelm3.3`    | Latest stable Ansible 2.10.x version |
| `2.9-awshelm3.3`     | Latest stable Ansible 2.9.x version  |
| `2.8-awshelm3.3`     | Latest stable Ansible 2.8.x version  |
| `2.7-awshelm3.3`     | Latest stable Ansible 2.7.x version  |
| `2.6-awshelm3.3`     | Latest stable Ansible 2.6.x version  |
| `2.5-awshelm3.3`     | Latest stable Ansible 2.5.x version  |
| `2.4-awshelm3.3`     | Latest stable Ansible 2.4.x version  |
| `2.3-awshelm3.3`     | Latest stable Ansible 2.3.x version  |

#### Helm 3.2 (latest 3.2.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm3.2.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm3.2 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm3.2.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm3.2 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awshelm3.2`  | Latest stable Ansible version        |
| `2.10-awshelm3.2`    | Latest stable Ansible 2.10.x version |
| `2.9-awshelm3.2`     | Latest stable Ansible 2.9.x version  |
| `2.8-awshelm3.2`     | Latest stable Ansible 2.8.x version  |
| `2.7-awshelm3.2`     | Latest stable Ansible 2.7.x version  |
| `2.6-awshelm3.2`     | Latest stable Ansible 2.6.x version  |
| `2.5-awshelm3.2`     | Latest stable Ansible 2.5.x version  |
| `2.4-awshelm3.2`     | Latest stable Ansible 2.4.x version  |
| `2.3-awshelm3.2`     | Latest stable Ansible 2.3.x version  |

#### Helm 3.1 (latest 3.1.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm3.1.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm3.1 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm3.1.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm3.1 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awshelm3.1`  | Latest stable Ansible version        |
| `2.10-awshelm3.1`    | Latest stable Ansible 2.10.x version |
| `2.9-awshelm3.1`     | Latest stable Ansible 2.9.x version  |
| `2.8-awshelm3.1`     | Latest stable Ansible 2.8.x version  |
| `2.7-awshelm3.1`     | Latest stable Ansible 2.7.x version  |
| `2.6-awshelm3.1`     | Latest stable Ansible 2.6.x version  |
| `2.5-awshelm3.1`     | Latest stable Ansible 2.5.x version  |
| `2.4-awshelm3.1`     | Latest stable Ansible 2.4.x version  |
| `2.3-awshelm3.1`     | Latest stable Ansible 2.3.x version  |

#### Helm 3.0 (latest 3.0.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm3.0.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm3.0 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm3.0.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm3.0 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awshelm3.0`  | Latest stable Ansible version        |
| `2.10-awshelm3.0`    | Latest stable Ansible 2.10.x version |
| `2.9-awshelm3.0`     | Latest stable Ansible 2.9.x version  |
| `2.8-awshelm3.0`     | Latest stable Ansible 2.8.x version  |
| `2.7-awshelm3.0`     | Latest stable Ansible 2.7.x version  |
| `2.6-awshelm3.0`     | Latest stable Ansible 2.6.x version  |
| `2.5-awshelm3.0`     | Latest stable Ansible 2.5.x version  |
| `2.4-awshelm3.0`     | Latest stable Ansible 2.4.x version  |
| `2.3-awshelm3.0`     | Latest stable Ansible 2.3.x version  |

#### Helm 2.16 (latest 2.16.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm2.16.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.16 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm2.16.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.16 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awshelm2.16` | Latest stable Ansible version        |
| `2.10-awshelm2.16`   | Latest stable Ansible 2.10.x version |
| `2.9-awshelm2.16`    | Latest stable Ansible 2.9.x version  |
| `2.8-awshelm2.16`    | Latest stable Ansible 2.8.x version  |
| `2.7-awshelm2.16`    | Latest stable Ansible 2.7.x version  |
| `2.6-awshelm2.16`    | Latest stable Ansible 2.6.x version  |
| `2.5-awshelm2.16`    | Latest stable Ansible 2.5.x version  |
| `2.4-awshelm2.16`    | Latest stable Ansible 2.4.x version  |
| `2.3-awshelm2.16`    | Latest stable Ansible 2.3.x version  |

#### Helm 2.15 (latest 2.15.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm2.15.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.15 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm2.15.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.15 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awshelm2.15` | Latest stable Ansible version        |
| `2.10-awshelm2.15`   | Latest stable Ansible 2.10.x version |
| `2.9-awshelm2.15`    | Latest stable Ansible 2.9.x version  |
| `2.8-awshelm2.15`    | Latest stable Ansible 2.8.x version  |
| `2.7-awshelm2.15`    | Latest stable Ansible 2.7.x version  |
| `2.6-awshelm2.15`    | Latest stable Ansible 2.6.x version  |
| `2.5-awshelm2.15`    | Latest stable Ansible 2.5.x version  |
| `2.4-awshelm2.15`    | Latest stable Ansible 2.4.x version  |
| `2.3-awshelm2.15`    | Latest stable Ansible 2.3.x version  |

#### Helm 2.14 (latest 2.14.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm2.14.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.14 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm2.14.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.14 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awshelm2.14` | Latest stable Ansible version        |
| `2.10-awshelm2.14`   | Latest stable Ansible 2.10.x version |
| `2.9-awshelm2.14`    | Latest stable Ansible 2.9.x version  |
| `2.8-awshelm2.14`    | Latest stable Ansible 2.8.x version  |
| `2.7-awshelm2.14`    | Latest stable Ansible 2.7.x version  |
| `2.6-awshelm2.14`    | Latest stable Ansible 2.6.x version  |
| `2.5-awshelm2.14`    | Latest stable Ansible 2.5.x version  |
| `2.4-awshelm2.14`    | Latest stable Ansible 2.4.x version  |
| `2.3-awshelm2.14`    | Latest stable Ansible 2.3.x version  |

#### Helm 2.13 (latest 2.13.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm2.13.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.13 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm2.13.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.13 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awshelm2.13` | Latest stable Ansible version        |
| `2.10-awshelm2.13`   | Latest stable Ansible 2.10.x version |
| `2.9-awshelm2.13`    | Latest stable Ansible 2.9.x version  |
| `2.8-awshelm2.13`    | Latest stable Ansible 2.8.x version  |
| `2.7-awshelm2.13`    | Latest stable Ansible 2.7.x version  |
| `2.6-awshelm2.13`    | Latest stable Ansible 2.6.x version  |
| `2.5-awshelm2.13`    | Latest stable Ansible 2.5.x version  |
| `2.4-awshelm2.13`    | Latest stable Ansible 2.4.x version  |
| `2.3-awshelm2.13`    | Latest stable Ansible 2.3.x version  |

#### Helm 2.12 (latest 2.12.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm2.12.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.12 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm2.12.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.12 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awshelm2.12` | Latest stable Ansible version        |
| `2.10-awshelm2.12`   | Latest stable Ansible 2.10.x version |
| `2.9-awshelm2.12`    | Latest stable Ansible 2.9.x version  |
| `2.8-awshelm2.12`    | Latest stable Ansible 2.8.x version  |
| `2.7-awshelm2.12`    | Latest stable Ansible 2.7.x version  |
| `2.6-awshelm2.12`    | Latest stable Ansible 2.6.x version  |
| `2.5-awshelm2.12`    | Latest stable Ansible 2.5.x version  |
| `2.4-awshelm2.12`    | Latest stable Ansible 2.4.x version  |
| `2.3-awshelm2.12`    | Latest stable Ansible 2.3.x version  |

#### Helm 2.11 (latest 2.11.x)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest-awshelm2.11.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.11 "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest-awshelm2.11.svg?&kill_cache=1)](https://microbadger.com/images/cytopia/ansible:latest-awshelm2.11 "ansible")

| Docker tag           | Build from                           |
|----------------------|--------------------------------------|
| `latest-awshelm2.11` | Latest stable Ansible version        |
| `2.10-awshelm2.11`   | Latest stable Ansible 2.10.x version |
| `2.9-awshelm2.11`    | Latest stable Ansible 2.9.x version  |
| `2.8-awshelm2.11`    | Latest stable Ansible 2.8.x version  |
| `2.7-awshelm2.11`    | Latest stable Ansible 2.7.x version  |
| `2.6-awshelm2.11`    | Latest stable Ansible 2.6.x version  |
| `2.5-awshelm2.11`    | Latest stable Ansible 2.5.x version  |
| `2.4-awshelm2.11`    | Latest stable Ansible 2.4.x version  |
| `2.3-awshelm2.11`    | Latest stable Ansible 2.3.x version  |


## Docker environment variables

Environment variables are available for all flavours except for `Ansible base`.

| Variable        | Default | Allowed values | Description |
|-----------------|---------|----------------|-------------|
| `USER`          | ``      | `ansible`      | Set this to `ansible` to have everything run inside the container by the user `ansible` instead of `root` |
| `UID`           | `1000`  | integer        | If your local uid is not `1000` set it to your uid to syncronize file/dir permissions during mounting |
| `GID`           | `1000`  | integer        | If your local gid is not `1000` set it to your gid to syncronize file/dir permissions during mounting |
| `INIT_GPG_KEY`  | ``      | string         | If your gpg key requires a password you can initialize it during startup and cache the password (requires `INIT_GPG_PASS` as well) |
| `INIT_GPG_PASS` | ``      | string         | If your gpg key requires a password you can initialize it during startup and cache the password (requires `INIT_GPG_KEY` as well) |
| `INIT_GPG_CMD`  | ``      | string         | A custom command which will initialize the GPG key password. This allows for interactive mode to enter your password manually during startup. (Mutually exclusive to `INIT_GPG_KEY` and `INIT_GPG_PASS`) |


## Docker mounts

The working directory inside the Docker container is **`/data/`** and should be mounted locally to
the root of your project where your Ansible playbooks are.


## Examples

### Run Ansible playbook
```bash
docker run --rm -v $(pwd):/data cytopia/ansible ansible-playbook playbook.yml
```

### Run Ansible playbook with Mitogen

> [Mitogen](https://github.com/dw/mitogen) updates Ansible’s slow and wasteful shell-centric implementation with pure-Python equivalents, invoked via highly efficient remote procedure calls to persistent interpreters tunnelled over SSH.

> No changes are required to target hosts. The extension is considered stable and real-world use is encouraged.

**Configuration (option 1)**

`ansible.cfg`
```ini
[defaults]
strategy_plugins = /usr/lib/python3.6/site-packages/ansible_mitogen/plugins/strategy
strategy         = mitogen_linear
```

**Configuratoin (option 2)**
```bash
# Instead of hardcoding it via ansible.cfg,  you could also add the
# option on-the-fly via environment variables.
export ANSIBLE_STRATEGY_PLUGINS=/usr/lib/python3.6/site-packages/ansible_mitogen/plugins/strategy
export ANSIBLE_STRATEGY=mitogen_linear
```

**Invocation**

```bash
docker run --rm -v $(pwd):/data cytopia/ansible:latest-tools ansible-playbook playbook.yml
```

**Further readings:**

* [Mitogen on GitHub](https://github.com/dw/mitogen)
* [Mitogen Documentation](https://networkgenomics.com/ansible/)
* [How to Speed Up Your Ansible Playbooks Over 600%](https://www.toptechskills.com/ansible-tutorials-courses/speed-up-ansible-playbooks-pipelining-mitogen/)
* [Speed up Ansible with Mitogen](https://dev.to/sshnaidm/speed-up-ansible-with-mitogen-2c3j)


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

### Run Ansible playbook with local password-less gpg keys mounted
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

### Run Ansible playbook with local gpg keys mounted and automatically initialized
This is required in case your GPG key itself is encrypted with a password.
Note that the password needs to be in *single quotes*.
```bash
# Ensure to set same uid/gid as on your local system for Docker user
# to prevent permission issues during docker mounts
docker run --rm \
  -e USER=ansible \
  -e MY_UID=1000 \
  -e MY_GID=1000 \
  -e INIT_GPG_KEY=user@domain.tld \
  -e INIT_GPG_PASS='my gpg password' \
  -v ${HOME}/.gnupg/:/home/ansible/.gnupg/ \
  -v $(pwd):/data \
  cytopia/ansible:latest-tools ansible-playbook playbook.yml
```
Alternatively you can also export your GPG key and password to the shell's environment:
```bash
# Ensure to write the password in single quotes
export MY_GPG_KEY='user@domain.tld'
export MY_GPG_PASS='my gpg password'
```
```bash
# Ensure to set same uid/gid as on your local system for Docker user
# to prevent permission issues during docker mounts
docker run --rm \
  -e USER=ansible \
  -e MY_UID=1000 \
  -e MY_GID=1000 \
  -e INIT_GPG_KEY=${MY_GPG_KEY} \
  -e INIT_GPG_PASS=${MY_GPG_PASS} \
  -v ${HOME}/.gnupg/:/home/ansible/.gnupg/ \
  -v $(pwd):/data \
  cytopia/ansible:latest-tools ansible-playbook playbook.yml
```

### Run Ansible playbook with local gpg keys mounted and interactively interactively
The following will work with password-less and password-set GPG keys.
In case it requires a password, it will ask for the password and you need to enter it.
```bash
# Ensure to set same uid/gid as on your local system for Docker user
# to prevent permission issues during docker mounts
docker run --rm \
  -e USER=ansible \
  -e MY_UID=1000 \
  -e MY_GID=1000 \
  -e INIT_GPG_CMD='echo test | gpg --encrypt -r user@domain.tld | gpg --decrypt --pinentry-mode loopback' \
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

### Run Ansible playbook against AWS with gpg vault initialization
```bash
# Ensure to set same uid/gid as on your local system for Docker user
# to prevent permission issues during docker mounts
docker run --rm \
  -e USER=ansible \
  -e MY_UID=1000 \
  -e MY_GID=1000 \
  -e INIT_GPG_KEY=user@domain.tld \
  -e INIT_GPG_PASS='my gpg password' \
  -v ${HOME}/.aws/config:/home/ansible/.aws/config:ro \
  -v ${HOME}/.aws/credentials:/home/ansible/.aws/credentials:ro \
  -v ${HOME}/.gnupg/:/home/ansible/.gnupg/ \
  -v $(pwd):/data \
  cytopia/ansible:latest-aws \
  ansible-playbook playbook.yml
```
As the command is getting pretty long, you could wrap it into a Makefile.
```make
ifneq (,)
.error This Makefile requires GNU Make.
endif

.PHONY: dry run

CURRENT_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
ANSIBLE = 2.8
UID = 1000
GID = 1000

# Ansible check mode uses mitogen_linear strategy for much faster roll-outs
dry:
ifndef GPG_PASS
	docker run --rm it \
		-e ANSIBLE_STRATEGY_PLUGINS=/usr/lib/python3.6/site-packages/ansible_mitogen/plugins/strategy \
		-e ANSIBLE_STRATEGY=mitogen_linear \
		-e USER=ansible \
		-e MY_UID=$(UID) \
		-e MY_GID=$(GID) \
		-v $${HOME}/.aws/config:/home/ansible/.aws/config:ro \
		-v $${HOME}/.aws/credentials:/home/ansible/.aws/credentials:ro \
		-v $${HOME}/.gnupg/:/home/ansible/.gnupg/ \
		-v $(CURRENT_DIR):/data \
		cytopia/ansible:$(ANSIBLE)-aws ansible-playbook playbook.yml --check
else
	docker run --rm it \
		-e ANSIBLE_STRATEGY_PLUGINS=/usr/lib/python3.6/site-packages/ansible_mitogen/plugins/strategy \
		-e ANSIBLE_STRATEGY=mitogen_linear \
		-e USER=ansible \
		-e MY_UID=$(UID) \
		-e MY_GID=$(GID) \
		-e INIT_GPG_KEY=$${GPG_KEY} \
		-e INIT_GPG_PASS=$${GPG_PASS} \
		-v $${HOME}/.aws/config:/home/ansible/.aws/config:ro \
		-v $${HOME}/.aws/credentials:/home/ansible/.aws/credentials:ro \
		-v $${HOME}/.gnupg/:/home/ansible/.gnupg/ \
		-v $(CURRENT_DIR):/data \
		cytopia/ansible:$(ANSIBLE)INIT_GPG_KEY` -aws \
		ansible-playbook playbook.yml --check
endif

# Ansible real run uses default strategy
run:
ifndef GPG_PASS
	docker run --rm it \
		-e USER=ansible \
		-e MY_UID=$(UID) \
		-e MY_GID=$(GID) \
		-v $${HOME}/.aws/config:/home/ansible/.aws/config:ro \
		-v $${HOME}/.aws/credentials:/home/ansible/.aws/credentials:ro \
		-v $${HOME}/.gnupg/:/home/ansible/.gnupg/ \
		-v $(CURRENT_DIR):/data \
		cytopia/ansible:$(ANSIBLE)-aws ansible-playbook playbook.yml
else
	docker run --rm it \
		-e USER=ansible \
		-e MY_UID=$(UID) \
		-e MY_GID=$(GID) \
		-e INIT_GPG_KEY=$${GPG_KEY} \
		-e INIT_GPG_PASS=$${GPG_PASS} \
		-v $${HOME}/.aws/config:/home/ansible/.aws/config:ro \
		-v $${HOME}/.aws/credentials:/home/ansible/.aws/credentials:ro \
		-v $${HOME}/.gnupg/:/home/ansible/.gnupg/ \
		-v $(CURRENT_DIR):/data \
		cytopia/ansible:$(ANSIBLE)-aws \
		ansible-playbook playbook.yml
endif
```
**Important:**

THE `GPG_KEY` and `GPG_PASS` will not be echo'ed out by the Make command and you are advised to
export those values via your shell's `export` command to the env in order to hide it.

If you still want to specify them on the command line via `make dry GPG_KEY='pass'`
and your pass or key contains one or more `$` characters
then they must all be escaped with an additional `$` in front. This is not necessary if you export
them.

**Example:** If your password is `test$5`, then you must use `make dry GPG_PASS='test$$5'`.


Then you can call it easily:
```bash
# With GPG password from the env
export GPG_KEY='user@domain.tld'
export GPG_PASS='THE_GPG_PASSWORD_HERE'
make dry
make run

# With GPG password on the cli
make dry GPG_KEY='user@domain.tld' GPG_PASS='THE_GPG_PASSWORD_HERE'
make run GPG_KEY='user@domain.tld' GPG_PASS='THE_GPG_PASSWORD_HERE'

# Without GPG password
make dry
make run

# With different Ansible version
make dry ANSIBLE=2.6
make run ANSIBLE=2.6

# With different uid/gid
make dry UID=1001 GID=1001
make run UID=1001 GID=1001
```


## Build locally

To build locally you require GNU Make to be installed. Instructions as  shown below.

### Ansible base
```bash
# Build latest Ansible base
# image: cytopia/ansible:latest
make build

# Build Ansible 2.6 base
# image: cytopia/ansible:2.6
make build ANSIBLE=2.6
```
### Ansible tools
```bash
# Build latest Ansible tools
# image: cytopia/ansible:latest-tools
make build ANSIBLE=latest FLAVOUR=tools

# Build Ansible 2.6 tools
# image: cytopia/ansible:2.6-tools
make build ANSIBLE=2.6 FLAVOUR=tools
```

### Ansible infra
```bash
# Build latest Ansible infra
# image: cytopia/ansible:latest-infra
make build ANSIBLE=latest FLAVOUR=infra

# Build Ansible 2.6 infra
# image: cytopia/ansible:2.6-infra
make build ANSIBLE=2.6 FLAVOUR=infra
```

### Ansible azure
```bash
# Build latest Ansible azure
# image: cytopia/ansible:latest-azure
make build ANSIBLE=latest FLAVOUR=azure

# Build Ansible 2.6 azure
# image: cytopia/ansible:2.6-azure
make build ANSIBLE=2.6 FLAVOUR=azure
```

### Ansible aws
```bash
# Build latest Ansible aws
# image: cytopia/ansible:latest-aws
make build ANSIBLE=latest FLAVOUR=aws

# Build Ansible 2.6 aws
# image: cytopia/ansible:2.6-aws
make build ANSIBLE=2.6 FLAVOUR=aws
```

### Ansible awsk8s
```bash
# Build latest Ansible awsk8s
# image: cytopia/ansible:latest-awsk8s
make build ANSIBLE=latest FLAVOUR=awsk8s

# Build Ansible 2.6 awsk8s
# image: cytopia/ansible:2.6-awsk8s
make build ANSIBLE=2.6 FLAVOUR=awsk8s
```

### Ansible awskops
```bash
# Build latest Ansible with Kops 1.8
# image: cytopia/ansible:latest-awskops1.8
make build ANSIBLE=latest FLAVOUR=awskops KOPS=1.8

# Build Ansible 2.6 with Kops 1.8
# image: cytopia/ansible:2.6-awskops1.8
make build ANSIBLE=2.6 FLAVOUR=awskops KOPS=1.8
```

### Ansible awshelm
```bash
# Build latest Ansible with Helm 2.14
# image: cytopia/ansible:latest-awshelm1.8
make build ANSIBLE=latest FLAVOUR=awshelm HELM=2.14

# Build Ansible 2.6 with Kops 1.8
# image: cytopia/ansible:2.6-awshelm1.8
make build ANSIBLE=2.6 FLAVOUR=awshelm HELM=2.14
```


## Related [#awesome-ci](https://github.com/topics/awesome-ci) projects

### Docker images

Save yourself from installing lot's of dependencies and pick a dockerized version of your favourite
linter below for reproducible local or remote CI tests:

| GitHub | DockerHub | Type | Description |
|--------|-----------|------|-------------|
| [awesome-ci][aci-git-lnk]        | [![aci-hub-img]][aci-hub-lnk]         | Basic      | Tools for git, file and static source code analysis |
| [file-lint][flint-git-lnk]       | [![flint-hub-img]][flint-hub-lnk]     | Basic      | Baisc source code analysis |
| [linkcheck][linkcheck-git-lnk]   | [![linkcheck-hub-img]][flint-hub-lnk] | Basic      | Search for URLs in files and validate their HTTP status code |
| [ansible][ansible-git-lnk]       | [![ansible-hub-img]][ansible-hub-lnk] | Ansible    | Multiple versions and flavours of Ansible |
| [ansible-lint][alint-git-lnk]    | [![alint-hub-img]][alint-hub-lnk]     | Ansible    | Lint Ansible |
| [gofmt][gfmt-git-lnk]            | [![gfmt-hub-img]][gfmt-hub-lnk]       | Go         | Format Go source code **<sup>[1]</sup>** |
| [goimports][gimp-git-lnk]        | [![gimp-hub-img]][gimp-hub-lnk]       | Go         | Format Go source code **<sup>[1]</sup>** |
| [golint][glint-git-lnk]          | [![glint-hub-img]][glint-hub-lnk]     | Go         | Lint Go code |
| [eslint][elint-git-lnk]          | [![elint-hub-img]][elint-hub-lnk]     | Javascript | Lint Javascript code |
| [jsonlint][jlint-git-lnk]        | [![jlint-hub-img]][jlint-hub-lnk]     | JSON       | Lint JSON files **<sup>[1]</sup>** |
| [checkmake][cm-git-lnk]          | [![cm-hub-img]][cm-hub-lnk]           | Make       | Lint Makefiles |
| [phpcbf][pcbf-git-lnk]           | [![pcbf-hub-img]][pcbf-hub-lnk]       | PHP        | PHP Code Beautifier and Fixer |
| [phpcs][pcs-git-lnk]             | [![pcs-hub-img]][pcs-hub-lnk]         | PHP        | PHP Code Sniffer |
| [phplint][plint-git-lnk]         | [![plint-hub-img]][plint-hub-lnk]     | PHP        | PHP Code Linter **<sup>[1]</sup>** |
| [php-cs-fixer][pcsf-git-lnk]     | [![pcsf-hub-img]][pcsf-hub-lnk]       | PHP        | PHP Coding Standards Fixer |
| [black][black-git-lnk]           | [![black-hub-img]][black-hub-lnk]     | Python     | The uncompromising Python code formatter |
| [mypy][mypy-git-lnk]             | [![mypy-hub-img]][mypy-hub-lnk]       | Python     | Static source code analysis |
| [pycodestyle][pycs-git-lnk]      | [![pycs-hub-img]][pycs-hub-lnk]       | Python     | Python style guide checker |
| [pydocstyle][pyds-git-lnk]       | [![pyds-hub-img]][pyds-hub-lnk]       | Python     | Python docstyle checker |
| [pylint][pylint-git-lnk]         | [![pylint-hub-img]][pylint-hub-lnk]   | Python     | Python source code, bug and quality checker |
| [terraform-docs][tfdocs-git-lnk] | [![tfdocs-hub-img]][tfdocs-hub-lnk]   | Terraform  | Terraform doc generator (TF 0.12 ready) **<sup>[1]</sup>** |
| [terragrunt][tg-git-lnk]         | [![tg-hub-img]][tg-hub-lnk]           | Terraform  | Terragrunt and Terraform |
| [terragrunt-fmt][tgfmt-git-lnk]  | [![tgfmt-hub-img]][tgfmt-hub-lnk]     | Terraform  | `terraform fmt` for Terragrunt files **<sup>[1]</sup>** |
| [yamlfmt][yfmt-git-lnk]          | [![yfmt-hub-img]][yfmt-hub-lnk]       | Yaml       | Format Yaml files **<sup>[1]</sup>** |
| [yamllint][ylint-git-lnk]        | [![ylint-hub-img]][ylint-hub-lnk]     | Yaml       | Lint Yaml files |

> **<sup>[1]</sup>** Uses a shell wrapper to add **enhanced functionality** not available by original project.

[aci-git-lnk]: https://github.com/cytopia/awesome-ci
[aci-hub-img]: https://img.shields.io/docker/pulls/cytopia/awesome-ci.svg
[aci-hub-lnk]: https://hub.docker.com/r/cytopia/awesome-ci

[flint-git-lnk]: https://github.com/cytopia/docker-file-lint
[flint-hub-img]: https://img.shields.io/docker/pulls/cytopia/file-lint.svg
[flint-hub-lnk]: https://hub.docker.com/r/cytopia/file-lint

[linkcheck-git-lnk]: https://github.com/cytopia/docker-linkcheck
[linkcheck-hub-img]: https://img.shields.io/docker/pulls/cytopia/linkcheck.svg
[linkcheck-hub-lnk]: https://hub.docker.com/r/cytopia/linkcheck

[jlint-git-lnk]: https://github.com/cytopia/docker-jsonlint
[jlint-hub-img]: https://img.shields.io/docker/pulls/cytopia/jsonlint.svg
[jlint-hub-lnk]: https://hub.docker.com/r/cytopia/jsonlint

[ansible-git-lnk]: https://github.com/cytopia/docker-ansible
[ansible-hub-img]: https://img.shields.io/docker/pulls/cytopia/ansible.svg
[ansible-hub-lnk]: https://hub.docker.com/r/cytopia/ansible

[alint-git-lnk]: https://github.com/cytopia/docker-ansible-lint
[alint-hub-img]: https://img.shields.io/docker/pulls/cytopia/ansible-lint.svg
[alint-hub-lnk]: https://hub.docker.com/r/cytopia/ansible-lint

[gfmt-git-lnk]: https://github.com/cytopia/docker-gofmt
[gfmt-hub-img]: https://img.shields.io/docker/pulls/cytopia/gofmt.svg
[gfmt-hub-lnk]: https://hub.docker.com/r/cytopia/gofmt

[gimp-git-lnk]: https://github.com/cytopia/docker-goimports
[gimp-hub-img]: https://img.shields.io/docker/pulls/cytopia/goimports.svg
[gimp-hub-lnk]: https://hub.docker.com/r/cytopia/goimports

[glint-git-lnk]: https://github.com/cytopia/docker-golint
[glint-hub-img]: https://img.shields.io/docker/pulls/cytopia/golint.svg
[glint-hub-lnk]: https://hub.docker.com/r/cytopia/golint

[elint-git-lnk]: https://github.com/cytopia/docker-eslint
[elint-hub-img]: https://img.shields.io/docker/pulls/cytopia/eslint.svg
[elint-hub-lnk]: https://hub.docker.com/r/cytopia/eslint

[cm-git-lnk]: https://github.com/cytopia/docker-checkmake
[cm-hub-img]: https://img.shields.io/docker/pulls/cytopia/checkmake.svg
[cm-hub-lnk]: https://hub.docker.com/r/cytopia/checkmake

[pcbf-git-lnk]: https://github.com/cytopia/docker-phpcbf
[pcbf-hub-img]: https://img.shields.io/docker/pulls/cytopia/phpcbf.svg
[pcbf-hub-lnk]: https://hub.docker.com/r/cytopia/phpcbf

[pcs-git-lnk]: https://github.com/cytopia/docker-phpcs
[pcs-hub-img]: https://img.shields.io/docker/pulls/cytopia/phpcs.svg
[pcs-hub-lnk]: https://hub.docker.com/r/cytopia/phpcs

[plint-git-lnk]: https://github.com/cytopia/docker-phplint
[plint-hub-img]: https://img.shields.io/docker/pulls/cytopia/phplint.svg
[plint-hub-lnk]: https://hub.docker.com/r/cytopia/phplint

[pcsf-git-lnk]: https://github.com/cytopia/docker-php-cs-fixer
[pcsf-hub-img]: https://img.shields.io/docker/pulls/cytopia/php-cs-fixer.svg
[pcsf-hub-lnk]: https://hub.docker.com/r/cytopia/php-cs-fixer

[black-git-lnk]: https://github.com/cytopia/docker-black
[black-hub-img]: https://img.shields.io/docker/pulls/cytopia/black.svg
[black-hub-lnk]: https://hub.docker.com/r/cytopia/black

[mypy-git-lnk]: https://github.com/cytopia/docker-mypy
[mypy-hub-img]: https://img.shields.io/docker/pulls/cytopia/mypy.svg
[mypy-hub-lnk]: https://hub.docker.com/r/cytopia/mypy

[pycs-git-lnk]: https://github.com/cytopia/docker-pycodestyle
[pycs-hub-img]: https://img.shields.io/docker/pulls/cytopia/pycodestyle.svg
[pycs-hub-lnk]: https://hub.docker.com/r/cytopia/pycodestyle

[pyds-git-lnk]: https://github.com/cytopia/docker-pydocstyle
[pyds-hub-img]: https://img.shields.io/docker/pulls/cytopia/pydocstyle.svg
[pyds-hub-lnk]: https://hub.docker.com/r/cytopia/pydocstyle

[pylint-git-lnk]: https://github.com/cytopia/docker-pylint
[pylint-hub-img]: https://img.shields.io/docker/pulls/cytopia/pylint.svg
[pylint-hub-lnk]: https://hub.docker.com/r/cytopia/pylint

[tfdocs-git-lnk]: https://github.com/cytopia/docker-terraform-docs
[tfdocs-hub-img]: https://img.shields.io/docker/pulls/cytopia/terraform-docs.svg
[tfdocs-hub-lnk]: https://hub.docker.com/r/cytopia/terraform-docs

[tg-git-lnk]: https://github.com/cytopia/docker-terragrunt
[tg-hub-img]: https://img.shields.io/docker/pulls/cytopia/terragrunt.svg
[tg-hub-lnk]: https://hub.docker.com/r/cytopia/terragrunt

[tgfmt-git-lnk]: https://github.com/cytopia/docker-terragrunt-fmt
[tgfmt-hub-img]: https://img.shields.io/docker/pulls/cytopia/terragrunt-fmt.svg
[tgfmt-hub-lnk]: https://hub.docker.com/r/cytopia/terragrunt-fmt

[yfmt-git-lnk]: https://github.com/cytopia/docker-yamlfmt
[yfmt-hub-img]: https://img.shields.io/docker/pulls/cytopia/yamlfmt.svg
[yfmt-hub-lnk]: https://hub.docker.com/r/cytopia/yamlfmt

[ylint-git-lnk]: https://github.com/cytopia/docker-yamllint
[ylint-hub-img]: https://img.shields.io/docker/pulls/cytopia/yamllint.svg
[ylint-hub-lnk]: https://hub.docker.com/r/cytopia/yamllint


### Makefiles

Visit **[cytopia/makefiles](https://github.com/cytopia/makefiles)** for dependency-less, seamless project integration and minimum required best-practice code linting for CI.
The provided Makefiles will only require GNU Make and Docker itself removing the need to install anything else.


## License

**[MIT License](LICENSE)**

Copyright (c) 2019 [cytopia](https://github.com/cytopia)
