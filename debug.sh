#!/bin/bash

set -eu

./scripts/run_docker_net.sh 172.19.0.3 ./scripts/remote_debug.sh $(make print-DOCKER_IMAGE_VER)
