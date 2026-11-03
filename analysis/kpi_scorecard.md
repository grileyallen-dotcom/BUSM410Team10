# Citi Bike KPI Scorecard

## Scope

This scorecard summarizes query outputs for the BigQuery public dataset `bigquery-public-data.new_york_citibike`. Trip-history outputs cover July 2013 through May 2018. Station status and station coverage require the separate `citibike_stations` table. Results are descriptive baselines; no external benchmark has been applied.

## KPI scorecard

| # | KPI | Result | Assessment |
|---|---|---|---|
| 1 | Trips over time | Hourly volume peaks at 5 p.m. (5.23M trips) and 6 p.m. (5.02M); 8 a.m. is another peak (4.16M). | Clear commute-hour pattern. Date coverage is incomplete in 2016 (270 observed days) and 2017 (275), so annual trend comparisons are not yet comparable. |
| 2 | Trip duration | Monthly median: 8.4–12.2 minutes; monthly average: 10.8–19.3 minutes. Weighted annual average rose from 14.18 minutes in 2014 to 17.12 in 2017, then was 16.20 in Jan–May 2018. | The average exceeding the median suggests a long-trip tail. Compare matched months before calling this a sustained trend. |
| 3 | Trips per bike used per day | Mean daily ratio was 5.68 in 2014, 5.95 in 2015, 6.50 in 2016, 6.63 in 2017, and 5.07 in Jan–May 2018. | Possible utilization decline in 2018, but this denominator counts only bikes ridden that day, not the fleet in service. |
| 4 | Station departures and arrivals | 927 station IDs; about 53.1M departures and 53.1M arrivals. ID 519 led departures in the export (551,078). | High-volume station IDs are useful drill-down candidates. Names for ID 519 conflict across exports; verify names by date before attributing a location. |
| 5 | Station net flow | Largest net departure: ID 519 (−40,059). Largest net arrival: ID 324 (+29,976). Total arrivals exceeded departures by 10. | All-period net flow hides month-to-month changes and does not prove station stockouts or full docks. |
| 6 | Same-station trip rate | 1,144,735 of 53,108,721 trips with both station IDs present: 2.16%. | A rough recreation proxy, not a confirmed use-purpose measure. |
| 7 | Rider mix | Subscriber 79.61%; Customer 10.50%; missing user type 9.89% across the entire table. All 5,828,994 unknown-type records also lack starttime. `customer_plan` was blank in the result. | Follow-up confirms every dated trip has a rider label. Undated records cannot be assigned to a period; plan-level analysis remains unavailable. |
| 8 | Trips per bike ID | 17,682 bike IDs; approximately 3,004 trips per ID over the full period. Top ID: 18104 with 7,222 trips. | Measures bike utilization, not repeat customer behavior. Bike service time and ID reuse may affect the result. |
| 9 | Latest station availability | Of 2,464 stations with valid reports, 90.10% had bikes and 91.36% had open docks. Available bikes were 39.94% of capacity. | A single latest-status snapshot; report freshness and station-level patterns need validation. |
| 10 | Station coverage by region | 2,464 stations and 73,776 docks across four regions. Region 71 had 2,347 stations (about 95%) and 71,252 docks. | Strong geographic concentration, but interpretation needs region definitions and population or area context. |

## Recommended time-series investigations

### 1. Trips per bike used per day

The original full-period averages (6.63 in 2017 versus 5.07 in Jan–May 2018) cover different seasons and cannot establish a decline. The first matched-month investigation found April 2018 down 12.2% versus April 2017, but May down only 0.6%. See [the time-series investigation](time_series_investigation.md). This remains a proxy because bikes not ridden are absent from the denominator.

### 2. Trip duration

Weighted annual average duration rose from 14.18 minutes in 2014 to 17.12 in 2017, with unequal seasonal coverage. Follow-up matched-month analysis isolates May 2018's increase to extreme recorded Customer durations. Just 417 Customer records over 24 hours account for 41.51% of that month's Customer trip minutes. Excluding this group as a sensitivity check reduces the overall May mean increase from 14.1% to 1.5%. Validate timestamps before determining whether the records are legitimate or erroneous.

### 3. Rider mix and missingness

Subscribers represented 79.61% of all rows, customers 10.50%, and 9.89% had missing `usertype`; `customer_plan` was blank. Follow-up shows all unknown user types are undated, and every dated trip is classified. Customer share fell from 14.36% to 11.42% in April 2018 versus April 2017, then rose from 12.46% to 13.29% in May. April Customer trips declined 20.9%, while Subscriber trips increased 2.8%.

Station net flow is a strong operational follow-up, but it should be compared monthly by station ID. The station status export is a latest snapshot, not historical availability, and the trip/station IDs shown in the schemas do not directly match.

## Comparison rules for the next analysis

- Compare the same calendar months or seasons across years to control for seasonality.
- Use monthly rates and matching denominators rather than raw totals when observation windows differ.
- Verify date coverage first: the trip output had only 270 observed dates in 2016 and 275 in 2017.
- Separate true changes from missing or inconsistent fields, especially `usertype`, `customer_plan`, and station names.
- Do not join trip station IDs (INTEGER in the shown schema) directly to station `station_id` (STRING/UUID-like in the shown schema) without a verified mapping.
