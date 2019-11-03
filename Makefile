ifneq (,)
.error This Makefile requires GNU Make.
endif

# -------------------------------------------------------------------------------------------------
# Default configuration
# -------------------------------------------------------------------------------------------------
.PHONY: build rebuild lint test _test_version _test_run tag pull login push enter

CURRENT_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# -------------------------------------------------------------------------------------------------
# File-lint configuration
# -------------------------------------------------------------------------------------------------
FL_VERSION = 0.2
FL_IGNORES = .git/,.github/,tests/

# -------------------------------------------------------------------------------------------------
# Docker configuration
# -------------------------------------------------------------------------------------------------
DIR = .
FILE = Dockerfile
IMAGE = cytopia/ansible
TAG = latest
NO_CACHE =


# -------------------------------------------------------------------------------------------------
# Default Target
# -------------------------------------------------------------------------------------------------
help:
	@echo "lint                              Lint repository"
	@echo "build   [TAG=] [KOPS=] [HELM=]    Build image"
	@echo "rebuild [TAG=] [KOPS=] [HELM=]    Build image without cache"
	@echo "test    [TAG=]                    Test build image"
	@echo "tag     [TAG=]                    Tag build image"
	@echo "pull                              Pull FROM image"
	@echo "login   [USER=] [PASS=]           Login to Dockerhub"
	@echo "push    [TAG=]                    Push image to Dockerhub"
	@echo "enter   [TAG=]                    Run and enter build image"


# -------------------------------------------------------------------------------------------------
# Targets
# -------------------------------------------------------------------------------------------------
lint:
	@docker run --rm $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR):/data cytopia/file-lint:$(FL_VERSION) file-cr --text --ignore '$(FL_IGNORES)' --path .
	@docker run --rm $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR):/data cytopia/file-lint:$(FL_VERSION) file-crlf --text --ignore '$(FL_IGNORES)' --path .
	@docker run --rm $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR):/data cytopia/file-lint:$(FL_VERSION) file-trailing-single-newline --text --ignore '$(FL_IGNORES)' --path .
	@docker run --rm $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR):/data cytopia/file-lint:$(FL_VERSION) file-trailing-space --text --ignore '$(FL_IGNORES)' --path .
	@docker run --rm $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR):/data cytopia/file-lint:$(FL_VERSION) file-utf8 --text --ignore '$(FL_IGNORES)' --path .
	@docker run --rm $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR):/data cytopia/file-lint:$(FL_VERSION) file-utf8-bom --text --ignore '$(FL_IGNORES)' --path .


build:
	if echo '$(TAG)' | grep -Eq '^(latest|[.0-9]+?)\-'; then \
		VERSION="$$( echo '$(TAG)' | grep -Eo '^(latest|[.0-9]+?)' )"; \
		SUFFIX="$$( echo '$(TAG)' | grep -Eo '\-.+' )"; \
		docker build \
			$(NO_CACHE) \
			--label "org.opencontainers.image.created"="$$(date --rfc-3339=s)" \
			--label "org.opencontainers.image.revision"="$$(git rev-parse HEAD)" \
			--label "org.opencontainers.image.version"="${TAG}" \
			--build-arg KOPS=$(KOPS) \
			--build-arg HELM=$(HELM) \
			--build-arg VERSION=$${VERSION} \
			-t $(IMAGE) -f $(DIR)/$(FILE)$${SUFFIX} $(DIR); \
	else \
		docker build \
			$(NO_CACHE) \
			--label "org.opencontainers.image.created"="$$(date --rfc-3339=s)" \
			--label "org.opencontainers.image.revision"="$$(git rev-parse HEAD)" \
			--label "org.opencontainers.image.version"="${TAG}" \
			--build-arg VERSION=$(TAG) \
			-t $(IMAGE) -f $(DIR)/$(FILE) $(DIR); \
	fi


rebuild: NO_CACHE=--no-cache
rebuild: pull
rebuild: build


test:
	@$(MAKE) --no-print-directory _test_version
	@$(MAKE) --no-print-directory _test_run


# -------------------------------------------------------------------------------------------------
# Helper Targets
# -------------------------------------------------------------------------------------------------
_test_version:
	@echo "------------------------------------------------------------"
	@echo "- Testing correct version"
	@echo "------------------------------------------------------------"
	@if echo '$(TAG)' | grep -Eq 'latest\-?'; then \
		echo "Fetching latest version from GitHub"; \
		LATEST="$$( \
			curl -L -sS  https://github.com/ansible/ansible/releases/ \
				| tac | tac \
				| grep -Eo "ansible/ansible/releases/tag/v[.0-9]+\"" \
				| head -1 \
				| sed 's/.*v//g' \
				| sed 's/\"//g' \
		)"; \
		echo "Testing for latest: $${LATEST}"; \
		if ! docker run --rm $(IMAGE) ansible --version | grep -E "^[Aa]nsible $${LATEST}$$"; then \
			echo "Failed"; \
			exit 1; \
		fi; \
	else \
		VERSION="$$( echo '$(TAG)' | grep -Eo '^[.0-9]+?' )"; \
		echo "Testing for tag: $${VERSION}"; \
		if ! docker run --rm $(IMAGE) ansible --version | grep -E "^[Aa]nsible $${VERSION}"; then \
			echo "Failed"; \
			exit 1; \
		fi; \
	fi; \
	echo "Success"; \


_test_run:
	@echo "------------------------------------------------------------"
	@echo "- Testing playbook"
	@echo "------------------------------------------------------------"
	@if ! docker run --rm -v $(CURRENT_DIR)/tests:/data $(IMAGE) ansible-playbook -i inventory playbook.yml ; then \
		echo "Failed"; \
		exit 1; \
	fi; \
	echo "Success";


pull:
	@grep -E '^\s*FROM' Dockerfile \
		| sed -e 's/^FROM//g' -e 's/[[:space:]]*as[[:space:]]*.*$$//g' \
		| xargs -n1 docker pull;

login:
	yes | docker login --username $(USER) --password $(PASS)


tag:
	docker tag $(IMAGE) $(IMAGE):$(TAG)


push:
	@$(MAKE) tag TAG=$(TAG)
	docker push $(IMAGE):$(TAG)


enter:
	docker run --rm --name $(subst /,-,$(IMAGE)) -it --entrypoint=/bin/sh $(ARG) $(IMAGE):$(TAG)
