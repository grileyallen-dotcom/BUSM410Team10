# SQL query guide

This file explains how the project queries the data, reviews cleaning choices, and traces reported numbers to their queries and results.

## Current status

Consult [progress](../progress.md) for the current stage and [decisions](../decisions.md) for project-lead direction. The agent acts as consultant to Riley Allen. A setup discussion does not authorize starting analysis; an older stage record does not block a new explicit request for SQL work.

Sixteen numbered queries (01–12 exploratory; 13–16 for the selected Customer >24h lockup gap) were run in BigQuery by project lead Riley Allen, with results supplied on 2026-11-05 and saved with approval below. See [decisions.md](../decisions.md) for the approved problem, KPI, benchmark, cleaning rules (C1–C2), and valuation rule (V1).

See [dataset documentation](../Other/metadata.pdf), the [table diagram](../Other/ERD.pdf), and [documentation notes](../Other/dataset_documentation.md) for the supplied schema information and its limits.

## Existing query register

| File | Purpose and scope | Approval and execution status | Agent scan and cost estimate (not BigQuery's) | Result |
|---|---|---|---|---|
| [01_monthly_trips_and_missing_starts.sql](01_monthly_trips_and_missing_starts.sql) | Monthly trip volume and missing starttime check across 2013–2018 | Run by Riley; results supplied 2026-11-05; saved with approval | ~471.5 MB (< $0.01) | Monthly counts sum to 53,108,721; 5,828,994 rows have no starttime; no data Oct 2016–Mar 2017 |
| [02_blank_rows_field_check.sql](02_blank_rows_field_check.sql) | Check non-null counts of operational fields for missing starttimes | Run by Riley; results supplied 2026-11-05; saved with approval | ~3.5 GB (~$0.02) | 0 non-null values for stoptime, duration, stations, bikeid; usertype has 5,828,994 non-null values |
| [03_blank_rows_usertype_check.sql](03_blank_rows_usertype_check.sql) | Inspect distinct usertype values and string lengths for missing starttimes | Run by Riley; results supplied 2026-11-05; saved with approval | ~1.2 GB (< $0.01) | All 5,828,994 rows have an empty-string usertype (length 0); with query 02, blank on every field checked |
| [04_stations_snapshot_profile.sql](04_stations_snapshot_profile.sql) | Profile citibike_stations table uniqueness, timestamps, and capacity | Run by Riley; results supplied 2026-11-05; saved with approval | < 1 MB (< $0.0001) | 2,518 unique stations; latest reported 2026-11-04 (modern snapshot); avg capacity 29.7 docks |
| [05_usertype_annual_composition.sql](05_usertype_annual_composition.sql) | Annual breakdown of valid trips by usertype | Run by Riley; results supplied 2026-11-05; saved with approval | ~1.2 GB (< $0.01) | 53,108,721 valid trips; Customer share by year 8.9%–13.2% (11.7% overall); years cover different months |
| [06_duration_benchmarks.sql](06_duration_benchmarks.sql) | Summary quantiles, duration averages, and outlier checks for tripduration | Run by Riley; results supplied 2026-11-05; saved with approval | ~943 MB (< $0.01) | Median 10.5m, IQR 6.4–17.7m, p99 62.3m, min 60s, 11,513 trips > 24h, max ~226 days |
| [07_duration_by_usertype.sql](07_duration_by_usertype.sql) | Duration percentiles, averages, and >24h outlier breakdown by usertype | Run by Riley; results supplied 2026-11-05; saved with approval | ~1.65 GB (< $0.01) | Subscribers median 9.7m (p99 43.8m); Customers median 20.9m (p99 183.9m); Customers generate 51.1% of >24h trips |
| [08_day_of_week_usertype.sql](08_day_of_week_usertype.sql) | Trip volume across days of the week by usertype | Run by Riley; results supplied 2026-11-05; saved with approval | ~1.2 GB (< $0.01) | Subscribers peak mid-week; Customer share jumps from 7.3% mid-week to 22.4% on weekends (45.8% of Customer trips on weekends) |
| [09_top_routes_roundtrips.sql](09_top_routes_roundtrips.sql) | Top 10 station pairs, duration comparisons, and round-trip loop check | Run by Riley; results supplied 2026-11-05; saved with approval | ~3.7 GB (< $0.03) | 6 of top 10 routes are round trips; Central Park South loops average 47–54m, while Midtown point-to-point routes average 5–7m |
| [10_demographics_gender_birthyear.sql](10_demographics_gender_birthyear.sql) | Gender categories, birth_year population rates, and plausibility check | Run by Riley; results supplied 2026-11-05; saved with approval | ~1.65 GB (< $0.01) | male 67.1%, female 21.4%, unknown 11.5%; 91% of unknown group has null birth_year; implausible (<1900) birth years flagged; 11,873 trips list 2001–2002 |
| [11_hourly_rush_hour_patterns.sql](11_hourly_rush_hour_patterns.sql) | Hourly trip volume by usertype to identify rush-hour and leisure patterns | Run by Riley; results supplied 2026-11-05; saved with approval | ~1.2 GB (< $0.01) | Subscriber peaks at 8 AM (4.0M) and 5 PM (4.7M); Customers peak 2–4 PM; lowest volume in the 3 AM and 4 AM hours |
| [12_station_traffic_concentration.sql](12_station_traffic_concentration.sql) | Top 20 stations by combined departure and arrival volume | Run by Riley; results supplied 2026-11-05; saved with approval | ~3.0 GB (< $0.02) | Busiest station (E 17 St & Broadway) has 0.8% of departures; top 20 stations together have 12.6%; departures and arrivals differ by up to ~10% |
| [13_over_24h_timestamp_duplicate_check.sql](13_over_24h_timestamp_duplicate_check.sql) | Check that `tripduration` matches clock times and look for duplicates among trips over 24 hours, by usertype | Run by Riley; results supplied 2026-11-05; saved with approval | ~2.6 GB (< $0.02) | 11,513 trips over 24 hours; 0 missing stop times, 0 negative durations, 0 duplicates; all 307 differences over 60 s are under 1 hour (daylight saving time). Supports rule C2 |
| [14_monthly_over_24h_by_usertype.sql](14_monthly_over_24h_by_usertype.sql) | Monthly trips over 24 hours per 10,000 trips and bike-days, by usertype | Run by Riley; results supplied 2026-11-05; saved with approval | ~1.65 GB (< $0.02) | 106 rows. Mar–Aug 2014 and Jan–Feb 2015 show 0 trips over 24 hours (likely missing from the source). Jun 2017–May 2018: Customer 15.98 vs. Subscriber 1.05 per 10,000 trips |
| [15_trips_per_active_bike_day.sql](15_trips_per_active_bike_day.sql) | Average trips per bike per day for bikes ridden that day, Jun 2017–May 2018 (input to the value calculation) | Run by Riley; results supplied 2026-11-05; saved with approval | ~0.9 GB (< $0.01) | 16,951,030 trips (matches Query 14) / 2,695,579 active bike-days = 6.29. Counts only bikes ridden that day, so it runs higher than a fleet-wide average |
| [16_period_gap_summary.sql](16_period_gap_summary.sql) | Exact Jun 2017–May 2018 trips, >24h trips, >24h rate per 10,000 trips, and >24h bike-days by usertype | Run by Riley; results supplied 2026-11-05; saved with approval | ~1.65 GB (< $0.02) | Customer: 1,804,498 trips (10.65%), 2,883 >24h (15.98/10k), 21,733.4 bike-days. Subscriber: 15,146,532 trips (89.35%), 1,591 >24h (1.05/10k), 8,366.3 bike-days |
| [17_over_24h_by_day_of_week.sql](17_over_24h_by_day_of_week.sql) | Jun 2017–May 2018 >24h trips and rate per 10,000 trips by day of week and usertype (CP2 timing check) | Run by Norainelle Diaz 2026-11-10 on branch raine-work; awaiting Riley's review |~1.38 GB (< $0.01; BigQuery's estimate)| Customer rate peaks Wed (20.87/10k), lowest Sun (11.68); Subscriber peaks Sat (1.72). Customer÷Subscriber ~19–22× Mon–Thu vs. 8–10× Sat–Sun. Day totals 2,883 and 1,591 match Query 16 |
| [18_over_24h_by_start_station.sql](18_over_24h_by_start_station.sql) | Jun 2017–May 2018 >24h trips, rate per 10,000 trips, and Customer share by start station; stations with 1,000+ trips, top 25 (CP2 location check) | Run by Norainelle Diaz 2026-11-12 on branch raine-work; awaiting Riley's review | ~2.44 GB (< $0.02; BigQuery's estimate) | Top 7 stations are central Brooklyn with 8–21% Customer share; Fulton St & Utica Ave has 156 >24h trips (228.94/10k) vs. ~2.6/10k system-wide for all riders. Tourist stations rank lower (e.g., Grand Army Plaza 3.42/10k). A link, not a cause |
| [drafts/extreme_duration_timestamp_check.sql](drafts/extreme_duration_timestamp_check.sql) | Compare recorded and timestamp-derived durations for Customer trips over 24 hours in May 2017 and May 2018 | Existing draft; no query approval or execution result recorded | Not recorded; obtain a BigQuery estimate before running | Not recorded |

