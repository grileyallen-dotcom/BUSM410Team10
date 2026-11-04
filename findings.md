# Findings

*Working draft for Citi Bike operations during 2013-2018. No approved gap-analysis results are recorded yet.*

The research question and management decision are in the [charter](charter.md). The question focuses on idle docking hardware and possible redeployment; the analysis must establish which parts the available evidence can support.

## The gap

**Pending approved query results.** No station or group has yet been identified as underperforming in the current analysis.

| Item | Current status |
|---|---|
| Source records | Historical trip records, subject to cleaning and duplicate checks |
| Analysis row | One historical station per calendar month, as proposed in the approved charter; final aggregation and station-eligibility rules await query review |
| Reported source period | 2013-07-01 through 2018-05-31; verify coverage and account for partial years |
| Performance measure and comparison population | Pending exploration and approval |
| Observed performance, benchmark, and difference | Pending measured results |
| Supporting SQL and result reference | Pending an approved analysis query and its supplied output |

The completed gap statement must identify what is happening, where, when, how large the difference is, and what one output row represents. Low trip activity alone does not establish idle physical docks.

## The benchmark

**Pending selection and approval.** The charter allows investigation of comparable historical stations and calendar periods; no particular peer group, threshold, or benchmark value has been adopted.

The final explanation must identify the comparison, justify its relevance, show the benchmark calculation or source, and state the difference in clearly named units. Check seasonal effects and unequal observation periods before interpreting that difference.

## Value

**Pending a measured gap and supported valuation inputs.** No dollar amount, hardware saving, recoverable demand, or expected redeployment benefit has been established.

The completed calculation must show the math, units, time period, and a source for any price or cost. State every approved assumption and distinguish the scale of a benchmark scenario from an intervention's expected effect.

The existing documented trip fields contain no hardware costs or fares. Historical dock capacity is also unresolved. The CP1 monetary-value requirement remains open until a defensible calculation can be supported within the approved scope.

## Chart

**Pending measured results and chart approval.** Save the approved gap-versus-benchmark chart as `visuals/gap_chart.png` and embed it here after the file exists.

The chart must use the same measure, units, population, and comparison period as the text. Cite its query or calculation so the displayed values can be reproduced.

## Limits on interpretation

- The study uses existing data for 2013-2018 only. The supplied documentation describes the station table as a 2026 snapshot; current capacity and status are excluded from historical performance calculations.
- Historical trip activity and observed flows do not directly measure dock occupancy, spare capacity, unmet demand, or stockouts.
- Associations do not establish what caused underperformance or what would happen after docks were moved.
- The [supplied dataset documentation](Other/metadata.pdf) and [ERD](Other/ERD.pdf) include reported profile statistics and a proposed station crosswalk. Their [source status and verification limits](Other/dataset_documentation.md) must be respected.
- Specific dock quantities, dollar values, and recommendations remain conditional on supported evidence.

## Evidence needed next

Review an uploaded query and its output using the [uploaded-query SOP](sql/README.md#uploaded-query-sop). Keep its purpose, cleaning choices, estimates, execution status, results, and interpretation in the [SQL guide](sql/README.md).

The agent will explain supplied results and discuss them with the team. Changes to this file, adoption of a project conclusion, and Git publishing retain their respective explicit approval requirements.
