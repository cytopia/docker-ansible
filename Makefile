# Additional Makefiles are pulled from:
# https://github.com/devilbox/makefiles/


ifneq (,)
.error This Makefile requires GNU Make.
endif

# Ensure additional Makefiles are present
MAKEFILES = Makefile.docker Makefile.lint
$(MAKEFILES): URL=https://raw.githubusercontent.com/devilbox/makefiles/master/$(@)
$(MAKEFILES):
	@if ! (curl --fail -sS -o $(@) $(URL) || wget -O $(@) $(URL)); then \
		echo "Error, curl or wget required."; \
		echo "Exiting."; \
		false; \
	fi
include $(MAKEFILES)

# Set default Target
.DEFAULT_GOAL := help


# -------------------------------------------------------------------------------------------------
# Default configuration
# -------------------------------------------------------------------------------------------------
# Own vars
TAG        = latest

# Makefile.docker overwrites
NAME       = ansible
VERSION    = latest
IMAGE      = cytopia/ansible
FLAVOUR    = default
STAGE      = base
DIR        = Dockerfiles
FILE       = Dockerfile-$(STAGE)
DOCKER_TAG = $(VERSION)

ifeq ($(strip $(STAGE)),base)
	DOCKER_TAG = $(VERSION)
else
	DOCKER_TAG = $(VERSION)-$(STAGE)$(KOPS)$(HELM)
endif

# Makefile.lint overwrites
FL_IGNORES  = .git/,.github/,tests/
SC_IGNORES  = .git/,.github/,tests/
JL_IGNORES  = .git/,.github/,./tests/


# -------------------------------------------------------------------------------------------------
#  Default Target
# -------------------------------------------------------------------------------------------------
.PHONY: help
help:
	@echo "--------------------------------------------------------------------------------"
	@echo " Build Targets"
	@echo "--------------------------------------------------------------------------------"
	@echo
	@echo "All Docker images are build as follows: $(IMAGE):\$$VERSION[-\$$STAGE[\$$KOPS|\$$HELM]]"
	@echo
	@echo "build   [VERSION=] [ARCH=] [KOPS=] [HELM=]        Build Docker image"
	@echo "rebuild [VERSION=] [ARCH=] [KOPS=] [HELM=]        Build Docker image without cache"
	@echo
	@echo "    make build VERSION=2.3"
	@echo "    make build VERSION=2.3 STAGE=tools"
	@echo "    make build VERSION=2.3 STAGE=infra"
	@echo "    make build VERSION=2.3 STAGE=azure"
	@echo "    make build VERSION=2.3 STAGE=aws"
	@echo "    make build VERSION=2.3 STAGE=awsk8s"
	@echo "    make build VERSION=2.3 STAGE=awshelm HELM=2.11"
	@echo "    make build VERSION=2.3 STAGE=awskops KOPS=1.15"
	@echo
	@echo "--------------------------------------------------------------------------------"
	@echo " Test Targets"
	@echo "--------------------------------------------------------------------------------"
	@echo
	@echo "test [VERSION=] [ARCH=] [KOPS=] [HELM=]           Test built Docker image"
	@echo
	@echo "    make test VERSION=2.3"
	@echo "    make test VERSION=2.3 STAGE=tools"
	@echo "    make test VERSION=2.3 STAGE=infra"
	@echo "    make test VERSION=2.3 STAGE=azure"
	@echo "    make test VERSION=2.3 STAGE=aws"
	@echo "    make test VERSION=2.3 STAGE=awsk8s"
	@echo "    make test VERSION=2.3 STAGE=awshelm HELM=2.11"
	@echo "    make test VERSION=2.3 STAGE=awskops KOPS=1.15"
	@echo
	@echo "--------------------------------------------------------------------------------"
	@echo " Tagging Target"
	@echo "--------------------------------------------------------------------------------"
	@echo
	@echo "tag [VERSION=] [ARCH=] [KOPS=] [HELM=] [TAG=]     Tag built Docker image"
	@echo
	@echo "    make tag VERSION=2.3 TAG=2.3-mysuffix"
	@echo "    make tag VERSION=2.3 STAGE=tools TAG=2.3-tools-mysuffix"
	@echo "    make tag VERSION=2.3 STAGE=infra TAG=2.3-infra-mysuffix"
	@echo "    make tag VERSION=2.3 STAGE=azure TAG=2.3-azure-mysuffix"
	@echo "    make tag VERSION=2.3 STAGE=aws TAG=2.3-aws-mysuffix"
	@echo "    make tag VERSION=2.3 STAGE=awsk8s TAG=2.3-awsk8s-mysuffix"
	@echo "    make tag VERSION=2.3 STAGE=awshelm HELM=2.11 TAG=2.3-awshelm-mysuffix"
	@echo "    make tag VERSION=2.3 STAGE=awskops KOPS=1.15 TAG=2.3-awskops-mysuffix"


