#!/bin/bash

if [[ -z "$TRAVIS_TAG" ]]; then
  echo "Skip archiving"
  exit 0
fi

filepath="dist/$(basename ${TRAVIS_BUILD_DIR})-${TRAVIS_TAG}.tar.gz"

carthage build --configuration Release -no-skip-currernt
mkdir -p dist
tar zcf ${filepath} Carthage
