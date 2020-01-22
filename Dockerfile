FROM alpine:3.11
MAINTAINER winter0mute <winter0mute@noreply.net>

COPY run.sh /run.sh

WORKDIR /srv

ENTRYPOINT ["/run.sh"]
CMD ["--help"]

