# Docker image for `ansible`

[![Tag](https://img.shields.io/github/tag/cytopia/docker-ansible.svg)](https://github.com/cytopia/docker-ansible/releases)
[![](https://img.shields.io/badge/github-cytopia%2Fdocker--ansible-red.svg)](https://github.com/cytopia/docker-ansible "github.com/cytopia/docker-ansible")
[![](https://img.shields.io/docker/pulls/cytopia/ansible.svg)](https://hub.docker.com/r/cytopia/ansible)
[![Docker](https://badgen.net/badge/icon/:latest?icon=docker&label=cytopia/ansible)](https://hub.docker.com/r/cytopia/ansible)
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

[![lint](https://github.com/cytopia/docker-ansible/workflows/lint/badge.svg)](https://github.com/cytopia/docker-ansible/actions?query=workflow%3Alint)
[![build](https://github.com/cytopia/docker-ansible/actions/workflows/action_branch.yml/badge.svg)](https://github.com/cytopia/docker-ansible/actions/workflows/action_branch.yml)
[![nightly](https://github.com/cytopia/docker-ansible/actions/workflows/action_schedule.yml/badge.svg)](https://github.com/cytopia/docker-ansible/actions/workflows/action_schedule.yml)


> #### All [#awesome-ci](https://github.com/topics/awesome-ci) Docker images
>
> [ansible-lint][alint-git-lnk] **•**
> [ansible][ansible-git-lnk] **•**
> [awesome-ci][aci-git-lnk] **•**
> [bandit][bandit-git-lnk] **•**
> [black][black-git-lnk] **•**
> [checkmake][cm-git-lnk] **•**
> [eslint][elint-git-lnk] **•**
> [file-lint][flint-git-lnk] **•**
> [gofmt][gfmt-git-lnk] **•**
> [goimports][gimp-git-lnk] **•**
> [golint][glint-git-lnk] **•**
> [jsonlint][jlint-git-lnk] **•**
> [kubeval][kubeval-git-lnk] **•**
> [linkcheck][linkcheck-git-lnk] **•**
> [mypy][mypy-git-lnk] **•**
> [php-cs-fixer][pcsf-git-lnk] **•**
> [phpcbf][pcbf-git-lnk] **•**
> [phpcs][pcs-git-lnk] **•**
> [phplint][plint-git-lnk] **•**
> [pycodestyle][pycs-git-lnk] **•**
> [pydocstyle][pyds-git-lnk] **•**
> [pylint][pylint-git-lnk] **•**
> [terraform-docs][tfdocs-git-lnk] **•**
> [terragrunt-fmt][tgfmt-git-lnk] **•**
> [terragrunt][tg-git-lnk] **•**
> [yamlfmt][yfmt-git-lnk] **•**
> [yamllint][ylint-git-lnk]

View **[Dockerfiles](https://github.com/cytopia/docker-ansible/blob/master/Dockerfiles/)** on GitHub.


**Available Architectures:**  `amd64`, `arm64`

Tiny Alpine-based multistage-build dockerized version of [Ansible](https://github.com/ansible/ansible)<sup>[1]</sup> in many different flavours.
It comes with **[Mitogen](https://github.com/dw/mitogen)**<sup>[2]</sup> to speed up your runs by up to **600%**<sup>[3][4]</sup> (see [Examples](#run-ansible-playbook-with-mitogen)).
The image is built nightly against multiple stable versions and pushed to Dockerhub.

* <sup>[1] Official project: https://github.com/ansible/ansible</sup>
* <sup>[2] Official project: https://github.com/dw/mitogen</sup>
* <sup>[3] [How to Speed Up Your Ansible Playbooks Over 600%](https://www.toptechskills.com/ansible-tutorials-courses/speed-up-ansible-playbooks-pipelining-mitogen/)</sup>
* <sup>[4] [Mitogen for Ansible](https://networkgenomics.com/ansible/)</sup>


## :whale: Available Docker image versions

This repository provides many different Ansible flavours (each flavour also divided into different Ansible versions).

The following tree shows how the different flavours derive from each other (each child has all the tools and features of its parent plus its own additions).
```css
       base                    #docker-tag:  :latest
         |                                   :<version>
         |
       tools                   #docker-tag:  :latest-tools
      /  |  \                                :<version>-tools
     /   |   \
infra  azure  aws              #docker-tag:  :latest-infra     :latest-azure     :latest-aws
               |                             :<version>-infra  :<version>-azure  :<version>-aws
               |
             awsk8s            #docker-tag:  :latest-awsk8s
              /  \                           :<version>-awsk8s
             /    \
        awskops  awshelm       #docker-tag   :latest-awskops     :latest-awshelm
                                             :<version>-awskops  :<version>-awshelm
```
> <sub>`<version>` refers to the latest<sup>\[1\],</sup> patch-level version of Ansible. E.g.: `2.9`, `2.10`, `2.11`, ...</sub><br/>
> <sub>\[1\]: latest as docker images are (re)built every night via CI against the latest available patch level version of Ansible</sub>


The following table shows a quick overview of provided libraries and tools for each flavour. For more details see further down below.

| Flavour | Based on | Additional Python libs | Additional binaries |
|---------|---------------|------------------------|---------------------|
| base    | -        | `cffi`, `cryptography`, `Jinja2`, `junit-xml`, `lxml`, `paramiko`, `PyYAML` | - |
| tools   | base     | `dnspython`, `JMESPath`, `mitogen` | `bash`, `git`, `gpg`, `jq`, `ssh`, `yq` |
| infra   | tools    | `docker`, `docker-compose`, `jsondiff`, `netaddr`, `pexpect`, `psycopg2`, `pypsexec`, `pymongo`, `PyMySQL`, `smbprotocol` | `rsync` |
| azure   | tools    | `azure-*`              | `az` |
| aws     | tools    | `awscli`, `botocore`, `boto`, `boto3` | `aws`, `aws-iam-authenticator` |
| awsk8s  | aws      | `openshift`            | `kubectl`, `oc` |
| awskops | awsk8s   | -                      | `kops` |
| awshelm | awsk8s   | -                      | `helm` |


## :repeat: Rolling releases

The following Docker image tags are rolling releases and are built and updated every night.

[![nightly](https://github.com/cytopia/docker-ansible/actions/workflows/action_schedule.yml/badge.svg)](https://github.com/cytopia/docker-ansible/actions/workflows/action_schedule.yml)

### Ansible base

The following Ansible Docker images are as small as possible and only contain Ansible itself.

| Docker Tag               | Git Ref      | Ansible      | Available Architectures                      |
|--------------------------|--------------|--------------|----------------------------------------------|
| **`latest`**             | master       | latest       | `amd64`, `arm64`                             |
| `2.13`                   | master       | **`2.13.x`** | `amd64`, `arm64`                             |
| `2.12`                   | master       | **`2.12.x`** | `amd64`, `arm64`                             |
| `2.11`                   | master       | **`2.11.x`** | `amd64`, `arm64`                             |
| `2.10`                   | master       | **`2.10.x`** | `amd64`, `arm64`                             |
| `2.9`                    | master       | **`2.9.x`**  | `amd64`, `arm64`                             |
| `2.8`                    | master       | **`2.8.x`**  | `amd64`, `arm64`                             |


### Ansible tools

The following Ansible Docker images contain everything from `Ansible base` and additionally: `bash`, `git`, `gpg`, `jq`, `ssh` and `dnspython` and Ansible **`mitogen`** strategy plugin (see [Examples](#run-ansible-playbook-with-mitogen)).

| Docker Tag               | Git Ref      | Ansible      | Available Architectures                      |
|--------------------------|--------------|--------------|----------------------------------------------|
| **`latest-tools`**       | master       | latest       | `amd64`, `arm64`                             |
| `2.13-tools`             | master       | **`2.13.x`** | `amd64`, `arm64`                             |
| `2.12-tools`             | master       | **`2.12.x`** | `amd64`, `arm64`                             |
| `2.11-tools`             | master       | **`2.11.x`** | `amd64`, `arm64`                             |
| `2.10-tools`             | master       | **`2.10.x`** | `amd64`, `arm64`                             |
| `2.9-tools`              | master       | **`2.9.x`**  | `amd64`, `arm64`                             |
| `2.8-tools`              | master       | **`2.8.x`**  | `amd64`, `arm64`                             |


### Ansible azure

The following Ansible Docker images contain everything from `Ansible tools` and additionally: `azure`.

| Docker Tag               | Git Ref      | Ansible      | Available Architectures                      |
|--------------------------|--------------|--------------|----------------------------------------------|
| **`latest-azure`**       | master       | latest       | `amd64`, `arm64`                             |
| `2.13-azure`             | master       | **`2.13.x`** | `amd64`, `arm64`                             |
| `2.12-azure`             | master       | **`2.12.x`** | `amd64`, `arm64`                             |
| `2.11-azure`             | master       | **`2.11.x`** | `amd64`, `arm64`                             |
| `2.10-azure`             | master       | **`2.10.x`** | `amd64`, `arm64`                             |
| `2.9-azure`              | master       | **`2.9.x`**  | `amd64`, `arm64`                             |
| `2.8-azure`              | master       | **`2.8.x`**  | `amd64`, `arm64`                             |


### Ansible aws

The following Ansible Docker images contain everything from `Ansible tools` and additionally: `aws-cli`, `boto`, `boto3` and `botocore`.

| Docker Tag               | Git Ref      | Ansible      | Available Architectures                      |
|--------------------------|--------------|--------------|----------------------------------------------|
| **`latest-aws`**         | master       | latest       | `amd64`, `arm64`                             |
| `2.13-aws`               | master       | **`2.13.x`** | `amd64`, `arm64`                             |
| `2.12-aws`               | master       | **`2.12.x`** | `amd64`, `arm64`                             |
| `2.11-aws`               | master       | **`2.11.x`** | `amd64`, `arm64`                             |
| `2.10-aws`               | master       | **`2.10.x`** | `amd64`, `arm64`                             |
| `2.9-aws`                | master       | **`2.9.x`**  | `amd64`, `arm64`                             |
| `2.8-aws`                | master       | **`2.8.x`**  | `amd64`, `arm64`                             |


### Ansible awsk8s

The following Ansible Docker images contain everything from `Ansible aws` and additionally: `openshift` and `kubectl`.

| Docker Tag               | Git Ref      | Ansible      | Available Architectures                      |
|--------------------------|--------------|--------------|----------------------------------------------|
| **`latest-awsk8s`**      | master       | latest       | `amd64`, `arm64`                             |
| `2.13-awsk8s`            | master       | **`2.13.x`** | `amd64`, `arm64`                             |
| `2.12-awsk8s`            | master       | **`2.12.x`** | `amd64`, `arm64`                             |
| `2.11-awsk8s`            | master       | **`2.11.x`** | `amd64`, `arm64`                             |
| `2.10-awsk8s`            | master       | **`2.10.x`** | `amd64`, `arm64`                             |
| `2.9-awsk8s`             | master       | **`2.9.x`**  | `amd64`, `arm64`                             |
| `2.8-awsk8s`             | master       | **`2.8.x`**  | `amd64`, `arm64`                             |


### Ansible awskops

The following Ansible Docker images contain everything from `Ansible awsk8s` and additionally: `kops` in its latest patch level version.

> https://github.com/kubernetes/kops/releases

| Docker Tag               | Git Ref      | Ansible      | Kops     | Available Architectures           |
|--------------------------|--------------|--------------|----------|-----------------------------------|
| **`latest-awskops1.25`** | master       | latest       | `1.25.x` | `amd64`, `arm64`                  |
| `2.13-awskops1.25`       | master       | **`2.13.x`** | `1.25.x` | `amd64`, `arm64`                  |
| `2.12-awskops1.25`       | master       | **`2.12.x`** | `1.25.x` | `amd64`, `arm64`                  |
| `2.11-awskops1.25`       | master       | **`2.11.x`** | `1.25.x` | `amd64`, `arm64`                  |
| `2.10-awskops1.25`       | master       | **`2.10.x`** | `1.25.x` | `amd64`, `arm64`                  |
| `2.9-awskops1.25`        | master       | **`2.9.x`**  | `1.25.x` | `amd64`, `arm64`                  |
| `2.8-awskops1.25`        | master       | **`2.8.x`**  | `1.25.x` | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awskops1.24`** | master       | latest       | `1.24.x` | `amd64`, `arm64`                  |
| `2.13-awskops1.24`       | master       | **`2.13.x`** | `1.24.x` | `amd64`, `arm64`                  |
| `2.12-awskops1.24`       | master       | **`2.12.x`** | `1.24.x` | `amd64`, `arm64`                  |
| `2.11-awskops1.24`       | master       | **`2.11.x`** | `1.24.x` | `amd64`, `arm64`                  |
| `2.10-awskops1.24`       | master       | **`2.10.x`** | `1.24.x` | `amd64`, `arm64`                  |
| `2.9-awskops1.24`        | master       | **`2.9.x`**  | `1.24.x` | `amd64`, `arm64`                  |
| `2.8-awskops1.24`        | master       | **`2.8.x`**  | `1.24.x` | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awskops1.23`** | master       | latest       | `1.23.x` | `amd64`, `arm64`                  |
| `2.13-awskops1.23`       | master       | **`2.13.x`** | `1.23.x` | `amd64`, `arm64`                  |
| `2.12-awskops1.23`       | master       | **`2.12.x`** | `1.23.x` | `amd64`, `arm64`                  |
| `2.11-awskops1.23`       | master       | **`2.11.x`** | `1.23.x` | `amd64`, `arm64`                  |
| `2.10-awskops1.23`       | master       | **`2.10.x`** | `1.23.x` | `amd64`, `arm64`                  |
| `2.9-awskops1.23`        | master       | **`2.9.x`**  | `1.23.x` | `amd64`, `arm64`                  |
| `2.8-awskops1.23`        | master       | **`2.8.x`**  | `1.23.x` | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awskops1.22`** | master       | latest       | `1.22.x` | `amd64`, `arm64`                  |
| `2.13-awskops1.22`       | master       | **`2.13.x`** | `1.22.x` | `amd64`, `arm64`                  |
| `2.12-awskops1.22`       | master       | **`2.12.x`** | `1.22.x` | `amd64`, `arm64`                  |
| `2.11-awskops1.22`       | master       | **`2.11.x`** | `1.22.x` | `amd64`, `arm64`                  |
| `2.10-awskops1.22`       | master       | **`2.10.x`** | `1.22.x` | `amd64`, `arm64`                  |
| `2.9-awskops1.22`        | master       | **`2.9.x`**  | `1.22.x` | `amd64`, `arm64`                  |
| `2.8-awskops1.22`        | master       | **`2.8.x`**  | `1.22.x` | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awskops1.21`** | master       | latest       | `1.21.x` | `amd64`, `arm64`                  |
| `2.13-awskops1.21`       | master       | **`2.13.x`** | `1.21.x` | `amd64`, `arm64`                  |
| `2.12-awskops1.21`       | master       | **`2.12.x`** | `1.21.x` | `amd64`, `arm64`                  |
| `2.11-awskops1.21`       | master       | **`2.11.x`** | `1.21.x` | `amd64`, `arm64`                  |
| `2.10-awskops1.21`       | master       | **`2.10.x`** | `1.21.x` | `amd64`, `arm64`                  |
| `2.9-awskops1.21`        | master       | **`2.9.x`**  | `1.21.x` | `amd64`, `arm64`                  |
| `2.8-awskops1.21`        | master       | **`2.8.x`**  | `1.21.x` | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awskops1.20`** | master       | latest       | `1.20.x` | `amd64`, `arm64`                  |
| `2.13-awskops1.20`       | master       | **`2.13.x`** | `1.20.x` | `amd64`, `arm64`                  |
| `2.12-awskops1.20`       | master       | **`2.12.x`** | `1.20.x` | `amd64`, `arm64`                  |
| `2.11-awskops1.20`       | master       | **`2.11.x`** | `1.20.x` | `amd64`, `arm64`                  |
| `2.10-awskops1.20`       | master       | **`2.10.x`** | `1.20.x` | `amd64`, `arm64`                  |
| `2.9-awskops1.20`        | master       | **`2.9.x`**  | `1.20.x` | `amd64`, `arm64`                  |
| `2.8-awskops1.20`        | master       | **`2.8.x`**  | `1.20.x` | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awskops1.19`** | master       | latest       | `1.19.x` | `amd64`, `arm64`                  |
| `2.13-awskops1.19`       | master       | **`2.13.x`** | `1.19.x` | `amd64`, `arm64`                  |
| `2.12-awskops1.19`       | master       | **`2.12.x`** | `1.19.x` | `amd64`, `arm64`                  |
| `2.11-awskops1.19`       | master       | **`2.11.x`** | `1.19.x` | `amd64`, `arm64`                  |
| `2.10-awskops1.19`       | master       | **`2.10.x`** | `1.19.x` | `amd64`, `arm64`                  |
| `2.9-awskops1.19`        | master       | **`2.9.x`**  | `1.19.x` | `amd64`, `arm64`                  |
| `2.8-awskops1.19`        | master       | **`2.8.x`**  | `1.19.x` | `amd64`, `arm64`                  |


### Ansible awshelm

The following Ansible Docker images contain everything from `Ansible awsk8s` and additionally: `helm` in its latest patch level version.

> https://github.com/helm/helm/releases

| Docker Tag               | Git Ref      | Ansible      | Helm     | Available Architectures           |
|--------------------------|--------------|--------------|----------|-----------------------------------|
| **`latest-awshelm3.10`** | master       | latest       | `3.10.x` | `amd64`, `arm64`                  |
| `2.13-awshelm3.10`       | master       | **`2.13.x`** | `3.10.x` | `amd64`, `arm64`                  |
| `2.12-awshelm3.10`       | master       | **`2.12.x`** | `3.10.x` | `amd64`, `arm64`                  |
| `2.11-awshelm3.10`       | master       | **`2.11.x`** | `3.10.x` | `amd64`, `arm64`                  |
| `2.10-awshelm3.10`       | master       | **`2.10.x`** | `3.10.x` | `amd64`, `arm64`                  |
| `2.9-awshelm3.10`        | master       | **`2.9.x`**  | `3.10.x` | `amd64`, `arm64`                  |
| `2.8-awshelm3.10`        | master       | **`2.8.x`**  | `3.10.x` | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awshelm3.9`**  | master       | latest       | `3.9.x`  | `amd64`, `arm64`                  |
| `2.13-awshelm3.9`        | master       | **`2.13.x`** | `3.9.x`  | `amd64`, `arm64`                  |
| `2.12-awshelm3.9`        | master       | **`2.12.x`** | `3.9.x`  | `amd64`, `arm64`                  |
| `2.11-awshelm3.9`        | master       | **`2.11.x`** | `3.9.x`  | `amd64`, `arm64`                  |
| `2.10-awshelm3.9`        | master       | **`2.10.x`** | `3.9.x`  | `amd64`, `arm64`                  |
| `2.9-awshelm3.9`         | master       | **`2.9.x`**  | `3.9.x`  | `amd64`, `arm64`                  |
| `2.8-awshelm3.9`         | master       | **`2.8.x`**  | `3.9.x`  | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awshelm3.8`**  | master       | latest       | `3.8.x`  | `amd64`, `arm64`                  |
| `2.13-awshelm3.8`        | master       | **`2.13.x`** | `3.8.x`  | `amd64`, `arm64`                  |
| `2.12-awshelm3.8`        | master       | **`2.12.x`** | `3.8.x`  | `amd64`, `arm64`                  |
| `2.11-awshelm3.8`        | master       | **`2.11.x`** | `3.8.x`  | `amd64`, `arm64`                  |
| `2.10-awshelm3.8`        | master       | **`2.10.x`** | `3.8.x`  | `amd64`, `arm64`                  |
| `2.9-awshelm3.8`         | master       | **`2.9.x`**  | `3.8.x`  | `amd64`, `arm64`                  |
| `2.8-awshelm3.8`         | master       | **`2.8.x`**  | `3.8.x`  | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awshelm3.7`**  | master       | latest       | `3.7.x`  | `amd64`, `arm64`                  |
| `2.13-awshelm3.7`        | master       | **`2.13.x`** | `3.7.x`  | `amd64`, `arm64`                  |
| `2.12-awshelm3.7`        | master       | **`2.12.x`** | `3.7.x`  | `amd64`, `arm64`                  |
| `2.11-awshelm3.7`        | master       | **`2.11.x`** | `3.7.x`  | `amd64`, `arm64`                  |
| `2.10-awshelm3.7`        | master       | **`2.10.x`** | `3.7.x`  | `amd64`, `arm64`                  |
| `2.9-awshelm3.7`         | master       | **`2.9.x`**  | `3.7.x`  | `amd64`, `arm64`                  |
| `2.8-awshelm3.7`         | master       | **`2.8.x`**  | `3.7.x`  | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awshelm3.6`**  | master       | latest       | `3.6.x`  | `amd64`, `arm64`                  |
| `2.13-awshelm3.6`        | master       | **`2.13.x`** | `3.6.x`  | `amd64`, `arm64`                  |
| `2.12-awshelm3.6`        | master       | **`2.12.x`** | `3.6.x`  | `amd64`, `arm64`                  |
| `2.11-awshelm3.6`        | master       | **`2.11.x`** | `3.6.x`  | `amd64`, `arm64`                  |
| `2.10-awshelm3.6`        | master       | **`2.10.x`** | `3.6.x`  | `amd64`, `arm64`                  |
| `2.9-awshelm3.6`         | master       | **`2.9.x`**  | `3.6.x`  | `amd64`, `arm64`                  |
| `2.8-awshelm3.6`         | master       | **`2.8.x`**  | `3.6.x`  | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awshelm3.5`**  | master       | latest       | `3.5.x`  | `amd64`, `arm64`                  |
| `2.13-awshelm3.5`        | master       | **`2.13.x`** | `3.5.x`  | `amd64`, `arm64`                  |
| `2.12-awshelm3.5`        | master       | **`2.12.x`** | `3.5.x`  | `amd64`, `arm64`                  |
| `2.11-awshelm3.5`        | master       | **`2.11.x`** | `3.5.x`  | `amd64`, `arm64`                  |
| `2.10-awshelm3.5`        | master       | **`2.10.x`** | `3.5.x`  | `amd64`, `arm64`                  |
| `2.9-awshelm3.5`         | master       | **`2.9.x`**  | `3.5.x`  | `amd64`, `arm64`                  |
| `2.8-awshelm3.5`         | master       | **`2.8.x`**  | `3.5.x`  | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awshelm3.4`**  | master       | latest       | `3.4.x`  | `amd64`, `arm64`                  |
| `2.13-awshelm3.4`        | master       | **`2.13.x`** | `3.4.x`  | `amd64`, `arm64`                  |
| `2.12-awshelm3.4`        | master       | **`2.12.x`** | `3.4.x`  | `amd64`, `arm64`                  |
| `2.11-awshelm3.4`        | master       | **`2.11.x`** | `3.4.x`  | `amd64`, `arm64`                  |
| `2.10-awshelm3.4`        | master       | **`2.10.x`** | `3.4.x`  | `amd64`, `arm64`                  |
| `2.9-awshelm3.4`         | master       | **`2.9.x`**  | `3.4.x`  | `amd64`, `arm64`                  |
| `2.8-awshelm3.4`         | master       | **`2.8.x`**  | `3.4.x`  | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awshelm3.3`**  | master       | latest       | `3.3.x`  | `amd64`, `arm64`                  |
| `2.13-awshelm3.3`        | master       | **`2.13.x`** | `3.3.x`  | `amd64`, `arm64`                  |
| `2.12-awshelm3.3`        | master       | **`2.12.x`** | `3.3.x`  | `amd64`, `arm64`                  |
| `2.11-awshelm3.3`        | master       | **`2.11.x`** | `3.3.x`  | `amd64`, `arm64`                  |
| `2.10-awshelm3.3`        | master       | **`2.10.x`** | `3.3.x`  | `amd64`, `arm64`                  |
| `2.9-awshelm3.3`         | master       | **`2.9.x`**  | `3.3.x`  | `amd64`, `arm64`                  |
| `2.8-awshelm3.3`         | master       | **`2.8.x`**  | `3.3.x`  | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awshelm3.2`**  | master       | latest       | `3.2.x`  | `amd64`, `arm64`                  |
| `2.13-awshelm3.2`        | master       | **`2.13.x`** | `3.2.x`  | `amd64`, `arm64`                  |
| `2.12-awshelm3.2`        | master       | **`2.12.x`** | `3.2.x`  | `amd64`, `arm64`                  |
| `2.11-awshelm3.2`        | master       | **`2.11.x`** | `3.2.x`  | `amd64`, `arm64`                  |
| `2.10-awshelm3.2`        | master       | **`2.10.x`** | `3.2.x`  | `amd64`, `arm64`                  |
| `2.9-awshelm3.2`         | master       | **`2.9.x`**  | `3.2.x`  | `amd64`, `arm64`                  |
| `2.8-awshelm3.2`         | master       | **`2.8.x`**  | `3.2.x`  | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awshelm3.1`**  | master       | latest       | `3.1.x`  | `amd64`, `arm64`                  |
| `2.13-awshelm3.1`        | master       | **`2.13.x`** | `3.1.x`  | `amd64`, `arm64`                  |
| `2.12-awshelm3.1`        | master       | **`2.12.x`** | `3.1.x`  | `amd64`, `arm64`                  |
| `2.11-awshelm3.1`        | master       | **`2.11.x`** | `3.1.x`  | `amd64`, `arm64`                  |
| `2.10-awshelm3.1`        | master       | **`2.10.x`** | `3.1.x`  | `amd64`, `arm64`                  |
| `2.9-awshelm3.1`         | master       | **`2.9.x`**  | `3.1.x`  | `amd64`, `arm64`                  |
| `2.8-awshelm3.1`         | master       | **`2.8.x`**  | `3.1.x`  | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awshelm3.0`**  | master       | latest       | `3.0.x`  | `amd64`, `arm64`                  |
| `2.13-awshelm3.0`        | master       | **`2.13.x`** | `3.0.x`  | `amd64`, `arm64`                  |
| `2.12-awshelm3.0`        | master       | **`2.12.x`** | `3.0.x`  | `amd64`, `arm64`                  |
| `2.11-awshelm3.0`        | master       | **`2.11.x`** | `3.0.x`  | `amd64`, `arm64`                  |
| `2.10-awshelm3.0`        | master       | **`2.10.x`** | `3.0.x`  | `amd64`, `arm64`                  |
| `2.9-awshelm3.0`         | master       | **`2.9.x`**  | `3.0.x`  | `amd64`, `arm64`                  |
| `2.8-awshelm3.0`         | master       | **`2.8.x`**  | `3.0.x`  | `amd64`, `arm64`                  |
|                          |              |              |          |                                   |
| **`latest-awshelm2.16`** | master       | latest       | `2.16.x` | `amd64`, `arm64`                  |
| `2.13-awshelm2.16`       | master       | **`2.13.x`** | `2.16.x` | `amd64`, `arm64`                  |
| `2.12-awshelm2.16`       | master       | **`2.12.x`** | `2.16.x` | `amd64`, `arm64`                  |
| `2.11-awshelm2.16`       | master       | **`2.11.x`** | `2.16.x` | `amd64`, `arm64`                  |
| `2.10-awshelm2.16`       | master       | **`2.10.x`** | `2.16.x` | `amd64`, `arm64`                  |
| `2.9-awshelm2.16`        | master       | **`2.9.x`**  | `2.16.x` | `amd64`, `arm64`                  |
| `2.8-awshelm2.16`        | master       | **`2.8.x`**  | `2.16.x` | `amd64`, `arm64`                  |


## :new: Point in time releases

The following Docker image tags are built once and can be used for reproducible builds. Its version never changes so you will have to update tags in your pipelines from time to time in order to stay up-to-date.

[![build](https://github.com/cytopia/docker-ansible/actions/workflows/action_branch.yml/badge.svg)](https://github.com/cytopia/docker-ansible/actions/workflows/action_branch.yml)

| Docker Tag               | Git Ref      |  Available Architectures           |
|--------------------------|--------------|------------------------------------|
| **`<docker-tag>-<tag>`** | git: `<tag>` |  `amd64`, `arm64`                  |

> * Where `<docker-tag>` refers to any of the tags listed in Rolling releases above.
> * Where `<tag>` refers to the chosen git tag from this repository.


## :capital_abcd: Docker environment variables

Environment variables are available for all flavours except for `Ansible base`.

| Variable        | Default | Allowed values | Description |
|-----------------|---------|----------------|-------------|
| `USER`          | ``      | `ansible`      | Set this to `ansible` to have everything run inside the container by the user `ansible` instead of `root` |
| `UID`           | `1000`  | integer        | If your local uid is not `1000` set it to your uid to syncronize file/dir permissions during mounting |
| `GID`           | `1000`  | integer        | If your local gid is not `1000` set it to your gid to syncronize file/dir permissions during mounting |
| `INIT_GPG_KEY`  | ``      | string         | If your gpg key requires a password you can initialize it during startup and cache the password (requires `INIT_GPG_PASS` as well) |
| `INIT_GPG_PASS` | ``      | string         | If your gpg key requires a password you can initialize it during startup and cache the password (requires `INIT_GPG_KEY` as well) |
| `INIT_GPG_CMD`  | ``      | string         | A custom command which will initialize the GPG key password. This allows for interactive mode to enter your password manually during startup. (Mutually exclusive to `INIT_GPG_KEY` and `INIT_GPG_PASS`) |


## :open_file_folder: Docker mounts

The working directory inside the Docker container is **`/data/`** and should be mounted locally to
the root of your project where your Ansible playbooks are.


## :information_source: Examples

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
strategy_plugins = /usr/lib/python3.10/site-packages/ansible_mitogen/plugins/strategy
strategy         = mitogen_linear
```

**Configuratoin (option 2)**
```bash
# Instead of hardcoding it via ansible.cfg,  you could also add the
# option on-the-fly via environment variables.
export ANSIBLE_STRATEGY_PLUGINS=/usr/lib/python3.10/site-packages/ansible_mitogen/plugins/strategy
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
	docker run --rm -it \
		-e ANSIBLE_STRATEGY_PLUGINS=/usr/lib/python3.10/site-packages/ansible_mitogen/plugins/strategy \
		-e ANSIBLE_STRATEGY=mitogen_linear \
		-e USER=ansible \
		-e MY_UID=$(UID) \
		-e MY_GID=$(GID) \
		-v $${HOME}/.aws/config:/home/ansible/.aws/config:ro \
		-v $${HOME}/.aws/credentials:/home/ansible/.aws/credentials:ro \
		-v $${HOME}/.gnupg/:/home/ansible/.gnupg/ \
		-v $(CURRENT_DIR):/data \
		cytopia/ansible:$(ANSIBLE)-aws \
		ansible-playbook playbook.yml --check
else
	docker run --rm -it \
		-e ANSIBLE_STRATEGY_PLUGINS=/usr/lib/python3.10/site-packages/ansible_mitogen/plugins/strategy \
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
		cytopia/ansible:$(ANSIBLE)-aws \
		ansible-playbook playbook.yml --check
endif

# Ansible real run uses default strategy
run:
ifndef GPG_PASS
	docker run --rm -it \
		-e USER=ansible \
		-e MY_UID=$(UID) \
		-e MY_GID=$(GID) \
		-v $${HOME}/.aws/config:/home/ansible/.aws/config:ro \
		-v $${HOME}/.aws/credentials:/home/ansible/.aws/credentials:ro \
		-v $${HOME}/.gnupg/:/home/ansible/.gnupg/ \
		-v $(CURRENT_DIR):/data \
		cytopia/ansible:$(ANSIBLE)-aws ansible-playbook playbook.yml
else
	docker run --rm -it \
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


## :computer: Build locally

To build locally you require GNU Make to be installed. Instructions as  shown below.

### amd64 vs arm64
If you want to build the Ansible image for a different platform, use the `ARCH` make variable as shown below. This also applies to all other examples below.
```bash
# Build amd64 images (default)
make build
make build ARCH=linux/amd64

# Build arm64 images
make build ARCH=linux/arm64
```

### Ansible base
```bash
# Build latest Ansible base
# image: cytopia/ansible:latest
make build

# Build Ansible 2.6 base
# image: cytopia/ansible:2.6
make build VERSION=2.6
```
### Ansible tools
```bash
# Build latest Ansible tools
# image: cytopia/ansible:latest-tools
make build VERSION=latest STAGE=tools

# Build Ansible 2.6 tools
# image: cytopia/ansible:2.6-tools
make build VERSION=2.6 STAGE=tools
```

### Ansible infra
```bash
# Build latest Ansible infra
# image: cytopia/ansible:latest-infra
make build VERSION=latest STAGE=infra

# Build Ansible 2.6 infra
# image: cytopia/ansible:2.6-infra
make build VERSION=2.6 STAGE=infra
```

### Ansible azure
```bash
# Build latest Ansible azure
# image: cytopia/ansible:latest-azure
make build VERSION=latest STAGE=azure

# Build Ansible 2.6 azure
# image: cytopia/ansible:2.6-azure
make build VERSION=2.6 STAGE=azure
```

### Ansible aws
```bash
# Build latest Ansible aws
# image: cytopia/ansible:latest-aws
make build VERSION=latest STAGE=aws

# Build Ansible 2.6 aws
# image: cytopia/ansible:2.6-aws
make build VERSION=2.6 STAGE=aws
```

### Ansible awsk8s
```bash
# Build latest Ansible awsk8s
# image: cytopia/ansible:latest-awsk8s
make build VERSION=latest STAGE=awsk8s

# Build Ansible 2.6 awsk8s
# image: cytopia/ansible:2.6-awsk8s
make build VERSION=2.6 STAGE=awsk8s
```

### Ansible awskops
```bash
# Build latest Ansible with Kops 1.8
# image: cytopia/ansible:latest-awskops1.8
make build VERSION=latest STAGE=awskops KOPS=1.8

# Build Ansible 2.6 with Kops 1.8
# image: cytopia/ansible:2.6-awskops1.8
make build VERSION=2.6 STAGE=awskops KOPS=1.8
```

### Ansible awshelm
```bash
# Build latest Ansible with Helm 2.14
# image: cytopia/ansible:latest-awshelm2.14
make build VERSION=latest STAGE=awshelm HELM=2.14
```


## :arrows_counterclockwise: Related [#awesome-ci](https://github.com/topics/awesome-ci) projects

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
| [kubeval][kubeval-git-lnk]       | [![kubeval-hub-img]][kubeval-hub-lnk] | K8s        | Lint Kubernetes files |
| [checkmake][cm-git-lnk]          | [![cm-hub-img]][cm-hub-lnk]           | Make       | Lint Makefiles |
| [phpcbf][pcbf-git-lnk]           | [![pcbf-hub-img]][pcbf-hub-lnk]       | PHP        | PHP Code Beautifier and Fixer |
| [phpcs][pcs-git-lnk]             | [![pcs-hub-img]][pcs-hub-lnk]         | PHP        | PHP Code Sniffer |
| [phplint][plint-git-lnk]         | [![plint-hub-img]][plint-hub-lnk]     | PHP        | PHP Code Linter **<sup>[1]</sup>** |
| [php-cs-fixer][pcsf-git-lnk]     | [![pcsf-hub-img]][pcsf-hub-lnk]       | PHP        | PHP Coding Standards Fixer |
| [bandit][bandit-git-lnk]         | [![bandit-hub-img]][bandit-hub-lnk]   | Python     | A security linter from PyCQA
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

[kubeval-git-lnk]: https://github.com/cytopia/docker-kubeval
[kubeval-hub-img]: https://img.shields.io/docker/pulls/cytopia/kubeval.svg
[kubeval-hub-lnk]: https://hub.docker.com/r/cytopia/kubeval

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

[bandit-git-lnk]: https://github.com/cytopia/docker-bandit
[bandit-hub-img]: https://img.shields.io/docker/pulls/cytopia/bandit.svg
[bandit-hub-lnk]: https://hub.docker.com/r/cytopia/bandit

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


## :page_facing_up: License


**[MIT License](LICENSE)**

Copyright (c) 2019 [cytopia](https://github.com/cytopia)