Scan and cost figures for queries 01–16 are agent estimates: referenced columns × assumed bytes per row × the documented 58.9M rows, priced at \$6.25 per TB on demand. BigQuery's own estimates and actual bytes billed were not recorded.

This draft does not establish the project's selected gap, cleaning policy, or accepted analysis.

## Uploaded-query SOP

Whenever the project lead uploads a query or directs review of a teammate's upload:

1. **Read and explain it.** Briefly describe its purpose, whether it supports descriptive exploration or the future selected problem, its tables and fields, and what one output row represents. Identify the supplied filename and any reported author or execution status without inventing missing details.
2. **Review the logic.** Check for unnecessary columns, important filters and joins, and assumptions about missing values, duplicates, impossible values, and incomplete observation periods. Flag missing data checks and propose a small follow-up query when needed. Static SQL review does not establish that the data passed those checks.
3. **Propose its saved form.** Check existing filenames and suggest the next unused `sql/NN_short_name.sql`. Use one short query per numbered step and a one-line `--` header pointing to `sql/README.md`. If splitting or correcting the upload would help, show the proposed changes and preserve its intended meaning until changes are approved.
4. **Draft its notes.** Propose a query-register entry and the relevant explanation here: purpose, output row meaning, cleaning and join choices, approval and execution status, estimates and their sources, supplied results, and open questions. Keep proposed choices distinct from approved rules. If an estimate or result is missing, mark it unavailable and request what is needed.
5. **Wait for file approval.** Show the exact proposed SQL and documentation changes with a brief reason. Uploading a query authorizes reading, review, and discussion; it does not itself authorize saving or changing repo files.
6. **Follow the approval and execution workflow below.** The project lead or a teammate runs queries. The agent explains supplied results and discusses their interpretation. A reported run is labeled as reported unless supporting execution evidence is available. Propose any resulting changes to findings, charts, or the main README separately.
7. **Ask before publishing.** After file changes are approved, request separate explicit approval for commits, pushes, pull requests, or merges, identifying the target branch. Uploading SQL or approving its file changes does not authorize publishing.

