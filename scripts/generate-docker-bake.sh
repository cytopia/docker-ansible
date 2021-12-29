#!/bin/bash
ANSIBLE_VERSIONS="2.5 2.6 2.7 2.8 2.9 2.10 2.11 latest"
FLAVOURS="base tools infra azure aws awsk8s"

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

# Loop targets
for ANSIBLE in $ANSIBLE_VERSIONS ; do
    for FLAVOUR in $FLAVOURS ; do
        case $FLAVOUR in
            base)
                TAG="${ANSIBLE}"
                DOCKERFILE="Dockerfile"
                ;;
            *)
                TAG="${ANSIBLE}-${FLAVOUR}"
                DOCKERFILE="Dockerfile-${FLAVOUR}"
        esac
        TAGS="$TAGS \"${TAG}\","
        cat <<EOT
target "${TAG}" {
  dockerfile = "${DOCKERFILE}"
  context    = "Dockerfiles"
  args = {
    VERSION = "$ANSIBLE"
  }
  tags       = ["\${IMAGE}:${TAG}"]
  cache-from = ["type=registry,ref=\${IMAGE_CACHE}:cache-${TAG}"]
  cache-to   = ["type=registry,ref=\${IMAGE_CACHE}:cache-${TAG}"]
}
EOT
    done
done

# Default group footer
cat <<EOT
group "default" {
  targets = [${TAGS}]
}
EOT
