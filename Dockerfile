FROM alpine:3.8
MAINTAINER winter0mute <winter0mute@noreply.net>

RUN apk add --no-cache ca-certificates ffmpeg openssl python3 \
    && pip3 install 'youtube-dl==2018.09.10'
    #&& echo 'will cite' | parallel --citation

WORKDIR /srv

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]

