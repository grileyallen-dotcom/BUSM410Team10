# Citi Bike: first time-series investigation

## Initial finding

The original comparison of full-period 2017 averages with January–May 2018 overstated the evidence for a sustained utilization decline. Comparing the same months instead shows a 12.2% fall in rides per bike used in April 2018, followed by a nearly flat May (−0.6%). April–May together fell 6.0%. The next investigation should focus on April's demand and bike-usage mix and on the long-duration rides affecting May's mean.

## Scope and coverage

Analysis uses the existing daily bike-usage and monthly duration CSV exports. No additional BigQuery scan was run. The shared date range is July 2013–May 2018. All 53 monthly trip totals reconcile exactly between these two exports, and the daily bike file has no duplicate dates.

October 2016–March 2017 are absent from both exports. January 2016 has 27 observed dates out of 31. These are observed export gaps; their cause is not established. Missing dates must not be interpreted as zero demand. April and May in both 2017 and 2018 have all calendar dates represented, making them the latest available adjacent matched months. Full date coverage does not independently prove complete trip capture.

## 1. Trips per bike used per day

| Measure | April 2017 | April 2018 | Change | May 2017 | May 2018 | Change |
|---|---:|---:|---:|---:|---:|---:|
| Observed days | 30 | 30 | — | 31 | 31 | — |
| Trips | 1,315,404 | 1,307,543 | −0.6% | 1,523,268 | 1,824,710 | +19.8% |
| Average distinct bikes ridden per day | 7,161.8 | 8,063.3 | +12.6% | 7,260.5 | 8,839.9 | +21.8% |
| Mean daily trips per bike used | 6.028 | 5.294 | −12.2% | 6.553 | 6.515 | −0.6% |

The rate is the arithmetic average of each day's trips divided by distinct bike IDs ridden that day. Ratios were recomputed from the daily trip and bike counts, rather than averaging already rounded export ratios. This is the same daily-rate definition used in the initial scorecard. It differs from dividing total monthly trips by total bike-days.

April had nearly unchanged trips and 12.6% more distinct bikes ridden per day. That explains the direction of the rate change arithmetically; it does not establish why more bikes were used or whether the fleet was inefficient. May trip growth nearly matched growth in bikes ridden. Across April–May, trips increased 10.3%, average bikes ridden increased 17.3%, and the mean daily rate fell 6.0% (6.295 to 5.915).

Distinct bikes ridden excludes available bikes with no trips. It is not the serviceable fleet denominator. Fleet deployment, station expansion, weather, weekday mix, bike cohort, and changes in recorded coverage remain possible explanations requiring more evidence.

## 2. Trip duration

| Measure | April 2017 | April 2018 | Change | May 2017 | May 2018 | Change |
|---|---:|---:|---:|---:|---:|---:|
| Mean duration, minutes | 18.1 | 16.2 | −10.5% | 16.4 | 18.7 | +14.0% |
| Approximate median, minutes | 10.8 | 9.9 | −8.3% | 10.8 | 11.0 | +1.9% |
| Mean minus median, minutes | 7.3 | 6.3 | — | 5.6 | 7.7 | — |

April rides shortened in both the mean and median. May's mean rose much faster than its median, which is consistent with a change in the longer-duration tail or rider composition. These summaries cannot distinguish a larger tail share, more extreme long rides, or shifts between rider segments.

The trip-weighted average across April–May rose from approximately 17.19 to 17.66 minutes (+2.7%). This combined mean is approximate because the monthly means in the source were rounded to one decimal. Monthly medians were not averaged to claim a combined median.

Next query: [trip_duration_drilldown.sql](../sql/trip_duration_drilldown.sql). It compares April and May by rider type, includes the share above 60 minutes and the 95th/99th percentiles, and reports nonpositive or missing durations separately. Sixty minutes is an exploratory threshold, not a rule that longer rides are invalid.

## 3. Rider mix and missingness

