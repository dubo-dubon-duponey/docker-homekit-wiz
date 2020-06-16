# What

Docker image to control your Wiz bulbs through HomeKit.

This is based on [WizHard](https://github.com/dubo-dubon-duponey/wizhart).

## Image features

 * multi-architecture:
    * [x] linux/amd64
    * [x] linux/arm64
    * [x] linux/arm/v7
    * [ ] linux/arm/v6 (should build, disabled by default)
 * hardened:
    * [x] image runs read-only
    * [x] image runs with no capabilities
    * [x] process runs as a non-root user, disabled login, no shell
 * lightweight
    * [x] based on our slim [Debian buster version](https://github.com/dubo-dubon-duponey/docker-debian)
    * [x] simple entrypoint script
    * [x] multi-stage build with no installed dependencies for the runtime image
 * observable
    * [x] healthcheck
    * [x] log to stdout
    * [ ] ~~prometheus endpoint~~ not applicable

## Run

```bash
docker run -d --rm \
    --name "speaker" \
    --env HOMEKIT_NAME="My Fancy" \
    --env HOMEKIT_PIN="87654312" \
    --volume /data \
    --net host \
    --cap-drop ALL \
    --read-only \
    dubodubonduponey/homekit-wiz
```

## Notes

### Networking

You need to run this in `host` or `mac(or ip)vlan` networking (because of mDNS).

### Additional arguments

Any additional arguments when running the image will get fed to the `wizhard` binary.

Try `--help` for more.

### Custom configuration

All configuration is done through environment variables, specifically:

```dockerfile
ENV           HOMEKIT_NAME="Wiz Bing"
ENV           HOMEKIT_PIN="87654312"
ENV           HOMEKIT_MANUFACTURER="DuboDubonDuponey"
ENV           HOMEKIT_SERIAL=""
ENV           HOMEKIT_MODEL="Acme"
ENV           HOMEKIT_VERSION="0"
```

## Moar?

See [DEVELOP.md](DEVELOP.md)
