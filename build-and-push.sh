#!/bin/bash
[ "$1" = -x ] && shift && set -x
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

set -e

if [[ -z "$1" || -z "$2" ]]; then
  echo -e "Usage $0 <major version number> <minor version number>\n"
  exit 1
fi

PARENT_VERSION_MAJOR=$1
PARENT_VERSION_MINOR=$2

TAG_NAMES="\
3.${PARENT_VERSION_MAJOR}.${PARENT_VERSION_MINOR}-openjdk-11,\
3.${PARENT_VERSION_MAJOR}-openjdk-11,\
3-openjdk-11,\
3.${PARENT_VERSION_MAJOR}.${PARENT_VERSION_MINOR}-jdk-11,\
3.${PARENT_VERSION_MAJOR}-jdk-11,\
3-jdk-11,\
latest"

TAG_NAME=
for i in ${TAG_NAMES//,/ }; do
  TAG_NAME=$i
  break
done

echo -e "\nBuilding with local first tag: ${TAG_NAME}\n"

LOCAL_NAME="maven-3-openjdk-11-docker-client:${TAG_NAME}"

docker build -t "${LOCAL_NAME}" .

for i in ${TAG_NAMES//,/ }; do
  echo -e "\nPushing for remote tag: ${i}"

  REMOTE_NAME="idachev/maven-3-openjdk-11-docker-client:${i}"

  docker tag "${LOCAL_NAME}" "${REMOTE_NAME}"

  docker push "${REMOTE_NAME}"
done

echo -e "\nDone!"
