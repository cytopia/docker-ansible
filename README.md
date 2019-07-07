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

Tiny Alpine-based multistage-build dockerized version of [Ansible](https://github.com/ansible/ansible)<sup>[1]</sup>.
The image is built nightly against multiple stable versions and pushed to Dockerhub.

<sup>[1] Official project: https://github.com/ansible/ansible</sup>


## Available Docker image versions

| Docker tag | Build from |
|------------|------------|
| `latest`   | Latest stable Ansible version |
| `2.8`      | Latest stable Ansible 2.8.x version |
| `2.7`      | Latest stable Ansible 2.7.x version |
| `2.6`      | Latest stable Ansible 2.6.x version |
| `2.5`      | Latest stable Ansible 2.5.x version |
| `2.4`      | Latest stable Ansible 2.4.x version |
| `2.3`      | Latest stable Ansible 2.3.x version |


## Docker mounts

The working directory inside the Docker container is **`/data/`** and should be mounted locally to
the root of your project where your Ansible playbooks are.


## Usage

```bash
docker run --rm -v $(pwd):/data cytopia/ansible ansible-playbook playbook.yml
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