# -------------------------------------------------------------------------------------------------
#  Docker Targets
# -------------------------------------------------------------------------------------------------
.PHONY: build
build: ARGS+=--build-arg VERSION=$(VERSION)
build: ARGS+=--build-arg KOPS=$(KOPS)
build: ARGS+=--build-arg HELM=$(HELM)
build: docker-arch-build

.PHONY: rebuild
rebuild: ARGS+=--build-arg VERSION=$(VERSION)
rebuild: ARGS+=--build-arg KOPS=$(KOPS)
rebuild: ARGS+=--build-arg HELM=$(HELM)
rebuild: docker-arch-rebuild

.PHONY: tag
tag:
	@if [ "$(TAG)" = "latest" ]; then \
		if [ "$(STAGE)" = "base" ]; then \
			echo "docker tag $(IMAGE):$(DOCKER_TAG) $(IMAGE):$(VERSION)"; \
			docker tag $(IMAGE):$(DOCKER_TAG) $(IMAGE):$(VERSION); \
		else \
			echo "docker tag $(IMAGE):$(DOCKER_TAG) $(IMAGE):$(VERSION)-$(STAGE)$(KOPS)$(HELM)"; \
			docker tag $(IMAGE):$(DOCKER_TAG) $(IMAGE):$(VERSION)-$(STAGE)$(KOPS)$(HELM); \
		fi \
	else \
		if [ "$(STAGE)" = "base" ]; then \
			echo "docker tag $(IMAGE):$(DOCKER_TAG) $(IMAGE):$(VERSION)-$(TAG)"; \
			docker tag $(IMAGE):$(DOCKER_TAG) $(IMAGE):$(VERSION)-$(TAG); \
		else \
			echo "docker tag $(IMAGE):$(DOCKER_TAG) $(IMAGE):$(VERSION)-$(STAGE)$(KOPS)$(HELM)-$(TAG)"; \
			docker tag $(IMAGE):$(DOCKER_TAG) $(IMAGE):$(VERSION)-$(STAGE)$(KOPS)$(HELM)-$(TAG); \
		fi \
	fi

.PHONY: push
ifeq ($(strip $(TAG)),latest)
ifeq ($(strip $(STAGE)),base)
push: DOCKER_TAG = $(VERSION)
push: docker-arch-push
else
push: DOCKER_TAG = $(VERSION)-$(STAGE)$(KOPS)$(HELM)
push: docker-arch-push
endif
else
ifeq ($(strip $(STAGE)),base)
push: DOCKER_TAG = $(VERSION)-$(TAG)
push: docker-arch-push
else
push: DOCKER_TAG = $(VERSION)-$(STAGE)$(KOPS)$(HELM)-$(TAG)
push: docker-arch-push
endif
endif


