#!/usr/bin/env bash
git diff \
    --diff-filter=ACMR \
    --name-only '*.mojo' \
    | tr '\n' '\0' \
    | xargs -r -0 pixi run mojo format -q
