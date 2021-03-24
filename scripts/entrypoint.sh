#!/bin/bash

echo "Preparing environment"
printenv | grep -v "no_proxy" >> /valheim-announce/environment
cat /valheim-announce/environment

echo "Adding crontab"
crontab /valheim-announce/cron
cat /valheim-announce/cron
echo

echo "Running cron"
cron -f
