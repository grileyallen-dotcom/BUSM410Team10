# Findings

Working analysis saved November 3, 2026. AI-assisted interpretation of team-supplied query exports; the final KPI, problem statement and intervention remain team decisions. This is not an approved human audit record.

## Executive summary

For trips starting in May, overall mean recorded duration rose from 16.39 minutes in 2017 to 18.70 in 2018 (+14.1%). The increase is concentrated in extreme Customer records: 150 Customer records exceeded 24 hours in May 2017, versus 417 in May 2018. In 2018 those records represent 0.172% of Customer trips but 41.51% of recorded Customer minutes. Omitting this group as a sensitivity check reduces the overall mean increase to 1.5%. Do not classify these records as erroneous or continuous cycling time without more evidence.

The leading candidate KPI is mean recorded trip duration, benchmarked against the same month of the prior year. The team has not confirmed a final business problem or operational recommendation.

## Benchmark and trends

| Measure | Benchmark period | Comparison period | Result | Interpretation |
|---|---|---|---|---|
| All-rider mean recorded duration | May 2017: 16.39 min | May 2018: 18.70 min | +14.1% | Highly sensitive to extreme Customer records |
| Customer mean recorded duration | May 2017: 33.53 min | May 2018: 49.73 min | +48.3% | Subscriber mean stayed approximately 13.94 min |
| All-rider mean excluding only Customer records over 24h | May 2017: 15.73 min | May 2018: 15.96 min | +1.5% | Sensitivity analysis, not an authorized cleaning rule |
| Mean daily trips per bike ridden | April 2017: 6.028 | April 2018: 5.294 | −12.2% | Trips almost flat while distinct bikes ridden per day rose 12.6% |
| Mean daily trips per bike ridden | May 2017: 6.553 | May 2018: 6.515 | −0.6% | Does not support a broad 2018 decline based on unequal annual periods |
| Customer trip count | April 2017: 188,860 | April 2018: 149,311 | −20.9% | Subscriber trips increased 2.8%; explanation not yet established |

See the [complete KPI scorecard](analysis/kpi_scorecard.md) and [time-series investigation](analysis/time_series_investigation.md). This is a self-benchmark over time, not an external market target. Standard industry definitions and a source-backed external benchmark remain open assignment work.

## Data quality and coverage

- Source trip table: `bigquery-public-data.new_york_citibike.citibike_trips`.
- Dated history in exports: July 2013–May 2018; October 2016–March 2017 have no rows in the exports, and January 2016 has only 27 observed dates. The cause is unknown.
- April and May 2017/2018 contain all calendar dates. This is not independent proof of complete trip capture.
- All 5,828,994 records missing user type also lack start time. All 53,108,721 dated rows have Subscriber or Customer labels; the undated records cannot be assigned to a year.
- The bikes-used denominator includes only bikes ridden that day, not all serviceable fleet bikes.
- Station availability and capacity outputs use fields in the shown `citibike_stations` schema. The exact submitted job SQL was not exported; the user's statement that every query used the trip table conflicts with those fields. Confirm table lineage before relying on station results.
- Integer trip station IDs cannot be joined directly to the UUID-like station IDs shown in the station table without a verified mapping. Names for station ID 519 differ between exports.
- Corrected the bike-ID count to 17,682 by counting CSV records; the prior note's approximate 17,681 count missed the final row without a trailing newline.

## Possible drivers and next step

Extreme recorded durations, legitimate long rentals, delayed return/closeout, and duration/timestamp problems are candidate explanations. No causal attribution is established.

Next: review and run the [draft timestamp consistency check](sql/drafts/extreme_duration_timestamp_check.sql). No result has been received. Agreement between duration and timestamps would establish internal consistency, not prove a legitimate rental. Then inspect dates, station IDs and bike IDs for the contributing records.

## Model and action

No clustering or regression has been selected or performed. No operating intervention or outlier deletion is recommended yet. A presentation chart is still pending; this save contains tables and exported evidence.

## Sources and reproducibility

- [SQL notes and execution status](sql/notes.md)
- [Evidence index and original result archive](evidence/README.md)
- [Progress and remaining decisions](progress.md)

No new BigQuery query, cloud spending or human review is claimed by this save.
