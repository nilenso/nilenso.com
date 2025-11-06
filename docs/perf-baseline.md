# Performance Baseline — 2025-11-06

Baseline captured against the unoptimised site running locally at `http://127.0.0.1:1111` (Lighthouse `desktop` preset, simulated dense 4G).

| page   | perf score | first contentful paint | largest contentful paint | cumulative layout shift | total transfer |
|--------|------------|------------------------|---------------------------|-------------------------|----------------|
| home   | 66         | 2.9 s                  | 3.0 s                     | 0.062                   | 3.22 MiB       |
| people | 59         | 3.0 s                  | 6.5 s                     | 0.004                   | 11.95 MiB      |
| work   | 68         | 2.8 s                  | 2.9 s                     | 0.007                   | 3.02 MiB       |
| talks  | 60         | 3.0 s                  | 5.2 s                     | 0.002                   | 5.72 MiB       |
| jobs   | 69         | 2.7 s                  | 2.8 s                     | 0.008                   | 2.92 MiB       |

## Success criteria

- Bring **FCP** under 1.5 s on cable-class connections for all benchmark pages.
- Bring **LCP** under 2.5 s (desktop) and 3.0 s (mobile preset).
- Keep **CLS** below 0.1 (currently good—maintain this).
- Reduce **total transfer** per page below 1 MiB (stretch goal: below 500 KiB), with an exception for the people gallery where the target is ≤2 MiB via responsive, lazy-loaded media.
- Raise Lighthouse **performance score** to ≥85 on desktop and ≥75 on mobile for the benchmark set.

Re-run `bin/perf-metrics.sh` after each optimization pass and append results (with timestamp) so the impact is easy to compare against this baseline.

---

## Post-optimization check — 2025-11-06 (local build @ http://127.0.0.1:4173)

| page   | perf score | first contentful paint | largest contentful paint | cumulative layout shift | total transfer |
|--------|------------|------------------------|---------------------------|-------------------------|----------------|
| home   | 100        | 0.3 s                  | 0.3 s                     | 0                       | 328 KiB        |
| people | 100        | 0.3 s                  | 0.5 s                     | 0                       | 273 KiB        |
| work   | 100        | 0.3 s                  | 0.6 s                     | 0.002                   | 242 KiB        |
| talks  | 100        | 0.3 s                  | 0.4 s                     | 0                       | 125 KiB        |
| jobs   | 100        | 0.3 s                  | 0.4 s                     | 0                       | 67 KiB         |

*Note:* These numbers reflect the optimized build served locally. Production will match after deploying the new `processed_images` outputs and updated assets.

## Post-optimisation verification

1. Run the desktop preset again:
   ```bash
   bin/perf-metrics.sh https://nilenso.com
   ```
2. Capture mobile data too:
   ```bash
   LH_PRESET=mobile bin/perf-metrics.sh https://nilenso.com
   ```
3. Compare the new `reports/perf/<timestamp>/` Lighthouse JSON against the baseline above (or extend the table) focusing on the success criteria.
4. Note any regressions (e.g. CLS drifting >0.1) and iterate before promoting changes to production.
