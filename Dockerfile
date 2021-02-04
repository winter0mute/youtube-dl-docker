FROM python:alpine
MAINTAINER winter0mute <winter0mute@noreply.net>

RUN echo "Version of Alpine Linux: $(cat /etc/alpine-release)" && \
    pip install --upgrade pip && \
    pip install youtube_dl && \
    apk add ffmpeg

RUN touch /firstrun_placeholder

RUN mkdir -p -m777 /cache/youtube-dl

COPY run.sh /run.sh

COPY youtube-dl.conf /etc/youtube-dl.conf

WORKDIR /srv

ENTRYPOINT ["/run.sh"]
CMD ["--help"]

