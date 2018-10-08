FROM alpine:3.8
MAINTAINER winter0mute <winter0mute@noreply.net>

RUN apk add --no-cache ca-certificates ffmpeg openssl python3 \
    && pip3 install 'youtube-dl==2018.10.05'

WORKDIR /srv

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]

