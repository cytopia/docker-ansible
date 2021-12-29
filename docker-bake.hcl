variable "IMAGE" {
  default = "cytopia/ansible"
}
variable "IMAGE_CACHE" {
  default = "ghcr.io/morganchristiansson/docker-ansible"
}
#variable "PLATFORM" {
#  default = "amd64"
#}
target "2.5" {
  dockerfile = "Dockerfile"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.5"
  }
  tags       = ["${IMAGE}:2.5"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.5"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.5"]
}
target "2.5-tools" {
  dockerfile = "Dockerfile-tools"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.5"
  }
  tags       = ["${IMAGE}:2.5-tools"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.5-tools"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.5-tools"]
}
target "2.5-infra" {
  dockerfile = "Dockerfile-infra"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.5"
  }
  tags       = ["${IMAGE}:2.5-infra"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.5-infra"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.5-infra"]
}
target "2.5-azure" {
  dockerfile = "Dockerfile-azure"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.5"
  }
  tags       = ["${IMAGE}:2.5-azure"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.5-azure"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.5-azure"]
}
target "2.5-aws" {
  dockerfile = "Dockerfile-aws"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.5"
  }
  tags       = ["${IMAGE}:2.5-aws"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.5-aws"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.5-aws"]
}
target "2.5-awsk8s" {
  dockerfile = "Dockerfile-awsk8s"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.5"
  }
  tags       = ["${IMAGE}:2.5-awsk8s"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.5-awsk8s"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.5-awsk8s"]
}
target "2.6" {
  dockerfile = "Dockerfile"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.6"
  }
  tags       = ["${IMAGE}:2.6"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.6"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.6"]
}
target "2.6-tools" {
  dockerfile = "Dockerfile-tools"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.6"
  }
  tags       = ["${IMAGE}:2.6-tools"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.6-tools"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.6-tools"]
}
target "2.6-infra" {
  dockerfile = "Dockerfile-infra"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.6"
  }
  tags       = ["${IMAGE}:2.6-infra"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.6-infra"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.6-infra"]
}
target "2.6-azure" {
  dockerfile = "Dockerfile-azure"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.6"
  }
  tags       = ["${IMAGE}:2.6-azure"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.6-azure"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.6-azure"]
}
target "2.6-aws" {
  dockerfile = "Dockerfile-aws"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.6"
  }
  tags       = ["${IMAGE}:2.6-aws"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.6-aws"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.6-aws"]
}
target "2.6-awsk8s" {
  dockerfile = "Dockerfile-awsk8s"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.6"
  }
  tags       = ["${IMAGE}:2.6-awsk8s"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.6-awsk8s"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.6-awsk8s"]
}
target "2.7" {
  dockerfile = "Dockerfile"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.7"
  }
  tags       = ["${IMAGE}:2.7"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.7"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.7"]
}
target "2.7-tools" {
  dockerfile = "Dockerfile-tools"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.7"
  }
  tags       = ["${IMAGE}:2.7-tools"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.7-tools"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.7-tools"]
}
target "2.7-infra" {
  dockerfile = "Dockerfile-infra"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.7"
  }
  tags       = ["${IMAGE}:2.7-infra"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.7-infra"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.7-infra"]
}
target "2.7-azure" {
  dockerfile = "Dockerfile-azure"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.7"
  }
  tags       = ["${IMAGE}:2.7-azure"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.7-azure"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.7-azure"]
}
target "2.7-aws" {
  dockerfile = "Dockerfile-aws"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.7"
  }
  tags       = ["${IMAGE}:2.7-aws"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.7-aws"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.7-aws"]
}
target "2.7-awsk8s" {
  dockerfile = "Dockerfile-awsk8s"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.7"
  }
  tags       = ["${IMAGE}:2.7-awsk8s"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.7-awsk8s"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.7-awsk8s"]
}
target "2.8" {
  dockerfile = "Dockerfile"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.8"
  }
  tags       = ["${IMAGE}:2.8"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.8"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.8"]
}
target "2.8-tools" {
  dockerfile = "Dockerfile-tools"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.8"
  }
  tags       = ["${IMAGE}:2.8-tools"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.8-tools"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.8-tools"]
}
target "2.8-infra" {
  dockerfile = "Dockerfile-infra"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.8"
  }
  tags       = ["${IMAGE}:2.8-infra"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.8-infra"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.8-infra"]
}
target "2.8-azure" {
  dockerfile = "Dockerfile-azure"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.8"
  }
  tags       = ["${IMAGE}:2.8-azure"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.8-azure"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.8-azure"]
}
target "2.8-aws" {
  dockerfile = "Dockerfile-aws"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.8"
  }
  tags       = ["${IMAGE}:2.8-aws"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.8-aws"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.8-aws"]
}
target "2.8-awsk8s" {
  dockerfile = "Dockerfile-awsk8s"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.8"
  }
  tags       = ["${IMAGE}:2.8-awsk8s"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.8-awsk8s"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.8-awsk8s"]
}
target "2.9" {
  dockerfile = "Dockerfile"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.9"
  }
  tags       = ["${IMAGE}:2.9"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.9"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.9"]
}
target "2.9-tools" {
  dockerfile = "Dockerfile-tools"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.9"
  }
  tags       = ["${IMAGE}:2.9-tools"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.9-tools"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.9-tools"]
}
target "2.9-infra" {
  dockerfile = "Dockerfile-infra"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.9"
  }
  tags       = ["${IMAGE}:2.9-infra"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.9-infra"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.9-infra"]
}
target "2.9-azure" {
  dockerfile = "Dockerfile-azure"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.9"
  }
  tags       = ["${IMAGE}:2.9-azure"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.9-azure"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.9-azure"]
}
target "2.9-aws" {
  dockerfile = "Dockerfile-aws"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.9"
  }
  tags       = ["${IMAGE}:2.9-aws"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.9-aws"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.9-aws"]
}
target "2.9-awsk8s" {
  dockerfile = "Dockerfile-awsk8s"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.9"
  }
  tags       = ["${IMAGE}:2.9-awsk8s"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.9-awsk8s"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.9-awsk8s"]
}
target "2.10" {
  dockerfile = "Dockerfile"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.10"
  }
  tags       = ["${IMAGE}:2.10"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.10"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.10"]
}
target "2.10-tools" {
  dockerfile = "Dockerfile-tools"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.10"
  }
  tags       = ["${IMAGE}:2.10-tools"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.10-tools"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.10-tools"]
}
target "2.10-infra" {
  dockerfile = "Dockerfile-infra"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.10"
  }
  tags       = ["${IMAGE}:2.10-infra"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.10-infra"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.10-infra"]
}
target "2.10-azure" {
  dockerfile = "Dockerfile-azure"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.10"
  }
  tags       = ["${IMAGE}:2.10-azure"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.10-azure"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.10-azure"]
}
target "2.10-aws" {
  dockerfile = "Dockerfile-aws"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.10"
  }
  tags       = ["${IMAGE}:2.10-aws"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.10-aws"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.10-aws"]
}
target "2.10-awsk8s" {
  dockerfile = "Dockerfile-awsk8s"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.10"
  }
  tags       = ["${IMAGE}:2.10-awsk8s"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.10-awsk8s"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.10-awsk8s"]
}
target "2.11" {
  dockerfile = "Dockerfile"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.11"
  }
  tags       = ["${IMAGE}:2.11"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.11"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.11"]
}
target "2.11-tools" {
  dockerfile = "Dockerfile-tools"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.11"
  }
  tags       = ["${IMAGE}:2.11-tools"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.11-tools"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.11-tools"]
}
target "2.11-infra" {
  dockerfile = "Dockerfile-infra"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.11"
  }
  tags       = ["${IMAGE}:2.11-infra"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.11-infra"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.11-infra"]
}
target "2.11-azure" {
  dockerfile = "Dockerfile-azure"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.11"
  }
  tags       = ["${IMAGE}:2.11-azure"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.11-azure"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.11-azure"]
}
target "2.11-aws" {
  dockerfile = "Dockerfile-aws"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.11"
  }
  tags       = ["${IMAGE}:2.11-aws"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.11-aws"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.11-aws"]
}
target "2.11-awsk8s" {
  dockerfile = "Dockerfile-awsk8s"
  context    = "Dockerfiles"
  args = {
    VERSION = "2.11"
  }
  tags       = ["${IMAGE}:2.11-awsk8s"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-2.11-awsk8s"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-2.11-awsk8s"]
}
target "latest" {
  dockerfile = "Dockerfile"
  context    = "Dockerfiles"
  args = {
    VERSION = "latest"
  }
  tags       = ["${IMAGE}:latest"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-latest"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-latest"]
}
target "latest-tools" {
  dockerfile = "Dockerfile-tools"
  context    = "Dockerfiles"
  args = {
    VERSION = "latest"
  }
  tags       = ["${IMAGE}:latest-tools"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-latest-tools"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-latest-tools"]
}
target "latest-infra" {
  dockerfile = "Dockerfile-infra"
  context    = "Dockerfiles"
  args = {
    VERSION = "latest"
  }
  tags       = ["${IMAGE}:latest-infra"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-latest-infra"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-latest-infra"]
}
target "latest-azure" {
  dockerfile = "Dockerfile-azure"
  context    = "Dockerfiles"
  args = {
    VERSION = "latest"
  }
  tags       = ["${IMAGE}:latest-azure"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-latest-azure"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-latest-azure"]
}
target "latest-aws" {
  dockerfile = "Dockerfile-aws"
  context    = "Dockerfiles"
  args = {
    VERSION = "latest"
  }
  tags       = ["${IMAGE}:latest-aws"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-latest-aws"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-latest-aws"]
}
target "latest-awsk8s" {
  dockerfile = "Dockerfile-awsk8s"
  context    = "Dockerfiles"
  args = {
    VERSION = "latest"
  }
  tags       = ["${IMAGE}:latest-awsk8s"]
  cache-from = ["type=registry,ref=${IMAGE_CACHE}:cache-latest-awsk8s"]
  cache-to   = ["type=registry,ref=${IMAGE_CACHE}:cache-latest-awsk8s"]
}
group "default" {
  targets = [ "2.5", "2.5-tools", "2.5-infra", "2.5-azure", "2.5-aws", "2.5-awsk8s", "2.6", "2.6-tools", "2.6-infra", "2.6-azure", "2.6-aws", "2.6-awsk8s", "2.7", "2.7-tools", "2.7-infra", "2.7-azure", "2.7-aws", "2.7-awsk8s", "2.8", "2.8-tools", "2.8-infra", "2.8-azure", "2.8-aws", "2.8-awsk8s", "2.9", "2.9-tools", "2.9-infra", "2.9-azure", "2.9-aws", "2.9-awsk8s", "2.10", "2.10-tools", "2.10-infra", "2.10-azure", "2.10-aws", "2.10-awsk8s", "2.11", "2.11-tools", "2.11-infra", "2.11-azure", "2.11-aws", "2.11-awsk8s", "latest", "latest-tools", "latest-infra", "latest-azure", "latest-aws", "latest-awsk8s",]
}
