# Valheim announce

A cron job in a docker container that monitors a Valheim server and spams discord when someone joins or leaves.

Valheim doesn't expose a hook for players joining or leaving, and the per-player data in the server status hasn't been implemented yet. These scripts poll for player count and broadcast messages when it changes.

Usage:

```
git clone https://github.com/iaingalloway/valheim-announce.git

docker build -t iaingalloway/valheim-announce valheim-announce

docker run -d \
    --name valheim-announce \
    --rm \
    -e VALHEIM_URL="{URL to your server's status.json}" \
    -e DISCORD_WEBHOOK="{URL for the webhook}" \
    -e DISCORD_USER="{Username for the webhook}" \
    iaingalloway/valheim-announce
```

If you're running the Valheim server in a container, and running valheim-announce on the same host, you'll need to connect the two containers to the same `--network` so that status.json is accessible.

I used https://github.com/lloesche/valheim-server-docker for the server.
