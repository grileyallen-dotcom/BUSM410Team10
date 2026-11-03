# SQL Notes

Save date: November 3, 2026. AI-assisted. These statuses describe the chat record, not an independent BigQuery job-history check.

| Query | Source | Purpose | Status / evidence |
|---|---|---|---|
| [Baseline KPI queries](kpi_baseline_queries.sql) | Trips; stations for queries 9/10 | Ten measured KPI templates | Reconstructed from the SQL shown in chat; user supplied corresponding outputs. Actual submitted edits and exact job SQL are not exported. Select and run one statement at a time. |
| [Monthly rider mix](rider_mix_by_month.sql) | Trips: starttime, usertype | Identify time/segment coverage and undated records | Result supplied: `job_IcHj9QNgVvyVgn_CQqHpGnGwWmQ8.csv` |
| [Duration segment drill-down](trip_duration_drilldown.sql) | Trips: starttime, usertype, tripduration | April/May 2017 versus 2018, rider type and duration tail | Result supplied: `job_JHiXo775pTyb2rWQfqp4lVuiHSph.csv` |
| [Customer duration bands](customer_duration_bands.sql) | Same three trip columns | Isolate the portion of Customer duration driving the mean | Result supplied: `job_S3YWkIGz-PfzZLKnTnlJ2wv-EfDA.csv` |
| [Draft timestamp check](drafts/extreme_duration_timestamp_check.sql) | Trips: starttime, stoptime, usertype, tripduration | Validate recorded durations against timestamps | Prepared; no execution result or team acceptance recorded |

## Definitions and filters

- Tripduration is seconds; starttime/stoptime are NYC-local DATETIME per the shown schema.
- Daily utilization proxy = daily trips / distinct bike IDs ridden that day. Monthly benchmark = arithmetic average of those daily rates, recomputed from counts.
- Duration queries filter to positive values for duration metrics; the segment query separately reports missing/nonpositive rows.
- Months are based on trip start time, including long trips ending after that month.
- Excluding Customer rides over 24 hours is a sensitivity analysis, not a cleaning decision.
- Avoid assigning undated rows to a year. Keep their missingness separate from dated segment shares.
- Station query outputs do not prove historical empty/full time rates. Confirm table lineage and report freshness.

## Cost

The user reported preview estimates of 1.98 GB and 2.91 GB for earlier queries. Actual bytes billed/processed for the saved outputs are not recorded. No new BigQuery query was executed for this repository save. Select needed columns; LIMIT does not normally reduce scanned bytes. Date predicates reduce bytes only when partitioning/clustering supports pruning; verify the editor estimate first.

## Decision

Prioritize extreme Customer durations and validate timestamps before attributing a business cause. The final KPI/problem remains a team decision. Original exports and their mapping are in [the evidence index](../evidence/README.md).
