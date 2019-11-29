FROM alpine:3.10
MAINTAINER winter0mute <winter0mute@noreply.net>

RUN apk add --no-cache ca-certificates ffmpeg openssl python3 \
    && pip3 install 'youtube-dl==2019.11.28'

COPY run.sh /run.sh

WORKDIR /srv

ENTRYPOINT ["/run.sh"]
CMD ["--help"]

