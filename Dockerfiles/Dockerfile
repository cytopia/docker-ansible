# --------------------------------------------------------------------------------------------------
# Builder Image
# --------------------------------------------------------------------------------------------------
# See ./builder for this image
FROM cytopia/ansible-builder as builder

ARG VERSION
RUN set -eux \
	&& if [ "${VERSION}" = "latest" ]; then \
		pip3 install --no-cache-dir --no-compile ansible; \
	elif [ "${VERSION}" = "2.9" ]; then \
		pip3 install --no-cache-dir --no-binary pyyaml "ansible>=${VERSION},<2.10"; \
	elif [ "${VERSION}" = "2.10" ]; then \
		pip3 install --no-cache-dir --no-binary pyyaml "ansible>=${VERSION},<2.11"; \
	elif [ "${VERSION}" = "2.11" ]; then \
		pip3 install --no-cache-dir --no-binary pyyaml "ansible-core>=${VERSION},<2.12"; \
	else \
		pip3 install --no-cache-dir --no-binary pyyaml "ansible>=${VERSION},<$(echo "${VERSION}+0.1" | bc)"; \
	fi \
	\
	&& if [ "${VERSION}" != "latest" ]; then \
		ansible --version | grep ^ansible | grep -E "${VERSION}\.[0-9]+" \
		&& ansible-playbook --version | grep ^ansible | grep -E "${VERSION}\.[0-9]+" \
		&& ansible-galaxy --version | grep ^ansible | grep -E "${VERSION}\.[0-9]+"; \
	fi \
	\
	&& find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf \
	&& find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf

# Python packages (copied to final image)
RUN set -eux \
	&& apk add --no-cache  \
	&& pip3 install --no-cache-dir --no-compile \
		junit-xml \
		lxml \
		paramiko \
	&& find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf \
	&& find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf

# Clean-up some site-packages to safe space
RUN set -eux \
	&& pip3 uninstall --yes \
		setuptools \
		wheel


# --------------------------------------------------------------------------------------------------
# Final Image
# --------------------------------------------------------------------------------------------------
FROM alpine:3.15 as production
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
# Issue: #85 libgcc required for ansible-vault
		libgcc \
		py3-pip \
		python3 \
# Issue: #76 yaml required for 'libyaml = True' (faster startup time)
		yaml \
	&& find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf \
	&& find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf

COPY --from=builder /usr/lib/python3.9/site-packages/ /usr/lib/python3.9/site-packages/
COPY --from=builder /usr/bin/ansible* /usr/bin/

# Pre-compile Python for better performance
RUN set -eux \
	&& python3 -m compileall /usr/lib/python3.9

WORKDIR /data
CMD ["/bin/sh"]
