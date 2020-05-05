FROM alpine:latest
MAINTAINER winter0mute <winter0mute@noreply.net>

RUN apk add --no-cache ca-certificates ffmpeg openssl python3 && \
    pip3 install --upgrade pip wheel youtube-dl

RUN touch /firstrun_placeholder

COPY run.sh /run.sh

WORKDIR /srv

ENTRYPOINT ["/run.sh"]
CMD ["--help"]

