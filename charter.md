# Project Charter

*Working framework. The future business problem has not been selected.*

## The question

TBD. The project lead will select one business question after descriptive analytics have established the setting and relevant patterns. The repo does not currently prescribe a business problem, KPI, benchmark, or analysis output row.

## The decision this supports

TBD. After selecting the problem, identify the manager, the decision to be made, and the alternatives the evidence can help assess. Riley Allen is the project lead; the agent acts as a consultant.

## Scope

- **Dataset:** `bigquery-public-data.new_york_citibike`, using the existing dataset only.
- **Existing period boundary:** operations during 2013-2018. Supplied documentation reports historical trip coverage from 2013-07-01 through 2018-05-31; confirm coverage and account for partial periods.
- **First analytical stage:** descriptive analytics to understand table meanings, source-row definitions, date coverage, data quality, distributions, and relevant group or time patterns.
- **Later selection:** the project lead will approve the business problem, KPI definition, output row, comparisons, benchmark, valuation approach, and recommendation scope after reviewing descriptive evidence.
- **Evidence:** table selection and any joins must suit the approved question and time period. The supplied station snapshot comes from a different period than the historical trips; explain the applicability of every source.
- **Current activity:** consult [progress](progress.md) and the project lead's latest direction. Updates to the stage, scope, or charter require the applicable approval; a recorded stage does not prevent Riley from directing a different task.

Source material is in the [dataset documentation](Other/metadata.pdf), [ERD](Other/ERD.pdf), and [source notes](Other/dataset_documentation.md). Source-document suggestions are background evidence to assess.

## What success looks like

- Describe the dataset and setting clearly, with traceable evidence and data-quality limits.
- Select one business question and define its measure and analysis row with the project lead's approval.
- Measure a gap against a justified benchmark and show the comparison in a chart.
- Explain the gap's value with transparent math, units, assumptions, and a source for any price or cost; identify unresolved evidence requirements.
- Support a management decision with reproducible SQL, proportionate conclusions, stated uncertainty, and records of real human checks.
