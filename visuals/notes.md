# Visuals

Use this folder for approved descriptive charts and, later, charts addressing the selected business problem. Excel, Looker, or Tableau may be used for visuals.

For each chart, record:
- Purpose: descriptive context or the future selected problem
- Chart file or workbook link
- Measure, units, and calculation
- Date range, population, and comparison groups
- Source query or workbook
- What the chart shows and its limits

The final CP1 findings must display a chart of the selected gap and benchmark. No verified project charts have been added yet. File changes and publishing require their respective explicit approvals.

## CP1 chart specification (pending creation)

Use Excel, Google Sheets, Looker Studio, or Tableau (do **not** use Python; do **not** commit `.csv`, `.xlsx`, or Tableau data/extract files to the repo). Save the finished chart image as `visuals/cp1_over_24h_gap_vs_benchmark.png` and embed it under `## Chart` in [findings.md](../findings.md).

### Option 1 (Recommended): 12-month trend vs. benchmark
- **Source query:** [sql/14_monthly_over_24h_by_usertype.sql](../sql/14_monthly_over_24h_by_usertype.sql), filtered to `trip_month` from `2017-06` through `2018-05` (24 rows: 12 months × 2 `usertype` groups; `16,951,030` valid trips).
- **Chart type:** Two-series line chart (with markers) or grouped vertical column chart.
- **Axes & series:**
  - **X-axis:** `trip_month` (`Jun 2017`–`May 2018`, chronological order).
  - **Y-axis:** `lockups_per_10k_trips` — labeled **Trips Over 24 Hours per 10,000 Valid Trips** (start axis at `0`).
  - **Series:** `Customer` (gap group) vs. `Subscriber` (same-period benchmark).
- **Reference lines / callouts:** Add dashed period-average lines or text callouts from [sql/16_period_gap_summary.sql](../sql/16_period_gap_summary.sql): **Customer period rate = `15.98`** (`2,883` / `1,804,498` trips) vs. **Subscriber benchmark = `1.05`** (`1,591` / `15,146,532` trips) — a **`+14.93` per 10,000 (`15.2×`) gap** tying up **`20,736.7` excess bike-days/year**.
- **Suggested title & subtitle:**
  - *Title:* `Casual Customers Keep Bikes Out >24 Hours at 15.2× the Subscriber Rate`
  - *Subtitle:* `Trips over 24 hours per 10,000 valid trips, June 2017–May 2018 (n = 16,951,030 trips; Citi Bike NYC)`

### Option 2 (Fast alternative): 2-bar period benchmark comparison
- **Source query:** [sql/16_period_gap_summary.sql](../sql/16_period_gap_summary.sql) (2 rows: June 2017–May 2018 period totals).
- **Values to plot:** `Customer = 15.98` (`n = 1,804,498` trips; `21,733.4` >24h bike-days) vs. `Subscriber (Benchmark) = 1.05` (`n = 15,146,532` trips; `8,366.3` >24h bike-days).
- **Chart type & labels:** Vertical or horizontal 2-bar chart starting at `0`, with direct data labels on each bar and an annotation showing the `+14.93` per 10,000 (`15.2×`) gap and `20,736.7` excess bike-days (`~$55.6K–$335.2K/yr` ride-fee ceiling).

### After creating the chart
1. Save the exported PNG to `visuals/cp1_over_24h_gap_vs_benchmark.png` (keep raw `.csv`/`.xlsx` files outside the repo).
2. Record the final chart metadata (and any Tableau, Looker Studio, or Google Sheets link) in this file.
3. Embed `![Customer vs. Subscriber >24h rate, June 2017–May 2018](visuals/cp1_over_24h_gap_vs_benchmark.png)` under `## Chart` in [findings.md](../findings.md) and log a human check verifying chart values against Query 14/16 in [Other/audit_log.md](../Other/audit_log.md).
