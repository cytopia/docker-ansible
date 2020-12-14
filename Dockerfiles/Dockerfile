# --------------------------------------------------------------------------------------------------
# Builder Image
# --------------------------------------------------------------------------------------------------
FROM alpine:3.9 as builder

# Required tools for building Python packages
RUN set -eux \
	&& apk add --no-cache \
		bc \
		gcc \
		libffi-dev \
		make \
		musl-dev \
		openssl-dev \
		python3 \
		python3-dev

ARG VERSION
RUN set -eux \
	&& if [ "${VERSION}" = "latest" ]; then \
		pip3 install --no-cache-dir --no-compile ansible; \
	elif [ "${VERSION}" = "2.9" ]; then \
		pip3 install --no-cache-dir --no-compile "ansible>=${VERSION},<2.10"; \
	elif [ "${VERSION}" = "2.10" ]; then \
		pip3 install --no-cache-dir --no-compile "ansible>=${VERSION},<2.11"; \
	else \
		pip3 install --no-cache-dir --no-compile "ansible>=${VERSION},<$(echo "${VERSION}+0.1" | bc)"; \
	fi \
	&& find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf \
	&& find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf

# Python packages (copied to final image)
RUN set -eux \
	&& apk add --no-cache  \
	&& pip3 install --no-cache-dir --no-compile \
		paramiko \
	&& find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf \
	&& find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf


# --------------------------------------------------------------------------------------------------
# Final Image
# --------------------------------------------------------------------------------------------------
FROM alpine:3.9 as production
ARG VERSION
# https://github.com/opencontainers/image-spec/blob/master/annotations.md
#LABEL "org.opencontainers.image.created"=""
#LABEL "org.opencontainers.image.version"=""
#LABEL "org.opencontainers.image.revision"=""
LABEL "maintainer"="cytopia <cytopia@everythingcli.org>"
LABEL "org.opencontainers.image.authors"="cytopia <cytopia@everythingcli.org>"
LABEL "org.opencontainers.image.vendor"="cytopia"
LABEL "org.opencontainers.image.licenses"="MIT"
LABEL "org.opencontainers.image.url"="https://github.com/cytopia/docker-ansible"
LABEL "org.opencontainers.image.documentation"="https://github.com/cytopia/docker-ansible"
LABEL "org.opencontainers.image.source"="https://github.com/cytopia/docker-ansible"
LABEL "org.opencontainers.image.ref.name"="Ansible ${VERSION} base"
LABEL "org.opencontainers.image.title"="Ansible ${VERSION} base"
LABEL "org.opencontainers.image.description"="Ansible ${VERSION} base"

RUN set -eux \
	&& apk add --no-cache \
		python3 \
	&& ln -sf /usr/bin/python3 /usr/bin/python \
	&& ln -sf ansible /usr/bin/ansible-config \
	&& ln -sf ansible /usr/bin/ansible-console \
	&& ln -sf ansible /usr/bin/ansible-doc \
	&& ln -sf ansible /usr/bin/ansible-galaxy \
	&& ln -sf ansible /usr/bin/ansible-inventory \
	&& ln -sf ansible /usr/bin/ansible-playbook \
	&& ln -sf ansible /usr/bin/ansible-pull \
	&& ln -sf ansible /usr/bin/ansible-test \
	&& ln -sf ansible /usr/bin/ansible-vault \
	&& find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf \
	&& find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf

COPY --from=builder /usr/lib/python3.6/site-packages/ /usr/lib/python3.6/site-packages/
COPY --from=builder /usr/bin/ansible /usr/bin/ansible
COPY --from=builder /usr/bin/ansible-connection /usr/bin/ansible-connection

WORKDIR /data
CMD ["/bin/sh"]
