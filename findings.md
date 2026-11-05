# Findings

*Working structure. The future business problem has not been selected, and no approved descriptive or gap-analysis results are recorded yet.*

Use this file to explain what the evidence establishes. The [charter](charter.md) defines the evolving question and scope; the [SQL guide](sql/README.md) records how results were produced. Riley Allen leads the project, with the agent acting as a consultant.

## Descriptive context

The following descriptive baselines were established through queries executed on 2026-11-05 (see [sql/README.md](sql/README.md) for query details and verification):

1. **Total Population and Valid Trips:**
   * The `citibike_trips` table contains 58,937,715 total rows.
   * Exactly 5,828,994 rows (~9.9%) have a null `starttime`. As confirmed by [02_blank_rows_field_check.sql](sql/02_blank_rows_field_check.sql) and [03_blank_rows_usertype_check.sql](sql/03_blank_rows_usertype_check.sql), these rows are completely blank records (nulls across all operational fields and a 0-length empty string for `usertype`). Filtering `WHERE starttime IS NOT NULL` isolates the 53,108,721 valid trip records.
2. **Seasonality and Growth:**
   * Monthly volume exhibits strong seasonality, peaking in summer/early autumn (July–September) and reaching troughs in winter (January–February).
   * Overall volume expanded from system launch in July 2013 through 2017. An apparent 6-month reporting gap occurs from October 2016 through March 2017 ([01_monthly_trips_and_missing_starts.sql](sql/01_monthly_trips_and_missing_starts.sql)).
3. **Stations Snapshot Boundary:**
   * The `citibike_stations` table contains 2,518 unique stations with an average capacity of 29.7 docks ([04_stations_snapshot_profile.sql](sql/04_stations_snapshot_profile.sql)).
   * The table is a live modern snapshot (latest report November 4, 2026) and cannot be assumed to reflect historical 2013–2018 capacity or network layout.
4. **Rider Composition:**
   * All 53,108,721 valid trips fall into exactly two user categories: `Subscriber` and `Customer` ([05_usertype_annual_composition.sql](sql/05_usertype_annual_composition.sql)).
   * Annual Subscribers account for 87% to 90% of all trips across every year, while casual Customers make up 10% to 13%.
5. **Trip Duration Benchmarks:**
   * Typical rides are short utility trips: the median duration is 10.5 minutes (627 seconds), with 50% of all trips between 6.4 and 17.7 minutes ([06_duration_benchmarks.sql](sql/06_duration_benchmarks.sql)).
   * 99% of all trips conclude in under 62.3 minutes. The minimum duration is 60 seconds (no sub-minute trips exist).
   * A small fraction (11,513 trips, ~0.02%) exceeds 24 hours, extending up to ~226 days and pulling the mean duration to 16.0 minutes.
6. **Duration Differences by Rider Type:**
   * Annual Subscribers take shorter, commuter-timed rides: median duration is 9.7 minutes, with 99% under 43.8 minutes ([07_duration_by_usertype.sql](sql/07_duration_by_usertype.sql)).
   * Casual Customers take rides more than twice as long: median duration is 20.9 minutes, with the 99th percentile reaching 183.9 minutes (~3.1 hours).
   * Casual Customers account for 51.1% of all multi-day trips exceeding 24 hours (5,880 of 11,513), despite making up only 11.7% of all trips. A Customer ride is ~8 times more likely to exceed 24 hours than a Subscriber ride (0.095% vs 0.012%).
7. **Weekday vs. Weekend Demand Dynamics:**
   * Subscribers dominate weekday commuter hours, peaking mid-week on Wednesday at 7.77M trips and dropping ~35% on weekends ([08_day_of_week_usertype.sql](sql/08_day_of_week_usertype.sql)).
   * Casual Customers surge on weekends: 45.8% of all casual Customer trips occur on Saturday and Sunday alone. Customer share jumps from 7.3%–7.7% on mid-week days to over 22% on weekends.
8. **Route Concentration and Leisure Loops:**
   * 6 of the top 10 most frequent routes in the network are round-trip loops where the bike returns to the origin station ([09_top_routes_roundtrips.sql](sql/09_top_routes_roundtrips.sql)).
   * Central Park South stations dominate the top routes (55.7k trips at `Central Park S & 6 Ave`), averaging 47 to 54 minutes per trip, contrasting sharply with high-volume Midtown commuter dashes that average 5 to 7 minutes.

## The gap

**TBD after descriptive exploration and project-lead approval.**

| Required element | Status |
|---|---|
| Selected business problem and management decision | TBD |
| Business KPI, formula, and units | TBD |
| Analysis output row, population, and period | TBD |
| Observed performance and measured size of the gap | Pending approved results |
| Supporting query and result reference | Pending |

Once the problem is selected, explain what is happening, where and when, how large the gap is, and what one output row represents.

## The benchmark

**TBD.** After the problem is selected, identify an appropriate earlier period, peer group, or sourced external reference. The project lead will approve the definition, calculation, comparison population, and rationale.

Report the benchmark value and the difference in clear units, supported by a query, calculation, or source. Account for unequal observation periods and other relevant comparability limits.

## Value

**TBD.** Choose a valuation approach suited to the future business problem. Show the math, units, period, assumptions, and source for every price or cost.

Keep the scale of the measured gap distinct from a claim about achievable improvement or an intervention's expected benefit. If required inputs are unavailable, identify the unresolved requirement.

## Chart

**Pending descriptive results and, later, the selected problem.** Add approved descriptive charts when useful for context. The final gap-versus-benchmark chart belongs in `visuals/` and must be embedded here after it exists.

Every chart must use consistent definitions, units, populations, and periods, with traceable source queries or calculations.

## Interpretation, recommendations, and limits

Recommendations will follow the evidence and the project lead's chosen decision. No recommendation, output format, causal explanation, or intervention effect is predetermined.

Respect the approved 2013-2018 scope and explain source applicability. The [supplied documentation](Other/metadata.pdf), [ERD](Other/ERD.pdf), and [source notes](Other/dataset_documentation.md) provide context; their reported profile results are not automatically verified project findings.

## Updating this file

When queries are uploaded, follow the [uploaded-query SOP](sql/README.md#uploaded-query-sop). The agent explains supplied evidence, discusses interpretations, and proposes exact changes for the project lead's approval. Git publishing requires separate approval.
