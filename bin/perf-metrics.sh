#!/usr/bin/env bash

set -euo pipefail

if ! command -v zola >/dev/null 2>&1; then
  echo "zola not found on PATH; install it before running perf measurements." >&2
  exit 1
fi

if ! command -v npx >/dev/null 2>&1; then
  echo "npm/npx not found on PATH; install Node.js before running perf measurements." >&2
  exit 1
fi

SITE_URL=${1:-"https://nilenso.com"}
LH_PRESET=${LH_PRESET:-"desktop"}
ONLY_CATEGORIES=${ONLY_CATEGORIES:-"performance"}
PAGES=(
  "/"
  "/people/"
  "/work/"
  "/talks/"
  "/jobs/"
)

timestamp() {
  date -u +"%Y%m%dT%H%M%SZ"
}

slugify() {
  local input="${1#/}"
  input="${input%/}"
  if [ -z "${input}" ]; then
    echo "home"
    return
  fi
  echo "${input}" | tr '[:upper:]' '[:lower:]' | tr -c '[:alnum:]' '-' | sed -E 's/-+/-/g; s/^-//; s/-$//'
}

REPORT_DIR="reports/perf/$(timestamp)"
mkdir -p "${REPORT_DIR}"

echo "Writing reports to ${REPORT_DIR}"

echo "Preparing static assets (Tailwind + Zola)…"
npx tailwindcss -i ./styles/tailwind.css -o ./static/tailwind.min.css --minify >/dev/null
zola build >/dev/null

(
  cd public
  {
    echo "# Asset size summary ($(timestamp))"
    echo
    du -sh . tailwind.min.css style.css images | sort -hr
    echo
    echo "## Largest images (top 15)"
    find images -type f -print0 |
      xargs -0 ls -l |
      sort -k5 -nr |
      head -n 15 |
      awk '{printf "%s\t%s\t%s\n",$5,$6" "$7" "$8,$9}'
  } > "../${REPORT_DIR}/asset-sizes.txt"
)

echo "Running Lighthouse against ${SITE_URL}"

for page in "${PAGES[@]}"; do
  url="${SITE_URL%/}${page}"
  slug=$(slugify "${page}")
  echo "  • ${url}"
  npx --yes lighthouse "${url}" \
    --only-categories="${ONLY_CATEGORIES}" \
    --preset="${LH_PRESET}" \
    --output="json" \
    --output="html" \
    --output-path="${REPORT_DIR}/lighthouse-${slug}" \
    >/dev/null
done

echo "Perf reports generated in ${REPORT_DIR}"
