# Visuals

Use this folder for approved descriptive charts and, later, charts addressing the selected business problem. Excel, Looker, or Tableau may be used for visuals.

For each chart, record:
- Purpose: descriptive context or the future selected problem
- Chart file or workbook link
- Measure, units, and calculation
- Date range, population, and comparison groups
- Source query or workbook
- What the chart shows and its limits

The primary CP1 comparison chart and supplementary monthly trend are saved in this folder and embedded in [findings.md](../findings.md). Riley verified their values against Queries 14 and 16; see [audit entry #10](../Other/audit_log.md#verified-a-claim). File changes and publishing require their respective explicit approvals.

## CP1 chart specifications and status

The primary chart is a two-bar period comparison; the supplementary chart is a 12-month line trend. Both PNGs are stored in this folder and embedded under `## Chart` in [findings.md](../findings.md). Keep raw `.csv`, `.xlsx`, and Tableau data/extract files out of the repo.

### Supplementary chart: 12-month trend vs. benchmark
- **Source query:** [sql/14_monthly_over_24h_by_usertype.sql](../sql/14_monthly_over_24h_by_usertype.sql), filtered to `trip_month` from `2017-06` through `2018-05` (24 rows: 12 months × 2 `usertype` groups; `16,951,030` valid trips).
- **Chart type:** Two-series line chart (with markers) or grouped vertical column chart.
- **Axes & series:**
  - **X-axis:** `trip_month` (`Jun 2017`–`May 2018`, chronological order).
  - **Y-axis:** `lockups_per_10k_trips` — labeled **Trips Over 24 Hours per 10,000 Valid Trips** (start axis at `0`).
  - **Series:** `Customer` (gap group) vs. `Subscriber` (same-period benchmark).
- **Period comparison shown in the primary chart:** [Query 16](../sql/16_period_gap_summary.sql) reports Customer at `15.98` and Subscriber at `1.05` trips over 24 hours per 10,000 valid trips, a `+14.93` gap (`15.2×`) and `20,736.7` excess bike-days for the period.
- **Suggested title & subtitle:**
  - *Title:* `Monthly Customer vs. Subscriber Over-24-Hour Trip Rate`
  - *Subtitle:* `Trips over 24 hours per 10,000 valid trips · June 2017–May 2018`

### Primary chart: 2-bar period benchmark comparison
- **Source query:** [sql/16_period_gap_summary.sql](../sql/16_period_gap_summary.sql) (2 rows: June 2017–May 2018 period totals).
- **Values to plot:** `Customer = 15.98` (`n = 1,804,498` trips; `21,733.4` >24h bike-days) vs. `Subscriber (Benchmark) = 1.05` (`n = 15,146,532` trips; `8,366.3` >24h bike-days).
- **Chart type & labels:** Vertical or horizontal 2-bar chart starting at `0`, with direct data labels on each bar and an annotation showing the `+14.93` per 10,000 (`15.2×`) gap and `20,736.7` excess bike-days (`~$55.6K–$335.2K/yr` ride-fee ceiling).

### Created chart files

- **Primary:** [cp1_over_24h_gap_vs_benchmark.png](cp1_over_24h_gap_vs_benchmark.png) — period-level rate comparison with the gap, excess bike-days, and value-ceiling callout. Source: Query 16 and the May 2018 Citi Bike Monthly Operating Report.
- **Supplementary:** [cp1_monthly_over_24h_rates.png](cp1_monthly_over_24h_rates.png) — monthly Customer and Subscriber rates from June 2017 through May 2018. Source: Query 14.
- Both figures are embedded in [findings.md](../findings.md). Riley verified the displayed rates against Queries 14 and 16; see [audit entry #10](../Other/audit_log.md#verified-a-claim).
