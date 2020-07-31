#!/bin/bash

set -ex

if [[ $(uname) = "Darwin" ]]; then
    export CGO_ENABLED=1
fi

DATE=$(date +"%Y-%m-%d")
go install -tags=osusergo -mod=vendor -ldflags="-s -w -X main.version=$PKG_VERSION -X main.date=$DATE" ./cmd/tilt

bash $RECIPE_DIR/build_library_licenses.sh