The existing export is an all-period aggregate: 46,917,572 Subscriber trips, 6,191,149 Customer trips, and 5,828,994 trips with missing user type. It cannot establish changes over time. It also does not show whether those unknown rider types have usable timestamps.

Next query: [rider_mix_by_month.sql](../sql/rider_mix_by_month.sql). This reads only `starttime` and `usertype`, retains a separate row for records without a start time, and returns monthly counts and shares. If missing user types are concentrated in undated rows, their missingness cannot be attributed to a calendar period. Do not assign them to a year or interpret them as changing customer behavior.

## Follow-up results: rider mix and duration by segment

The two follow-up exports reconcile to the original counts. The rider-mix file has 54 rows: 53 dated monthly groups plus one undated group. The duration file has eight month/segment groups, and every group has zero missing or nonpositive durations.

### Rider type is complete for dated trips

All 5,828,994 records with missing rider type also have missing `starttime`. All 53,108,721 dated trip rows have a Subscriber or Customer label, with no unknown or other types. The earlier 9.89% missing-type figure describes the whole table; it does not establish a rider-classification gap within the dated history. The undated records cannot be assigned to a time period from this output. Their other fields have not been checked here.

| Rider mix | April 2017 | April 2018 | Change | May 2017 | May 2018 | Change |
|---|---:|---:|---:|---:|---:|---:|
| Customer trips | 188,860 | 149,311 | −20.9% | 189,760 | 242,594 | +27.8% |
| Subscriber trips | 1,126,544 | 1,158,232 | +2.8% | 1,333,508 | 1,582,116 | +18.6% |
| Customer share | 14.36% | 11.42% | −2.94 percentage points | 12.46% | 13.29% | +0.83 percentage points |

April's nearly flat total trips conceal fewer Customer trips and modest Subscriber growth. Because Customers typically record longer trips, the lower Customer share also helps explain April's shorter overall mean. It does not establish why Customer trips declined.

### May's mean increase is concentrated in Customer trips

| May measure | 2017 | 2018 |
|---|---:|---:|
| Customer mean, minutes | 33.53 | 49.73 |
| Customer approximate median, minutes | 21.57 | 21.90 |
| Customer mean among trips up to 60 minutes | 21.55 | 21.87 |
| Customer share above 60 minutes | 5.80% | 6.40% |
| Customer trips above 60 minutes, reconstructed | 10,998 | 15,538 |
| Customer mean above 60 minutes, reconstructed | 228.19 | 456.93 |
| Subscriber mean, minutes | 13.95 | 13.94 |

Customer mean duration increased 48.3%, while the median and the mean for rides up to 60 minutes each changed by about 1.5%. The share of Customer rides above 60 minutes increased by 0.61 percentage points. Within those longer rides, the reconstructed mean roughly doubled, from 3.80 to 7.62 hours. This isolates the increase to the longer-duration Customer distribution; it does not establish whether long rentals were legitimate, affected by recording issues, or linked to another operational cause.

The mean for rides above 60 minutes is reconstructed as `(overall_mean − (1 − long_trip_share) × mean_up_to_60_minutes) / long_trip_share`. Their count is `long_trip_share × valid_trips`. These calculations use the full precision in the CSV, not displayed rounded percentages.

The full-precision segment results reconstruct May's overall mean as 16.388 minutes in 2017 and 18.699 in 2018, an increase of 2.310 minutes. An arithmetic decomposition attributes approximately 2.155 minutes (93.3% of the increase) to the change in Customer mean duration, −0.008 minutes to the change in Subscriber mean duration, and 0.164 minutes to rider-share changes. For this decomposition, segment-mean changes use 2018 weights; share changes use 2017 means. This allocates a measured change and is not a causal model.

### Next problem area

Prioritize the extreme-duration portion of Customer trips in May 2018 versus May 2017. Run [customer_duration_bands.sql](../sql/customer_duration_bands.sql) to identify whether rides of 3–6 hours, 6–24 hours, or more than 24 hours explain the increase in recorded trip minutes. Then inspect stations, dates and bike IDs only for the contributing group. Retain long-duration records until their role is understood; an exploratory threshold is not proof of invalidity.

