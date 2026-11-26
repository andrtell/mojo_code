#!/usr/bin/env bash

# Tracked
git diff \
    --diff-filter=ACMR \
    -z \
    --name-only \
    '*.mojo' \
    | xargs -r -0 pixi run mojo format -q

# Untracked
git ls-files \
    -z \
    --others \
    --exclude-standard \
    -- '*.mojo' \
    | xargs -r -0 pixi run mojo format -q
