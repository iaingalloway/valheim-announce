FROM debian:stable-slim

RUN apt-get update \
  && apt-get -y install cron curl jq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /valheim-announce

COPY ./scripts .
RUN find . -type f -exec chmod 0774 {} \;

COPY cron .
RUN touch /var/run/crond.pid \
  && touch /valheim-announce/environment \
  && echo 0 > /valheim-announce/player-count-cache \
  && chmod 6775 /usr/sbin/cron \
  && chmod 0664 cron environment player-count-cache

RUN useradd -u 22 -g 0 valheim-announce
USER valheim-announce

ENTRYPOINT [ "entrypoint.sh" ]