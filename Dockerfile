FROM debian:stable-slim

RUN apt-get update \
  && apt-get -y install cron curl jq

COPY ./scripts /valheim-announce
RUN find /valheim-announce -type f -exec chmod 0744 {} \;

COPY valheim-announce /etc/cron.d/valheim-announce
RUN chmod 0644 /etc/cron.d/valheim-announce

ENTRYPOINT [ "/valheim-announce/entrypoint.sh" ]