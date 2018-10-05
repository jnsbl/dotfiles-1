#!/usr/bin/env fish
# unset env vars used by Docker Toolbox in order to use Docker for Mac
set -gxe DOCKER_TLS_VERIFY
set -gxe DOCKER_CERT_PATH
set -gxe DOCKER_MACHINE_NAME
set -gxe DOCKER_HOST
