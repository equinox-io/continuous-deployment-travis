#!/bin/bash
set -eu -o pipefail

env | sort | uniq | grep "ldflags"

# Download and unpack the most recent Equinox release tool
wget https://bin.equinox.io/c/mBWdkfai63v/release-tool-stable-linux-amd64.tgz
tar -vxf release-tool-stable-linux-amd64.tgz

./equinox release \
        --version="$TRAVIS_COMMIT" \
        --app="app_4xCaMumNoeF" \
        --platforms="darwin_amd64 linux_amd64 windows_amd64" \
        --signing-key="equinox.key" \
        --token="$EQUINOX_API_TOKEN" \
        -- -ldflags "-X main.version $TRAVIS_COMMIT"