# -------------------------------------------------------------------------------------------------
#  Manifest Targets
# -------------------------------------------------------------------------------------------------
.PHONY: manifest-create
ifeq ($(strip $(TAG)),latest)
ifeq ($(strip $(STAGE)),base)
manifest-create: DOCKER_TAG = $(VERSION)
manifest-create: docker-manifest-create
else
manifest-create: DOCKER_TAG = $(VERSION)-$(STAGE)$(KOPS)$(HELM)
manifest-create: docker-manifest-create
endif
else
ifeq ($(strip $(STAGE)),base)
manifest-create: DOCKER_TAG = $(VERSION)-$(TAG)
manifest-create: docker-manifest-create
else
manifest-create: DOCKER_TAG = $(VERSION)-$(STAGE)$(KOPS)$(HELM)-$(TAG)
manifest-create: docker-manifest-create
endif
endif

.PHONY: manifest-push
ifeq ($(strip $(TAG)),latest)
ifeq ($(strip $(STAGE)),base)
manifest-push: DOCKER_TAG = $(VERSION)
manifest-push: docker-manifest-push
else
manifest-push: DOCKER_TAG = $(VERSION)-$(STAGE)$(KOPS)$(HELM)
manifest-push: docker-manifest-push
endif
else
ifeq ($(strip $(STAGE)),base)
manifest-push: DOCKER_TAG = $(VERSION)-$(TAG)
manifest-push: docker-manifest-push
else
manifest-push: DOCKER_TAG = $(VERSION)-$(STAGE)$(KOPS)$(HELM)-$(TAG)
manifest-push: docker-manifest-push
endif
endif


# -------------------------------------------------------------------------------------------------
#  Save / Load Targets
# -------------------------------------------------------------------------------------------------
.PHONY: save
save: docker-save

.PHONY: load
load: docker-load

.PHONY: save-verify
save-verify: save
save-verify: load


# -------------------------------------------------------------------------------------------------
# Test Targets
# -------------------------------------------------------------------------------------------------
.PHONY: test
test: test-architecture-uname
test: test-architecture-inspect
test: test-ansible-version
test: test-python-libs
test: test-binaries
test: test-helm-version
test: test-kops-version
test: test-run-user-root
test: test-run-user-ansible

.PHONY: test-architecture-uname
test-architecture-uname:
	@echo "################################################################################"
	@echo "# Testing correct Architecture - uname ($(ARCH))"
	@echo "################################################################################"
	@echo "docker run --rm --platform $(ARCH) --entrypoint=sh $(IMAGE):$(DOCKER_TAG) -c 'uname -m'"
	@\
	if [ "$(ARCH)" = "linux/amd64" ]; then \
		if ! docker run --rm --platform $(ARCH) --entrypoint=sh $(IMAGE):$(DOCKER_TAG) -c 'uname -m' | grep -E '^x86_64$$'; then \
			echo "[FAILED]"; \
			docker run --rm --platform $(ARCH) --entrypoint=sh $(IMAGE):$(DOCKER_TAG) -c 'uname -m'; \
			exit 1; \
		fi; \
	elif [ "$(ARCH)" = "linux/arm64" ]; then \
		if ! docker run --rm --platform $(ARCH) --entrypoint=sh $(IMAGE):$(DOCKER_TAG) -c 'uname -m' | grep -E '^aarch64$$'; then \
			echo "[FAILED]"; \
			docker run --rm --platform $(ARCH) --entrypoint=sh $(IMAGE):$(DOCKER_TAG) -c 'uname -m'; \
			exit 1; \
		fi; \
	else \
		echo "[FAILED]"; \
		echo "Wrong ARCH variable specified: $(ARCH)"; \
		exit 1; \
	fi; \
	echo "[SUCCESS]"; \
	echo

