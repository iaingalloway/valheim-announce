#!/bin/bash

source /valheim-announce/environment

next=$(cat)

prev=$(< /valheim-announce/player-count-cache)

if [ "$prev" -eq "$next" ]; then
    exit 0
elif [ "$prev" -gt "$next" ]; then
    echo "A player just left the server. Current players: $next."
elif [ "$prev" -lt "$next" ]; then
    echo "A player just joined the server. Current players: $next."
fi

echo "$next" > /valheim-announce/player-count-cache
