#!/bin/bash

set -x

if [[ -z "$TRAVIS_TAG" ]]; then
  echo "Skip archiving"
  exit 0
fi

filepath="dist/$(basename ${TRAVIS_BUILD_DIR})-${TRAVIS_TAG}.tar.gz"

carthage build --configuration Release --no-skip-current
mkdir -p dist
tar zcf ${filepath} Carthage