.PHONY: test-architecture-inspect
test-architecture-inspect:
	@echo "################################################################################"
	@echo "# Testing correct Architecture - inspect ($(ARCH))"
	@echo "################################################################################"
	@echo "docker image inspect $(IMAGE):$(DOCKER_TAG) -f '{{ .Architecture }}'"
	@\
	if [ "$(ARCH)" = "linux/amd64" ]; then \
		if ! docker image inspect $(IMAGE):$(DOCKER_TAG) -f '{{ .Architecture }}' | grep -E '^amd64$$'; then \
			echo "[FAILED]"; \
			docker image inspect $(IMAGE):$(DOCKER_TAG) -f '{{ .Architecture }}'; \
			exit 1; \
		fi; \
	elif [ "$(ARCH)" = "linux/arm64" ]; then \
		if ! docker image inspect $(IMAGE):$(DOCKER_TAG) -f '{{ .Architecture }}' | grep -E '^arm64$$'; then \
			echo "[FAILED]"; \
			docker image inspect $(IMAGE):$(DOCKER_TAG) -f '{{ .Architecture }}'; \
			exit 1; \
		fi; \
	else \
		echo "[FAILED]"; \
		echo "Wrong ARCH variable specified: $(ARCH)"; \
		exit 1; \
	fi; \
	echo "[SUCCESS]"; \
	echo



.PHONY: test-ansible-version
test-ansible-version:
	@echo "################################################################################"
	@echo "# Testing correct Ansible version"
	@echo "################################################################################"
	@\
	if echo '$(ANSIBLE)' | grep -Eq 'latest\-?'; then \
		echo "Fetching latest version from GitHub"; \
		TEST_VERSION="$$( \
			curl -L -sS  https://github.com/ansible/ansible/releases/ \
				| tac | tac \
				| grep -Eo "ansible/ansible/releases/tag/v[.0-9]+\"" \
				| sed 's/.*v//g' \
				| sed 's/\"//g' \
				| sort -V \
				| tail -1 \
		)"; \
	else \
		TEST_VERSION="$$( echo '$(ANSIBLE)' )"; \
	fi; \
	\
	\
	echo "Testing against Ansible version: $${TEST_VERSION}"; \
	echo "docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) ansible --version | grep -E \"^[Aa]nsible.+$${TEST_VERSION}\""; \
	\
	\
	if ! docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) ansible --version | grep -E "^[Aa]nsible.+$${TEST_VERSION}"; then \
		echo "[FAILED]"; \
		docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) ansible --version; \
		exit 1; \
	fi; \
	echo "[SUCCESS]"; \
	echo

