#!/bin/bash

curl -s "$VALHEIM_URL" | jq '.player_count'
