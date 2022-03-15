#!/bin/bash

set -ex

export CGO_ENABLED=1
DATE=$(date +"%Y-%m-%d")
go build -tags=osusergo -mod=vendor -ldflags="-s -w -X main.version=$PKG_VERSION -X main.date=$DATE" -o="$OUTPUT_PATH" ./cmd/tilt

bash $RECIPE_DIR/build_library_licenses.sh
