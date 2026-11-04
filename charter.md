# Project Charter

## The question

Where is expensive docking hardware sitting idle, what factors drive this underperformance, and how can management right-size or redeploy those physical docks to relieve bottlenecks in high-demand areas?

Idle hardware, explanations of underperformance, and benefits of redeployment are hypotheses requiring evidence.

## The decision this supports

A Citi Bike operations manager considering where to retain, reduce, expand, or relocate docking capacity during 2013-2018. The analysis will identify historical station patterns and candidates for management review. Specific dock quantities and expected benefits will depend on what the evidence can support.

## Scope

- **Dataset:** `bigquery-public-data.new_york_citibike`, using the existing data only. No additional datasets are included.
- **Period:** operations during 2013-2018. The [supplied documentation](Other/metadata.pdf) reports trip coverage from 2013-07-01 through 2018-05-31 in NYC local time. Verify coverage and account for the partial first and last years.
- **Historical source:** `citibike_trips`, including the station identifiers, names, coordinates, timing, and rider categories recorded on trips. Confirm the fields and definitions before analytical use.
- **Station snapshot:** the supplied documentation describes `citibike_stations` as a 2026 snapshot. Its capacity, availability, and status will be excluded from historical performance calculations.
- **Row meaning:** source records represent trips, subject to missing-row and duplicate checks. Proposed analysis output: one historical station per calendar month, so seasonal patterns and observation periods can be examined. Final station identity, eligibility, and aggregation rules require query review.
- **Comparison:** investigate comparable historical stations and calendar periods. The metric, peer definition, benchmark, and underperformance threshold will be selected after exploration and approval.
- **Factors:** examine associations supported by the historical records, such as time patterns, location, rider mix, and recorded trip duration. These comparisons do not establish causal drivers.
- **Evidence limits:** trip counts and observed trip flows do not directly measure historical dock occupancy, unused capacity, unmet demand, or stockouts. The supplied tables do not establish how many physical docks should move or the effect of moving them. Report any recommendation at the level supported by the evidence.
- **Value:** monetary valuation remains unresolved because the documented trip fields contain neither hardware costs nor fares. Any proposed cost source or valuation assumption must be reviewed and approved; numerical values and savings will not be invented.

The [documentation notes](Other/dataset_documentation.md) distinguish reported source claims from verified results. The [supplied ERD](Other/ERD.pdf) proposes a crosswalk; no crosswalk is adopted or created by this charter.

## What success looks like

- Define and measure one historical performance gap with a clear output row, comparable benchmark, difference, and source.
- Investigate supported associations and explain the limits on claims about idle hardware, causes, bottlenecks, and redeployment.
- Show the gap and benchmark in one chart, with every number traceable to approved numbered SQL, results, and documented cleaning choices.
- Quantify the gap's value with transparent math and a defensible price or cost source. Keep the CP1 monetary-value requirement explicitly unresolved until supported inputs are available.
- Give the operations manager an evidence-supported recommendation, explain uncertainty, and record real human checks of agent work in the audit log.
