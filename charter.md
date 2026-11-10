# Project Charter

*Business problem selected 2026-11-05.*

## The question

How much more often do casual Customers keep a Citi Bike out for more than 24 hours than annual Subscribers, and how many bike-days does that take out of service? Measured from June 2017 to May 2018 as trips over 24 hours per 10,000 trips, with the Subscriber rate as the benchmark.

## The decision this supports

A Citi Bike operations manager decides whether to target return measures at casual riders, such as reminders before 24 hours or station messaging where Customer long trips start, or to keep current practice. Riley Allen is the project lead; the agent acts as a consultant.

## Scope

- **Dataset:** `bigquery-public-data.new_york_citibike`, using the existing dataset only.
- **Existing period boundary:** operations during 2013-2018. Supplied documentation reports historical trip coverage from 2013-07-01 through 2018-05-31; confirm coverage and account for partial periods.
- **Descriptive analysis (completed):** The initial review documented table meanings, source-row definitions, date coverage, data quality, distributions, and relevant group and time patterns.
- **Approved analysis (2026-11-05):** Compare casual Customer trips over 24 hours with annual Subscriber trips. The KPI is trips with `tripduration > 86400` per 10,000 valid trips, paired with over-24-hour bike-days. Use June 2017–May 2018 and the same-period Subscriber rate as the benchmark. The monthly output row is `usertype × month`; the period-summary row is `usertype`. See [decisions.md](decisions.md) and [findings.md](findings.md) for approved rules, results, and valuation.
- **Evidence:** table selection and any joins must suit the approved question and time period. The supplied station snapshot comes from a different period than the historical trips; explain the applicability of every source.
- **Current activity:** consult [progress](progress.md) and the project lead's latest direction. Updates to the stage, scope, or charter require the applicable approval; a recorded stage does not prevent Riley from directing a different task.

Source material is in the [dataset documentation](Other/metadata.pdf), [ERD](Other/ERD.pdf), and [source notes](Other/dataset_documentation.md). Source-document suggestions are background evidence to assess.

## What success looks like

- Describe the dataset and setting clearly, with traceable evidence and data-quality limits.
- Use the approved question, output row, and KPI definition consistently in reproducible analysis.
- Measure a gap against a justified benchmark and show the comparison in a chart.
- Explain the gap's value with transparent math, units, assumptions, and a source for any price or cost; identify unresolved evidence requirements.
- Support a management decision with reproducible SQL, proportionate conclusions, stated uncertainty, and records of real human checks.
