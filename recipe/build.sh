#!/bin/bash

if [[ $(uname) = "Darwin" ]]; then
    export CGO_ENABLED=1
fi
go install -mod vendor -ldflags "-X 'github.com/tilt-dev/tilt/internal/cli.commitSHA=1f21e296d6a1029223d273bcf43dc6b0bf71c0e8'" ./cmd/tilt/...

bash $RECIPE_DIR/build_library_licenses.sh
