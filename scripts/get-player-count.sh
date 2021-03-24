#!/bin/bash

source /valheim-announce/environment

curl -s "$VALHEIM_URL" | jq '.player_count'