## How we develop queries

1. When the project lead requests SQL work, the agent proposes one short query and explains its purpose, what one output row represents, the required fields, and important filters or joins.
2. Confirm the required tables and columns. Review the estimated scan and cost, including its source and pricing assumptions. If the estimate is unavailable, request the BigQuery editor's estimate; do not invent one.
3. Review and approve the query. Saving it to the repo requires explicit approval of the proposed file change.
4. The project lead or a teammate runs the query in BigQuery and supplies the result and available execution details.
5. The agent acts as consultant: it analyzes and explains the result, discusses limitations with the project lead, and asks before recording an interpretation as an approved project conclusion.
6. Propose updates to these notes and the query register for approval. Publishing the file changes requires separate approval.

Accepted queries use one numbered file per step, such as `01_exploration.sql` and `02_cleaning_checks.sql`. Each file begins with a short comment pointing here, for example:

```sql
-- Step 1: Explore the selected comparison. See sql/README.md for notes.
```

Drafts remain in `drafts/` until their purpose and query have been accepted.

## Cleaning choices to resolve

The following items come from the supplied documentation or the assignment. No filter, exclusion, join method, or duration rule is adopted merely by listing it here.

| Issue | What needs checking before a decision |
|---|---|
| Blank rows and missing fields | Define valid records for the descriptive measure or future selected business metric, count relevant missing values, and document inclusion and exclusion rules. |
| Duplicate events | There is no reported trip ID. Investigate candidate duplicate definitions; a hash is not proof of uniqueness. |
| Durations and timestamps | Investigate long trips, invalid values, and disagreements between recorded duration and timestamp differences. Explain any threshold or choice of duration field. |
| Rider fields | If used, assess missing or implausible birth years and the meaning of rider categories. |
| Station data and joins | Investigate missing or zero values, name changes, ambiguous matches, unmatched trips, and row multiplication. The suggested crosswalk has not been built or adopted. |
| Time coverage | Account for partial first and last years, incomplete periods, and stations that opened or closed. Current station capacity and status do not establish historical conditions. |

After checks are run, record the query, evidence, proposed rule, effect on the analysis, and approved decision here.

**Approved rules:** C1 (exclude rows with no `starttime`) and C2 (trips over 24 hours use `tripduration > 86400`; gap measures cover June 2017–May 2018). Full entries are in [decisions.md](../decisions.md#approved-cleaning-rules).

## What to record for each accepted step

- Numbered SQL file, purpose, confirmed columns, and output row meaning.
- Data period, comparison groups, filters, joins, and cleaning choices with their reasons.
- Estimated bytes and cost with the source, date, and pricing assumptions; actual execution details when supplied.
- Result values with a traceable result reference, limitations, and the decision supported.
- Approval and execution status, including unresolved questions.

Keep the query results, [findings](../findings.md), [charter](../charter.md), charts, and main README consistent when their updates are approved. Preserve the source and calculation behind each reported number.

## Sheets, visuals, and data files

If Google Sheets or Tableau is used, add the workbook/view link and calculations here or in [visuals/notes.md](../visuals/notes.md). Add chart calculation and source references when a chart is created. Keep CSV, Excel, and Tableau data/extract files out of the repo.