.PHONY: test-python-libs
test-python-libs:
	@echo "################################################################################"
	@echo "# Testing correct Python libraries"
	@echo "################################################################################"
	@echo "docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) pip3 freeze"
	@\
	\
	\
	LIBS="$$( docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) pip3 freeze )"; \
	\
	\
	REQUIRED_BASE="cffi cryptography paramiko Jinja2 PyYAML"; \
	REQUIRED_TOOLS="dnspython mitogen"; \
	REQUIRED_INFRA="docker docker-compose jsondiff pexpect psycopg2 pypsexec pymongo PyMySQL smbprotocol pywinrm"; \
	REQUIRED_AZURE="azure\-.*"; \
	REQUIRED_AWS="awscli botocore boto boto3"; \
	REQUIRED_AWSK8S="openshift"; \
	REQUIRED_AWSKOPS=""; \
	REQUIRED_AWSHELM=""; \
	\
	\
	if [ "$(STAGE)" = "base" ]; then \
		for lib in $$( echo $${REQUIRED_BASE} ); do \
			if echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] required lib available: $${lib}"; \
			else \
				echo "[FAILED] required lib not available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
		for lib in $${REQUIRED_TOOLS}; do \
			if ! echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] unwanted lib not available: $${lib}"; \
			else \
				echo "[FAILED] unwanted lib available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "tools" ]; then \
		for lib in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} ); do \
			if echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] required lib available: $${lib}"; \
			else \
				echo "[FAILED] required lib not available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
		for lib in $${REQUIRED_INFRA}; do \
			if ! echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] unwanted lib not available: $${lib}"; \
			else \
				echo "[FAILED] unwanted lib available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "infra" ]; then \
		for lib in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} $${REQUIRED_INFRA} ); do \
			if echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] required lib available: $${lib}"; \
			else \
				echo "[FAILED] required lib not available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
		for lib in $${REQUIRED_AZURE}; do \
			if ! echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] unwanted lib not available: $${lib}"; \
			else \
				echo "[FAILED] unwanted lib available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "azure" ]; then \
		for lib in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} $${REQUIRED_AZURE} ); do \
			if echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] required lib available: $${lib}"; \
			else \
				echo "[FAILED] required lib not available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
		for lib in $${REQUIRED_AWS}; do \
			if ! echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] unwanted lib not available: $${lib}"; \
			else \
				echo "[FAILED] unwanted lib available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "aws" ]; then \
		for lib in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} $${REQUIRED_AWS} ); do \
			if echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] required lib available: $${lib}"; \
			else \
				echo "[FAILED] required lib not available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
		for lib in $${REQUIRED_AWSK8S}; do \
			if ! echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] unwanted lib not available: $${lib}"; \
			else \
				echo "[FAILED] unwanted lib available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "awsk8s" ]; then \
		for lib in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} $${REQUIRED_AWS} $${REQUIRED_AWSK8S} ); do \
			if echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] required lib available: $${lib}"; \
			else \
				echo "[FAILED] required lib not available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
		for lib in $$( echo $${REQUIRED_AWSKOPS} $${REQUIRED_AWSHELM} ); do \
			if ! echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] unwanted lib not available: $${lib}"; \
			else \
				echo "[FAILED] unwanted lib available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "awskops" ]; then \
		for lib in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} $${REQUIRED_AWS} $${REQUIRED_AWSK8S} $${REQUIRED_AWSKOPS} ); do \
			if echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] required lib available: $${lib}"; \
			else \
				echo "[FAILED] required lib not available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "awshelm" ]; then \
		for lib in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} $${REQUIRED_AWS} $${REQUIRED_AWSK8S} $${REQUIRED_AWSHELM} ); do \
			if echo "$${LIBS}" | grep -E "^$${lib}" >/dev/null; then \
				echo "[OK] required lib available: $${lib}"; \
			else \
				echo "[FAILED] required lib not available: $${lib}"; \
				exit 1; \
			fi; \
		done; \
	\
	fi; \
	echo "[SUCCESS]"; \
	echo

