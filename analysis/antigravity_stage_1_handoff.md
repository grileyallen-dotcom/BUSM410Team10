# BUSM 410 Citi Bike Project — Antigravity Stage 1 Handoff

Received November 3, 2026. This AI-assisted import preserves the user-supplied Antigravity findings and original attachments. “Complete” below is the supplied handoff status; it does not record an independent BigQuery rerun or a team audit approval.

## Source attachments

- [Original Stage 1 discovery and gap report](../evidence/antigravity_stage_1/stage_1_discovery_and_gap_charter.pdf)
- [September 2017 station turnover export](../evidence/antigravity_stage_1/september_2017_station_turnover.csv)
- [Preservation manifest](../evidence/antigravity_stage_1/manifest.json)

## User-supplied completion handoff

### Context and scope

We are completing the BUSM 410 semester project using Google BigQuery public data (`bigquery-public-data.new_york_citibike`). Stage 1 (Discovery, Problem Framing, and Gap Charter) is complete.

### 1. Verified dataset and schema details — as reported

- `citibike_trips`: 58,937,715 total rows spanning 2013-07-01 to 2018-05-31.
- `citibike_stations`: Static metadata table containing station capacities and coordinates.
- **Join key fix:** In `citibike_stations`, `station_id` is a UUID string and `short_name` is a DOT decimal code (`6560.01`). The handoff uses a station-name join: `t.start_station_name = s.name`.

### 2. Focus KPI and business problem

- **KPI:** Station Dock Turnover Rate = Daily Trip Starts / Dock Capacity, measured in rides/dock/day.
- **Business problem:** Chronic Station Underutilization & Asset Misallocation. Physical docks carry fixed capital and street footprint costs, but a large portion of stations generate negligible ride volume.

### 3. Empirical findings — September 2017, as reported

| Measure | Reported result |
|---|---:|
| Active stations | 541 |
| System median benchmark | 1.59 rides/dock/day |
| 25th percentile (Q1) | 0.99 rides/dock/day |
| Underutilized cohort, below Q1 | 135 stations, approximately 25% of the analyzed stations |
| Docks in the cohort | 4,675 |
| Cohort average turnover | 0.58 rides/dock/day |
| Gap below the median | 1.01 rides/dock/day |
| Percentage shortfall | 63.4% |
| Daily benchmark opportunity | 4,716 rides/day |
| September benchmark opportunity | Approximately 141,490 rides |

The supplied handoff describes the opportunity as “unrealized rides” if these stations were brought to the median.

### 4. Current status and next step — as reported

- Stage 1 Gap Charter is documented and grounded in the supplied empirical results.
- The supporting CSV has been exported.
- The proposed next stage is benchmark launch and driver investigation: segment stations by borough/coordinates and investigate station-turnover drivers using BigQuery ML.

## Agent checks on the supplied evidence

These are automated checks during import, not approved human audit entries.

- The CSV has **541 rows and 541 distinct station names**.
- Its rounded turnover values reproduce a **1.59 median**, a **0.99 inclusive first quartile**, and **135 stations below 0.99**.
- Those 135 rows contain **4,675 docks**.
- The reported **0.58** is consistent with a **dock-weighted mean**: 0.58118 rides/dock/day. The unweighted station mean is 0.56622. State the weighting explicitly when presenting the cohort average.
- Applying the benchmark station by station to the rounded CSV gives:
  - Daily scenario = sum of `(1.59 - station_turnover) * station_capacity` over the below-Q1 cohort = **4,716.23 rides/day**.
  - Thirty-day scenario = **141,486.9 rides**, consistent with the supplied approximately 141,490 after rounding.
- These checks use the rounded export. Exact unrounded BigQuery results can differ slightly.

## Validation needed before final interpretation or Stage 2 modeling

1. **Calendar-day denominator:** The SQL in the supplied PDF averages station-day rows that have trips. It does not insert zero-trip dates. Therefore, it does not by itself establish a 30-calendar-day average for every station. Confirm service dates and zero-trip days; choose calendar days or verified operating days as the exposure denominator.
2. **Historical capacity:** The supplied station metadata is static. Its capacity values have not been established as the capacities operating in September 2017. Verify the snapshot date and station history before interpreting these as historical dock utilization.
3. **Join coverage and uniqueness:** The name join is the supplied workaround for incompatible identifiers. Check uniqueness in the station table, unmatched trip stations, renamed stations, and any duplicated join matches. The 541 joined stations are the analyzed population, not yet a verified count of the entire September 2017 network.
4. **Opportunity interpretation:** Bringing all below-Q1 stations to the system median is a benchmark scenario. It does not establish lost demand, recoverable additional rides, or the effect of reallocating docks.
5. **Persistence and comparability:** One month does not establish chronic underperformance. Compare additional periods and suitable peers before attributing the gap to asset misallocation. A common month aligns the broad season but does not fully control for local demand, station age, weather exposure, or operating interruptions.
6. **Costs and reproducibility:** The PDF reports about 471 MB for the coverage query and 2.57 GB for the turnover query. Those costs were not independently rerun during import. Check estimates before further queries and follow the course's date-filtering and small-copy guidance.

No BigQuery query, driver analysis, or model was executed during this upload. The proposed next stage remains planned work. The original attachments are unchanged; their preservation hashes are recorded separately.