## Duration bands: extreme Customer records drive the spike

The duration-band export reconciles to the segment output: 189,760 Customer trips in May 2017 and 242,594 in May 2018. Summed recorded minutes reproduce the full-precision Customer means.

| Customer records exceeding 24 hours | May 2017 | May 2018 |
|---|---:|---:|
| Records | 150 | 417 |
| Share of Customer trips | 0.079% | 0.172% |
| Share of recorded Customer trip minutes | 15.83% | 41.51% |
| Mean recorded duration, days | 4.66 | 8.34 |
| Maximum recorded duration, days | Approximately 62.1 | Approximately 119.0 |

These 417 records represent only 0.0229% of all May 2018 trips, yet have a large effect on the mean. Months are defined by trip start time, so recorded durations may extend beyond May. The maximum is based on the exported maximum hours rounded to two decimals.

### Sensitivity to Customer records exceeding 24 hours

| Mean duration, minutes | May 2017 | May 2018 | Change |
|---|---:|---:|---:|
| Customer trips, all durations | 33.53 | 49.73 | +48.3% |
| Customer trips, excluding Customer durations over 24 hours | 28.24 | 29.14 | +3.2% |
| All rider types, all durations | 16.39 | 18.70 | +14.1% |
| All rider types, excluding only Customer durations over 24 hours | 15.73 | 15.96 | +1.5% |

This is a sensitivity analysis, not an instruction to delete or classify the records as invalid. Subscriber records, including any long Subscriber durations, remain in the all-rider sensitivity calculation. The adjusted means subtract the full recorded minutes and record counts for Customer trips over 24 hours from their respective numerators and denominators. All-rider totals also use the full-precision Subscriber counts and means in the prior export.

The measured duration spike is largely explained statistically by a small group of extreme recorded Customer durations. The data do not yet show whether these reflect legitimate rentals, bikes not returned or closed out promptly, or a recording/calculation issue. They must not be described as continuous cycling time or a confirmed operating failure.

### Next validation

Run [extreme_duration_timestamp_check.sql](../sql/drafts/extreme_duration_timestamp_check.sql). It tests whether `tripduration` agrees with the difference between recorded start and stop times and separates missing stops, reversed times, and mismatches. It reads four columns from the trip table. Agreement would support timestamp consistency, but would not establish why the recorded rental remained open so long. A subsequent investigation can add station and bike identifiers after the timing check narrows the relevant records.

## Original next steps, now partly completed

The rider-mix, duration-segment and Customer duration-band queries are now complete. Customer records over 24 hours are the leading duration investigation. April's bike-usage decline also warrants demand comparisons across weekdays, hours, stations and bike cohorts: its total trips mask a 20.9% fall in Customer trips. Underlying causes and any actual service deficiency remain unconfirmed.

## Sources and calculation notes

- Daily bike usage: `job_ttfGqIWCVUOOQCqC4A0gVRTR19IV.csv`, exported from `bigquery-public-data.new_york_citibike.citibike_trips`.
- Monthly duration: `job_fTPykmDMO2A8cFGzCNa1JXVuHLqM.csv`, same table. Original query included positive trip durations only.
- All-period rider mix: `job_q2jppTD6TLR0rtlypzLskOeSdLUm.csv`, same table.
- Monthly rider mix and timestamp coverage: `job_IcHj9QNgVvyVgn_CQqHpGnGwWmQ8.csv`, same table.
- Duration by month and user type: `job_JHiXo775pTyb2rWQfqp4lVuiHSph.csv`, same table.
- Customer duration bands: `job_S3YWkIGz-PfzZLKnTnlJ2wv-EfDA.csv`, same table.
- Year-over-year change = current period / matching prior-year period − 1. Changes shown are relative percentages, not percentage points.
- Equal calendar months reduce seasonality differences but do not control weather, holidays, weekday composition, network changes or bike cohort.
