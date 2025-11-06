# nilenso.com

source code to the website

## dependencies

```bash
brew install zola
npm install
```

## build

#### Serve website locally

```bash
make serve
# in another terminal, for live Tailwind recompilation
npm run watch:css
```

#### Download the raw website

```bash
make download
```

## performance checks

Run the automated performance baseline (Lighthouse + asset size summary) against production or any preview URL:

```bash
bin/perf-metrics.sh https://nilenso.com
```

Reports are written under `reports/perf/<timestamp>/` and include Lighthouse JSON/HTML plus an `asset-sizes.txt` summary from the latest `zola build`. Override defaults with environment variables:

- `LH_PRESET` (`desktop` | `mobile`)
- `ONLY_CATEGORIES` (comma-separated Lighthouse categories)
