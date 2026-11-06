# Project Decisions

This file records the project lead's stated direction and identifies open choices. Riley Allen is the project lead; the agent provides consulting support. Proposals and earlier exploratory ideas do not establish approval.

## Current direction

The following direction was stated by Riley in conversation on 2026-11-04 and 2026-11-05.

| Area | Current direction |
|---|---|
| Roles | Riley leads and makes project decisions. The agent researches, explains, challenges, and recommends as a consultant. Rainy Villame remains the project partner. |
| Current activity | Organize the repo and establish how work is handled. A setup discussion does not authorize starting analysis. Current stage belongs in progress.md and may change when Riley directs it. |
| Analytical sequence | Descriptive analytics first, then selection of a business problem informed by the evidence. |
| Business problem and business KPI (selected 2026-11-05) | Casual Customers keep bikes out for more than 24 hours far more often than Subscribers. KPI: trips over 24 hours (`tripduration > 86400`) per 10,000 valid trips, plus bike-days tied up. Benchmark: the Subscriber rate in the same period. |
| Analysis period (selected 2026-11-05) | June 2017–May 2018: the latest 12 straight months with complete coverage. |
| Analysis output row and valuation | `usertype` × month (Query 14) and full-period `usertype` summary (Query 16), with a station breakdown to follow. Valuation approved 2026-11-05 as Option C range (see V1 below); recommendations remain open. |
| CP1 chart and visual tools (updated 2026-11-05) | Excel, Sheets, Looker Studio, or Tableau are approved for visuals (supersedes Excel/Looker-only wording). Chart specifications are in [visuals/notes.md](visuals/notes.md); save PNG in `visuals/` without committing `.csv`, `.xlsx`, or Tableau data/extract files. |
| Existing data boundary | Citi Bike operations during 2013-2018 using the existing dataset only. |
| Read access | Reading files, repo inspection, and external research require no approval. |
| Repo changes | Show the exact proposed change and reason, then obtain explicit approval. |
| Git actions and multi-AI sync (updated 2026-11-05) | Local repo is the central shared brain across AI models; AI modifies local files after full diff approval. At milestones or session end, update `progress.md` and `decisions.md` (with approval) and hand Riley the exact Terminal commands to commit and push to `riley-setup` (AI does not run Git commits/pushes directly). Supersedes the prior partner-review merge gate: Riley manually merges `riley-setup` to `main` on GitHub without requiring Rainy's review. |
| Query execution | The agent prepares SQL when requested; Riley or a teammate runs it. |
| Communication | Short, simple replies; detail on request; direct, evidence-based disagreement. |
| Conflicting instructions | Declare the conflict. Riley may override project instructions; respect an override already given and clarify only when its meaning or scope is unclear. |
| Suggestions outside scope | May be offered in one or two sentences; implementation requires explicit approval. |
| Errors and obstacles | State them directly and propose corrections. Corrections that modify the repo require approval. |
| Shared memory | Keep the information needed for future conversations in the repo, with approval before updates. |

## Source confirmation

On 2026-11-04, Riley confirmed that `bigquery-public-data.new_york_citibike.citibike_trips` and its `starttime` column are available. This records the user's confirmation, not an independently executed query or a human audit entry.

## Approved cleaning rules

### C1. Exclude blank rows (approved 2026-11-05)

| Field | Entry |
|---|---|
| Decision-maker | Riley Allen, project lead |
| Rule | Analyses of `citibike_trips` use only rows where `starttime IS NOT NULL` |
| Effect | Excludes 5,828,994 of 58,937,715 rows (9.9%), leaving 53,108,721 trips |
| Evidence | [Query 01](sql/01_monthly_trips_and_missing_starts.sql) counted the rows. [Query 02](sql/02_blank_rows_field_check.sql) found `stoptime`, `tripduration`, `start_station_id`, `end_station_id`, and `bikeid` all null. [Query 03](sql/03_blank_rows_usertype_check.sql) found `usertype` is an empty string in every one |
| Reasoning | Agent recommendation: these rows have no time, duration, station, or bike, so they cannot represent trips. Riley approved the rule; Riley's own reasoning was not separately recorded |
| Alternatives | Keep the rows (rejected: they add no trip information); check the remaining fields first (not done; see limits) |
| Limits | Station names, coordinates, `birth_year`, `gender`, and `customer_plan` were not checked for these rows. This was checked by the agent only; there has been no human audit |

