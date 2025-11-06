#!/usr/bin/env bash

set -euo pipefail

# Ensure Tailwind output is fresh before running Zola.
npx tailwindcss -i ./styles/tailwind.css -o ./static/tailwind.min.css --minify

# Pass through any arguments (e.g. --base-url overrides).
zola build "$@"
