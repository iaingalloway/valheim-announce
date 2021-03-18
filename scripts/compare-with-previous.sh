#!/bin/bash

next=$(cat)

if [ ! -f /valheim-announce/player_count_cache ]; then echo 0 > /valheim-announce/player_count_cache; fi
prev=$(< /valheim-announce/player_count_cache)

if [ "$prev" -eq "$next" ]; then
    exit 0
elif [ "$prev" -gt "$next" ]; then
    echo "A player just left the server. Current players: $next."
elif [ "$prev" -lt "$next" ]; then
    echo "A player just joined the server. Current players: $next."
fi

echo "$next" > /valheim-announce/player_count_cache
