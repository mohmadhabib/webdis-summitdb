FROM alpine:latest

ENV WEBDIS_REPO=https://github.com/nicolasff/webdis.git

RUN apk add --no-cache curl tar zip unzip gzip && \
	# Install eGet to Ease All Binaries Installations/Update
	curl -s https://zyedidia.github.io/eget.sh | sh && mv eget /usr/local/bin/eget && \
    mkdir -p /data && \
	# Install/Build Webdis
	apk add alpine-sdk libevent libevent-dev bsd-compat-headers git && \
	git clone --depth 1 $WEBDIS_REPO /tmp/webdis && \
    cd /tmp/webdis && make clean all && \
    cp webdis /usr/local/bin/        && \
    cp webdis.json /etc/             && \
    mkdir -p /usr/share/doc/webdis   && \
    cp README.md /usr/share/doc/webdis/README && \
    cd /tmp && rm -rf /tmp/webdis    && \
    apk del --purge alpine-sdk libevent-dev bsd-compat-headers git curl tar zip unzip gzip && \
    rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /entrypoint.sh

WORKDIR /data

VOLUME [ "/data" ]

RUN chmod +x /entrypoint.sh

EXPOSE 7379
ENTRYPOINT ["/entrypoint.sh"]
