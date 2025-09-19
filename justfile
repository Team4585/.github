#!/usr/bin/env -S just --justfile

set windows-shell := ["powershell.exe",  "-NoLogo", "-Command"]

log := "warn"
export JUST_LOG := log

# run github/super-linter locally
lint:
  docker run --rm \
    -e RUN_LOCAL=true \
    -e FIX_MARKDOWN_PRETTIER=true \
    --env-file ".github/super-linter.env" \
    -v {{justfile_directory()}}:/tmp/lint \
    ghcr.io/super-linter/super-linter:v8.1.0
