# Project Charter

## Project question
Which one standard bike-share KPI shows a meaningful business problem in the available Citi NY Bikes data, how does performance compare with an appropriate benchmark, and what action could improve it?

The team will select the KPI, benchmark, and specific business problem after reviewing the data and researching accepted industry definitions.

## Decision this supports
A practical bike-share business decision that the team will define after identifying the KPI and the group responsible for acting on it. Do not recommend a specific intervention before the evidence supports one.

## Scope
- Analyze Citi NY Bikes bike-share or ride-share trip data available to the team in BigQuery.
- Research standard industry KPI definitions and sources.
- Compare the selected measure over time or against an appropriate competitor or market benchmark, if compatible data is available.
- Use SQL for analysis. Excel or Looker may be used for charts.
- Investigate variables associated with the selected KPI. Clustering or regression is optional and should be used only if it answers a clear, useful question.

## Success criteria
- One KPI and one business problem are selected and clearly defined.
- The KPI calculation, data coverage, and benchmark can be traced to sources.
- Queries use only needed columns and are saved with brief notes.
- A chart makes the problem visible.
- The analysis distinguishes measured associations from causal explanations.
- Any model has a defined purpose and evaluation method, and its limitations are explained.
- Findings lead to a practical recommendation or clearly state what further evidence is needed.

## Open decisions
- Which KPI and business problem to focus on.
- Which time periods, segments, or competitor benchmark are suitable.
- Whether available fields can answer a useful driver question.
- Whether a model adds decision value.

## Ownership
Team 10 owns the analysis and decisions. See [findings.md](findings.md) for supported results and [AGENTS.md](AGENTS.md) for the working process.