### C2. Measure long trips with `tripduration` over the latest 12 straight months (approved 2026-11-05)

| Field | Entry |
|---|---|
| Decision-maker | Riley Allen, project lead |
| Rule | A trip is "over 24 hours" when `tripduration > 86400`. Gap measures use June 2017–May 2018 only |
| Evidence | [Query 13](sql/13_over_24h_timestamp_duplicate_check.sql): among 11,513 trips over 24 hours, there are 0 missing stop times, 0 negative durations, and 0 duplicate bike/start/stop rows. All 307 differences over 60 seconds between `tripduration` and the clock times are under 1 hour, consistent with daylight saving time. [Query 14](sql/14_monthly_over_24h_by_usertype.sql): March–August 2014 and January–February 2015 report 0 trips over 24 hours for both rider types, which suggests long trips are missing from the source in those months |
| Reasoning | Agent recommendation: the chosen period is recent, has no missing months, and avoids the zero months. Riley chose Option A; Riley's own reasoning was not separately recorded |
| Alternatives | All 2013–2018 trips (9.50 vs. 1.20 per 10,000 trips; understates the recent gap); all months except the zero months (not calculated) |
| Limits | The cause of the zero months is unconfirmed. Period totals were subsequently verified in BigQuery via [Query 16](sql/16_period_gap_summary.sql) on 2026-11-05 |

## Approved valuation rule

### V1. Value excess >24h bike-days as a ceiling range from casual-pass to total-ride revenue (approved 2026-11-05)

| Field | Entry |
|---|---|
| Decision-maker | Riley Allen, project lead |
| Rule | Value the 20,736.7 excess Customer >24h bike-days (21,733.4 actual − 996.7 at the Subscriber rate) × 6.29 trips/active bike-day = 130,434 potential rides/year as an upper-bound ceiling range: ~$55.6K/year in direct casual-pass fees (130,434 × 10.65% Customer trip share × $4.00/casual trip) to ~$335.2K/year in system-wide ride fees (130,434 × $2.57/trip) |
| Evidence | [Query 16](sql/16_period_gap_summary.sql) for June 2017–May 2018 counts, bike-days, and 10.65% Customer share; [Query 15](sql/15_trips_per_active_bike_day.sql) for 6.29 trips/active bike-day; Motivate's May 2018 Citi Bike Monthly Operating Report to NYC DOT (https://citibikenyc.com/system-data/operating-reports) for $967,811.98 casual membership fees / 242,035 casual trips = $4.00/casual trip and $4,681,279.07 total membership & user fees / 1,824,476 total trips = $2.57/trip (verified by Riley, [audit #8](Other/audit_log.md)) |
| Reasoning | Agent recommendation: the $3 Single Ride launched only in April 2018 and 89.35% of period rides are flat-fee Annual Subscribers, so pairing the casual-pass ceiling with the system-wide user-fee ceiling uses verified primary data and bounds both marginal ticket revenue and total ride capacity. Riley selected Option C; Riley's own reasoning was not separately recorded |
| Alternatives | Option A ($3/ride single-ride ceiling of ~$391K/yr or $2.57/trip alone; overstates marginal ticket loss); Option B (~$55.6K/yr casual-pass ceiling alone; omits Subscriber capacity impact) |
| Limits | Both figures are ceilings: 6.29 counts only active bikes ridden that day (above full-fleet turnover), tied-up bikes only block rides when docks are empty, dollar per-trip rates come from May 2018 only, and BigQuery lacks fee records to net out collected >24h overtime or $1,200 lost-bike charges ($522.5K in total May 2018 casual overages) |

## Future decisions

For each consequential decision, propose the exact entry for approval. Record the actual decision-maker, decision, reasoning when supplied, evidence, alternatives where relevant, and unresolved limits. Do not invent reasoning or verification. If direction changes, identify the superseded decision and the new direction.
