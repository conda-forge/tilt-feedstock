#!/bin/bash

if [[ $(uname) = "Darwin" ]]; then
    export CGO_ENABLED=1
fi

VERSION=0.16.1
COMMIT=1f21e296d6a1029223d273bcf43dc6b0bf71c0e8
go install -tags=osusergo -mod=vendor -ldflags="-s -w -X main.version=$VERSION -X main.commit=$COMMIT" ./cmd/tilt

bash $RECIPE_DIR/build_library_licenses.sh
