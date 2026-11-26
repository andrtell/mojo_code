#!/usr/bin/env bash
GIT_ROOT=$(git rev-parse --show-toplevel)

args=()
for match in "$@"; do
  [[ -n $match ]] && args+=( -path "*$match*" )
done

find "$GIT_ROOT/tests" \
    -type f \
    -name 'test_*.mojo' \
    "${args[@]}" \
    -exec pixi run mojo -D ASSERT=all -I $GIT_ROOT {} \;