.PHONY: test-binaries
test-binaries:
	@echo "################################################################################"
	@echo "# Testing correct Binaries"
	@echo "################################################################################"
	@echo "docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) find /usr/bin/ -type f | sed 's|/usr/bin/||g'"
	@\
	\
	\
	BINS="$$( docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) find /usr/bin/ -type f | sed 's|/usr/bin/||g' )"; \
	\
	\
	REQUIRED_BASE="python"; \
	REQUIRED_TOOLS="git gpg jq yq ssh"; \
	REQUIRED_INFRA="rsync"; \
	REQUIRED_AZURE="az"; \
	REQUIRED_AWS="aws aws-iam-authenticator"; \
	REQUIRED_AWSK8S="kubectl oc"; \
	REQUIRED_AWSKOPS="kops"; \
	REQUIRED_AWSHELM="helm"; \
	\
	\
	if [ "$(STAGE)" = "base" ]; then \
		for bin in $$( echo $${REQUIRED_BASE} ); do \
			if echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] required bin available: $${bin}"; \
			else \
				echo "[FAILED] required bin not available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
		for bin in $${REQUIRED_TOOLS}; do \
			if ! echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] unwanted bin not available: $${bin}"; \
			else \
				echo "[FAILED] unwanted bin available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "tools" ]; then \
		for bin in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} ); do \
			if echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] required bin available: $${bin}"; \
			else \
				echo "[FAILED] required bin not available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
		for bin in $${REQUIRED_INFRA}; do \
			if ! echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] unwanted bin not available: $${bin}"; \
			else \
				echo "[FAILED] unwanted bin available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "infra" ]; then \
		for bin in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} $${REQUIRED_INFRA} ); do \
			if echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] required bin available: $${bin}"; \
			else \
				echo "[FAILED] required bin not available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
		for bin in $${REQUIRED_AZURE}; do \
			if ! echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] unwanted bin not available: $${bin}"; \
			else \
				echo "[FAILED] unwanted bin available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "azure" ]; then \
		for bin in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} $${REQUIRED_AZURE} ); do \
			if echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] required bin available: $${bin}"; \
			else \
				echo "[FAILED] required bin not available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
		for bin in $${REQUIRED_AWS}; do \
			if ! echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] unwanted bin not available: $${bin}"; \
			else \
				echo "[FAILED] unwanted bin available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "aws" ]; then \
		for bin in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} $${REQUIRED_AWS} ); do \
			if echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] required bin available: $${bin}"; \
			else \
				echo "[FAILED] required bin not available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
		for bin in $${REQUIRED_AWSK8S}; do \
			if ! echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] unwanted bin not available: $${bin}"; \
			else \
				echo "[FAILED] unwanted bin available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "awsk8s" ]; then \
		for bin in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} $${REQUIRED_AWS} $${REQUIRED_AWSK8S} ); do \
			if echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] required bin available: $${bin}"; \
			else \
				echo "[FAILED] required bin not available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
		for bin in $$( echo $${REQUIRED_AWSKOPS} $${REQUIRED_AWSHELM} ); do \
			if ! echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] unwanted bin not available: $${bin}"; \
			else \
				echo "[FAILED] unwanted bin available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "awskops" ]; then \
		for bin in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} $${REQUIRED_AWS} $${REQUIRED_AWSK8S} $${REQUIRED_AWSKOPS} ); do \
			if echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] required bin available: $${bin}"; \
			else \
				echo "[FAILED] required bin not available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
	\
	elif [ "$(STAGE)" = "awshelm" ]; then \
		for bin in $$( echo $${REQUIRED_BASE} $${REQUIRED_TOOLS} $${REQUIRED_AWS} $${REQUIRED_AWSK8S} $${REQUIRED_AWSHELM} ); do \
			if echo "$${BINS}" | grep -E "^$${bin}" >/dev/null; then \
				echo "[OK] required bin available: $${bin}"; \
			else \
				echo "[FAILED] required bin not available: $${bin}"; \
				exit 1; \
			fi; \
		done; \
	\
	fi; \
	echo "[SUCCESS]"; \
	echo

.PHONY: test-helm-version
test-helm-version:
	@echo "################################################################################"
	@echo "# Testing correct Helm version"
	@echo "################################################################################"
	@\
	if [ "$(STAGE)" = "awshelm" ]; then \
		if echo '$(HELM)' | grep -Eq 'latest\-?'; then \
			echo "Fetching latest version from GitHub"; \
			LATEST="$$( \
				curl -L -sS https://github.com/helm/helm/releases \
					| tac | tac \
					| grep -Eo "helm/helm/releases/tag/v[.0-9]+\"" \
					| head -1 \
					| sed 's/.*v//g' \
					| sed 's/\"//g' \
			)"; \
			echo "Testing for latest: $${LATEST}"; \
			echo "docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) helm version --client --short | grep -E \"^(Client: )?v$${LATEST}\""; \
			if ! docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) helm version --client --short | grep -E "^(Client: )?v$${LATEST}"; then \
				echo "[FAILED]"; \
				docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) helm version --client --short; \
				exit 1; \
			fi; \
		else \
			VERSION="$$( echo '$(HELM)' | grep -Eo '^[.0-9]+?' )"; \
			echo "Testing for version: $${VERSION}"; \
			echo "docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) helm version --client --short | grep -E \"^(Client: )?v$${VERSION}\.\""; \
			if ! docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) helm version --client --short | grep -E "^(Client: )?v$${VERSION}\."; then \
				echo "[FAILED]"; \
				docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) helm version --client --short; \
				exit 1; \
			fi; \
		fi; \
		echo "[SUCCESS]"; \
	else \
		echo "[SKIPPING] Not a Helm image"; \
	fi; \
	echo

