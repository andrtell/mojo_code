#!/usr/bin/env bash
GIT_ROOT=$(git rev-parse --show-toplevel)

find "$GIT_ROOT" \
    -type f \
    -name '*.mojo' \
    -exec mojo format {} \;
