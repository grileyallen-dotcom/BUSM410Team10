# Findings

*Working structure. The future business problem has not been selected, and no approved descriptive or gap-analysis results are recorded yet.*

Use this file to explain what the evidence establishes. The [charter](charter.md) defines the evolving question and scope; the [SQL guide](sql/README.md) records how results were produced. Riley Allen leads the project, with the agent acting as a consultant.

## Descriptive context

**Pending descriptive analysis requested by the project lead.** First establish the setting: what the tables and source rows mean, date coverage, data quality, distributions, and relevant patterns over time or across groups.

Record each supported observation with its query or source, units, population, period, and limitations. Contextual observations can help the project lead choose the future business problem; they do not automatically establish a selected problem or business conclusion.

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
