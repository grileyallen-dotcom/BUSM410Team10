# Project Timeline

## Nov 2 — First queries
We started exploring Citi Bike questions in BigQuery. Riley checked scan sizes and asked for smaller queries.

## Nov 3 — Clean GitHub setup
Riley found the old project folder was inside the wrong Git folder, so he cloned a fresh copy of the repo and started working on his own branch.

## Nov 4 — Repo and agent rules set up
We added the CP0/CP1 instructions, the instructor's example, and the Citi Bike documentation. Riley wrote AGENTS.md and set up the audit log. We decided to explore the data before choosing a problem.

## Nov 5 — Exploring the data (Queries 01–12)
- 5,828,994 rows were blank, so we dropped them (rule C1), leaving 53,108,721 trips.
- The station table is a current snapshot (2,518 stations), not 2013–2018 history.
- Members (Subscribers) took about 88% of trips. Their median ride was 9.7 minutes; casual riders' was 20.9.
- No single station dominates: the busiest has 0.8% of departures.

## Nov 5 — Choosing the gap (Queries 13–16)
We picked our problem: casual riders keep bikes over 24 hours far more often than members. For June 2017–May 2018: 15.98 vs. 1.05 per 10,000 trips (15× more). Riley checked the value inputs against Citi Bike's May 2018 operating report.

## Nov 9 — Charts
We made the gap chart and a monthly trend chart. Riley checked the chart numbers against the query results.

## Nov 10 — CP1 finished
Riley cleaned up the CP1 files to match the assignment, merged them into main, and we submitted the repo link. Riley also caught the AI pushing changes straight to main against our rules (audit #11).
