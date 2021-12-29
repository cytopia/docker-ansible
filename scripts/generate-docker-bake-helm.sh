#!/bin/bash
ANSIBLE_VERSIONS="2.5 2.6 2.7 2.8 2.9 2.10 2.11 latest"
FLAVOURS="base tools aws awsk8s awshelm"
HELM_VERSIONS="2.11 2.12 2.13 2.14 2.15 2.16 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7"
FLAVOUR=awshelm

# docker-bake.hcl header
cat <<EOT
variable "IMAGE" {
  default = "cytopia/ansible"
}
variable "IMAGE_CACHE" {
  default = "ghcr.io/morganchristiansson/docker-ansible"
}
#variable "PLATFORM" {
#  default = "amd64"
#}
EOT

for ANSIBLE_VERSION in $ANSIBLE_VERSIONS ; do
  for HELM_VERSION in $HELM_VERSIONS ; do
    TARGETS="$TARGETS \"ansible-$ANSIBLE_VERSION-$HELM_VERSION\","
    cat <<EOT
target "ansible-$ANSIBLE_VERSION-$HELM_VERSION" {
    dockerfile = "Dockerfiles/Dockerfile.${FLAVOUR}"
    args = {
      VERSION = "$ANSIBLE_VERSION"
      HELM = "$HELM_VERSION"
    }
    tags = ["\${IMAGE}:${ANSIBLE_VERSION}-${FLAVOUR}${HELM_VERSION}-\${PLATFORM}"]
}
EOT
  done
done

cat <<EOT
group "default" {
  targets = [$TARGETS]
}
EOT
