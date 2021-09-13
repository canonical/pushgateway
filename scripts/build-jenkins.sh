#!/bin/sh
#
# build-jenkins.sh builds an ubuntu image
#

set -e

DOCKER_REGISTRY=${DOCKER_REGISTRY:-stg-commercial-systems.docker-registry.canonical.com}

DOCKER=${DOCKER:-docker}

VERSION=`git rev-parse --verify HEAD`

$DOCKER build \
	--build-arg http_proxy \
	--build-arg https_proxy \
	--build-arg no_proxy \
	--build-arg NO_PROXY \
	-t ${DOCKER_REGISTRY}/pushgateway-ubuntu:$VERSION \
  -t ${DOCKER_REGISTRY}/pushgateway-ubuntu:latest -f Dockerfile.ubuntu .

$DOCKER push --all-tags ${DOCKER_REGISTRY}/pushgateway-ubuntu