.PHONY: test-kops-version
test-kops-version:
	@echo "################################################################################"
	@echo "# Testing correct Kops version"
	@echo "################################################################################"
	@\
	if [ "$(STAGE)" = "awskops" ]; then \
		if echo '$(KOPS)' | grep -Eq 'latest\-?'; then \
			echo "Fetching latest version from GitHub"; \
			LATEST="$$( \
				curl -L -sS https://github.com/kubernetes/kops/releases \
					| tac | tac \
					| grep -Eo "kubernetes/kops/releases/tag/v[.0-9]+\"" \
					| head -1 \
					| sed 's/.*v//g' \
					| sed 's/\"//g' \
			)"; \
			echo "Testing for latest: $${LATEST}"; \
			echo "docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) kops version | grep -E \"^([Cc]lient\s)?[Vv]ersion(:)?\s+v?$${LATEST}\""; \
			if ! docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) kops version | grep -E "^([Cc]lient\s)?[Vv]ersion(:)?\s+v?$${LATEST}"; then \
				echo "[FAILED]"; \
				docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) kops version; \
				exit 1; \
			fi; \
		else \
			VERSION="$$( echo '$(KOPS)' | grep -Eo '^[.0-9]+?' )"; \
			echo "Testing for version: $${VERSION}"; \
			echo "docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) kops version | grep -E \"^([Cc]lient\s)?[Vv]ersion(:)?\s+v?$${VERSION}\.\""; \
			if ! docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) kops version | grep -E "^([Cc]lient\s)?[Vv]ersion(:)?\s+v?$${VERSION}\."; then \
				echo "[FAILED]"; \
				docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) kops version; \
				exit 1; \
			fi; \
		fi; \
		echo "[SUCCESS]"; \
	else \
		echo "[SKIPPING] Not a Kops image"; \
	fi; \
	echo

.PHONY: test-run-user-root
test-run-user-root:
	@echo "################################################################################"
	@echo "# Testing playbook (user: root)"
	@echo "################################################################################"
	@echo "docker run --rm --platform $(ARCH) $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR)/tests:/data $(IMAGE):$(DOCKER_TAG) ansible-playbook -i inventory playbook.yml"
	@\
	if ! docker run --rm --platform $(ARCH) $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR)/tests:/data $(IMAGE):$(DOCKER_TAG) ansible-playbook -i inventory playbook.yml; then \
		echo "[FAILED]"; \
		exit 1; \
	fi; \
	echo "[SUCCESS]"; \
	echo

.PHONY: test-run-user-ansible
test-run-user-ansible:
	@echo "################################################################################"
	@echo "# Testing playbook (user: ansible)"
	@echo "################################################################################"
	@\
	if [ "$(STAGE)" = "base" ]; then \
		echo "[SKIPPING] Does not have user setup"; \
	else \
		echo "docker run --rm --platform $(ARCH) $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR)/tests:/data -e USER=ansible -e MY_UID=$$(id -u) -e MY_GID=$$(id -g) $(IMAGE):$(DOCKER_TAG) ansible-playbook -i inventory playbook.yml"; \
		if ! docker run --rm --platform $(ARCH) $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR)/tests:/data -e USER=ansible -e MY_UID=$$(id -u) -e MY_GID=$$(id -g) $(IMAGE):$(DOCKER_TAG) ansible-playbook -i inventory playbook.yml ; then \
			echo "[FAILED]"; \
			exit 1; \
		fi; \
	fi; \
	echo "[SUCCESS]"; \
	echo
