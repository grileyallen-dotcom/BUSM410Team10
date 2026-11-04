# Antigravity update: capacity peer benchmarks and candidate drivers

Received November 3, 2026. AI-assisted import of the user's Antigravity handoff.

## Evidence status

The newly attached `september_2017_station_turnover(1).csv` is byte-for-byte identical to the [previous September 2017 export](../evidence/antigravity_stage_1/september_2017_station_turnover.csv). Both have Git blob SHA `1572d3936ad4d8fbc0d7f0027335b0be0f0288e6`, 18,589 bytes, 541 station rows, and only these fields:

- `start_station_name`
- `avg_daily_turnover`
- `avg_daily_starts`
- `dock_capacity`

The attachment does **not** contain latitude, longitude, capacity-tier labels, `pct_weekday`, `pct_morning_rush`, or `pct_subscribers`. The enriched dataset mentioned in the handoff has not been supplied here. The original CSV is already in GitHub and is not duplicated under a new name.

## 1. Capacity peer benchmarks

Antigravity proposes replacing a blanket 1.59 rides/dock/day system median with capacity-tier medians. The following comparison separates the supplied claims from checks on the actual attachment:

| Capacity tier | Reported stations | CSV stations | Reported median | CSV median |
|---|---:|---:|---:|---:|
| Small: fewer than 25 docks | 95 | **94** | 1.12 | **1.205** |
| Medium: 25–45 docks, inclusive | 256 | **256** | 1.50 | **1.535** |
| Large: more than 45 docks | 191 | **191** | 2.13 | **2.13** |
| Total | **542** | **541** | — | — |

All median values are rides/dock/day. The agent calculated the CSV counts and medians using SQL on the supplied rounded station-level values. For even-sized groups, the exact median is the average of the two middle values. These checks do not rerun or validate the underlying BigQuery trip aggregation.

See the [machine-readable comparison](../evidence/antigravity_peer_benchmark/capacity_peer_check.csv).

### Interpretation

Capacity stratification is a useful proposed refinement because it compares stations within a size band. Capacity alone does not establish equivalent location, station age, service availability, or demand opportunity. The descriptions “neighborhood residential,” “mixed-use,” and “transit hubs/commercial corridors” in the supplied handoff are hypotheses, not classifications established by this four-column export.

The reported medians may come from a different enriched population or calculation, but that cannot be established without the actual enriched export and SQL. Do not silently replace the reported values with these provisional CSV medians in a final charter.

## 2. Candidate driver findings reported by Antigravity

### Geographic distance from Midtown Manhattan

The handoff reports:
- Low-turnover stations including `21 St & 31 Dr`, `34 Ave & 13 St`, `Vernon Blvd & 31 Ave`, and `Newton Rd & 44 St` have coordinates near 40.76, -73.93 in Astoria/Long Island City.
- A distance-versus-turnover correlation of **r = -0.435**, described by Antigravity as strong and statistically significant.

**Status:** Not reproducible from this attachment. Obtain station coordinates, the exact reference point, distance calculation, analyzed population, missing-value treatment, correlation method, and any statistical test before presenting this as verified. A correlation does not establish that distance causes low turnover.

### High capacity with low observed trip volume

These examples are present in the attachment:

| Station | Docks | Average daily starts | Turnover |
|---|---:|---:|---:|
| 48 Ave & 5 St | 79 | 28.1 | 0.36 |
| Dean St & Hoyt St | 77 | 34.9 | 0.45 |
| Fulton St & Clermont Ave | 75 | 36.9 | 0.49 |
| Great Jones St | 23 | 289.5 | 12.59 |

Antigravity interprets the first three as overbuilt and suggests capital could better serve stations such as Great Jones St.

**Status:** The low observed starts relative to the supplied capacities are supported by the export. “Overbuilt,” capital misallocation, and the benefit of relocating docks remain managerial hypotheses. Turnover contains capacity in its denominator, so an association with capacity can arise mathematically and is not sufficient proof of overbuilding. Verify historical capacities and operating exposure before making a relocation recommendation.

### Weekday ride share

The handoff reports:
- Top-quartile stations: **74.9%** of rides on weekdays.
- Bottom-quartile stations: **68.0%**.
- Some outer stations: below **35%** weekday share.

**Status:** Not reproducible because `pct_weekday` is absent. Define quartile membership, share scaling, and whether cohort averages are station-weighted or trip-weighted. A weekday share does not establish commuting purpose, consistency, or erratic use. Compare trips per weekday and per weekend day, and inspect variation over time.

## 3. Proposed BigQuery ML feature set — not executed

| Role | Proposed field | Available in attachment? |
|---|---|---|
| Target | `avg_daily_turnover` | Yes |
| Predictor | `dock_capacity` | Yes |
| Predictors | `latitude`, `longitude` | No |
| Predictor | `pct_weekday` | No |
| Predictor | `pct_morning_rush` | No |
| Predictor | `pct_subscribers` | No |

No model has been trained or evaluated during this import. These are candidate explanatory variables, not established drivers.

Before using the proposed features:
- Define the observation unit and whether the goal is same-period description or future prediction.
- Address capacity's role in the target denominator.
- Define rush-hour windows, weekday flags, subscriber categories, and treatment of missing values.
- Check the timing of features derived from the same trips as the target.
- Treat subscriber share as rider mix; it does not directly establish customer loyalty or retention.
- Specify evaluation, collinearity handling, and the basis for reporting a ranked driver list.

The Canvas overview places BigQuery ML in course Step 3. The handoff's “Stage 4” is an internal Antigravity label; it does not change the assignment requirements.

## 4. Next evidence needed

1. The actual enriched export containing the proposed geographic and behavioral fields.
2. The exact generating SQL and date/time-zone definitions.
3. Join coverage, duplicate checks, capacity snapshot date, and treatment of zero-trip and nonoperating days.
4. Reconciliation of the 541 attached rows with the 542 stations implied by the reported peer table.

Carry forward the [earlier Stage 1 validation notes](antigravity_stage_1_handoff.md), especially historical-capacity validity and the calendar-day denominator.

This upload preserves the user's recent work and makes evidence gaps explicit. It does not promote reported claims into validated findings, run BigQuery queries, train a model, or record a human audit approval.
