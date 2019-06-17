# Docker image for `ansible`

[![Build Status](https://travis-ci.com/cytopia/docker-ansible.svg?branch=master)](https://travis-ci.com/cytopia/docker-ansible)
[![Tag](https://img.shields.io/github/tag/cytopia/docker-ansible.svg)](https://github.com/cytopia/docker-ansible/releases)
[![](https://images.microbadger.com/badges/version/cytopia/ansible:latest.svg)](https://microbadger.com/images/cytopia/ansible:latest "ansible")
[![](https://images.microbadger.com/badges/image/cytopia/ansible:latest.svg)](https://microbadger.com/images/cytopia/ansible:latest "ansible")
[![](https://img.shields.io/badge/github-cytopia%2Fdocker--ansible-red.svg)](https://github.com/cytopia/docker-ansible "github.com/cytopia/docker-ansible")
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

> #### All awesome CI images
>
> [ansible](https://github.com/cytopia/docker-ansible) |
> [ansible-lint](https://github.com/cytopia/docker-ansible-lint) |
> [awesome-ci](https://github.com/cytopia/awesome-ci) |
> [eslint](https://github.com/cytopia/docker-eslint) |
> [file-lint](https://github.com/cytopia/docker-file-lint) |
> [jsonlint](https://github.com/cytopia/docker-jsonlint) |
> [pycodestyle](https://github.com/cytopia/docker-pycodestyle) |
> [terraform-docs](https://github.com/cytopia/docker-terraform-docs) |
> [yamllint](https://github.com/cytopia/docker-yamllint)


View **[Dockerfile](https://github.com/cytopia/docker-ansible/blob/master/Dockerfile)** on GitHub.

[![Docker hub](http://dockeri.co/image/cytopia/ansible)](https://hub.docker.com/r/cytopia/ansible)

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


## Docker mounts

The working directory inside the Docker container is **`/data/`** and should be mounted locally to
the root of your project where your Ansible playbooks are.


## Usage

```bash
docker run --rm -v $(pwd):/data cytopia/ansible ansible-playbook playbook.yml
```


## License

**[MIT License](LICENSE)**

Copyright (c) 2019 [cytopia](https://github.com/cytopia)
