# Team10

**Course:** BUSM 410 · Big Data and Advanced Analytics · BYU–Hawaii  
**Canvas team:** Team 10

## Team

- Riley Allen — project lead
- Rainy Villame — project partner

The AI agent serves as a consultant: it explains evidence, challenges assumptions, presents options, and recommends next steps. Riley directs the project and approves actions and conclusions.

## Current stage

See [progress](progress.md) for the current stage and [decisions](decisions.md) for the latest project-lead direction. Riley determines when to move between organization, exploration, and problem-focused analysis. Stage records provide context and can be changed by Riley's explicit direction.

## Project setup

- **Dataset:** Citi NY Bikes
- **Google Cloud project ID:** `busm410-project`

## BigQuery access

The screenshot below shows the project IAM setup with our partner and instructor added.

<img width="1512" height="982" alt="BigQuery IAM page showing project access" src="https://github.com/user-attachments/assets/8afd644b-be6b-4b00-8092-31f59899099d" />

## Explore the work

| File | What it contains |
|---|---|
| [charter.md](charter.md) | The project question, management decision, scope, and success criteria. |
| [findings.md](findings.md) | The measured gap, benchmark, valuation, charts, and limitations. |
| [AGENTS.md](AGENTS.md) | Project facts, approved rules, and working guidance for the agent. |
| [sql/README.md](sql/README.md) | Query register, methods, cleaning choices, results, and execution notes. |
| [01_monthly_trips_and_missing_starts.sql](sql/01_monthly_trips_and_missing_starts.sql) | Monthly trip counts and missing start-time check. |
| [02_blank_rows_field_check.sql](sql/02_blank_rows_field_check.sql) | Checks operational fields on rows missing a start time. |
| [03_blank_rows_usertype_check.sql](sql/03_blank_rows_usertype_check.sql) | Checks user-type values on rows missing a start time. |
| [04_stations_snapshot_profile.sql](sql/04_stations_snapshot_profile.sql) | Profiles station count, IDs, snapshot dates, and capacity. |
| [05_usertype_annual_composition.sql](sql/05_usertype_annual_composition.sql) | Annual trip counts by rider type. |
| [06_duration_benchmarks.sql](sql/06_duration_benchmarks.sql) | Trip-duration distribution and outlier checks. |
| [07_duration_by_usertype.sql](sql/07_duration_by_usertype.sql) | Trip-duration comparisons by rider type. |
| [08_day_of_week_usertype.sql](sql/08_day_of_week_usertype.sql) | Trip patterns by weekday and rider type. |
| [09_top_routes_roundtrips.sql](sql/09_top_routes_roundtrips.sql) | Frequent routes, durations, and round trips. |
| [10_demographics_gender_birthyear.sql](sql/10_demographics_gender_birthyear.sql) | Gender and birth-year data checks. |
| [11_hourly_rush_hour_patterns.sql](sql/11_hourly_rush_hour_patterns.sql) | Hourly trip patterns by rider type. |
| [12_station_traffic_concentration.sql](sql/12_station_traffic_concentration.sql) | Station activity and traffic concentration. |
| [13_over_24h_timestamp_duplicate_check.sql](sql/13_over_24h_timestamp_duplicate_check.sql) | Timestamp and duplicate checks for trips over 24 hours. |
| [14_monthly_over_24h_by_usertype.sql](sql/14_monthly_over_24h_by_usertype.sql) | Monthly over-24-hour trip rates and bike-days by rider type. |
| [15_trips_per_active_bike_day.sql](sql/15_trips_per_active_bike_day.sql) | Trips per active bike-day used in the valuation. |
| [16_period_gap_summary.sql](sql/16_period_gap_summary.sql) | Period totals and benchmark comparison by rider type. |
| [Gap comparison chart](visuals/cp1_over_24h_gap_vs_benchmark.png) | Primary chart comparing Customer and Subscriber rates. |
| [Monthly trend chart](visuals/cp1_monthly_over_24h_rates.png) | Monthly rates by rider type for the study period. |
| [Dataset documentation](Other/metadata.pdf) | Supplied dataset and table descriptions. |
| [Table diagram](Other/ERD.pdf) | The dataset ERD and proposed station crosswalk. |
| [Documentation notes](Other/dataset_documentation.md) | Schema transcription, source status, and verification limits. |
| [Audit protocol](Other/audit_protocol.md) | How the team directs and checks the agent. |
| [Audit log](Other/audit_log.md) | Recorded human checks of the agent's work. |
| [Project audit skill](.agents/skills/project-audit/SKILL.md) | Workflow for proposing audit-log entries. |

## Approved problem framing

A source row represents one Citi Bike trip; under cleaning rule C1, a valid trip has a non-null `starttime`. For June 2017–May 2018, Query 16 summarizes one output row per rider type. Customers had 2,883 trips over 24 hours out of 1,804,498 valid trips (15.98 per 10,000), compared with 1,591 out of 15,146,532 Subscriber trips (1.05 per 10,000): a difference of 14.93 per 10,000 and a 15.2× rate. Query 14's output grain is rider type × month; it has 106 rows overall, including 24 rows in the selected 12-month period.

At the Subscriber benchmark rate, the Customer trips correspond to 996.7 benchmark bike-days instead of 21,733.4 observed bike-days, or 20,736.7 excess bike-days. Using 6.29 trips per active bike-day gives 20,736.7 × 6.29 = 130,434 potential rides. Applying May 2018 average fee proxies gives 130,434 × 10.65% × $4.00 = about $55,565 and 130,434 × $2.57 = about $335,215. These are annual capacity ceilings, not realized savings; the fee proxies come from the [Citi Bike operating reports](https://citibikenyc.com/system-data/operating-reports). This supports an operations manager's decision about targeted return reminders or station messaging. See [findings.md](findings.md) for assumptions and [sql/README.md](sql/README.md) for query details.
