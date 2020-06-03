FROM python:alpine
MAINTAINER winter0mute <winter0mute@noreply.net>

RUN pip install --upgrade pip && \
    pip install youtube_dl && \
    apk add ffmpeg

RUN touch /firstrun_placeholder

COPY run.sh /run.sh

WORKDIR /srv

ENTRYPOINT ["/run.sh"]
CMD ["--help"]

