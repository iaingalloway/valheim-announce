#!/bin/bash
 
message=$(cat)

if [ -z "$message" ]; then
  exit 0
fi

curl -sfSL -X POST -H "Content-Type: application/json" -d "{\"username\":\"$DISCORD_USERNAME\",\"content\":\"$message\"}" "$DISCORD_WEBHOOK"
