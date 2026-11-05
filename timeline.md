# Project Timeline

This timeline follows Team10 from project setup toward evidence-led analysis. It distinguishes project decisions from reported data results.

## November 2, 2026 — Early exploration meets query-cost limits

The team began exploring Citi Bike questions with SQL drafts. Riley checked BigQuery's scan estimates and asked for ways to reduce query size. These were exploratory steps; they did not establish an approved business problem or verified findings.

## November 3, 2026 — The project gets a clean GitHub home

Terminal checks showed that the old project folder was inside a Git repository rooted at Riley's home directory. Riley cloned a fresh copy of the BUSM410Team10 repository and began working on a separate branch.

## November 3–4, 2026 — Course requirements and data structure come into focus

Riley supplied the CP0 and CP1 assignment instructions, the instructor's example repository, and Citi Bike table documentation and diagrams. The project records were organized around the assignment. The documentation also highlighted that the trip history and the current station snapshot come from different periods.

## November 4, 2026 — The project pauses before choosing its business problem

Riley considered a question about underused docking hardware, then decided not to lock in a business problem or KPI before understanding the data. The agreed sequence became descriptive exploration first, followed by choosing a problem based on what the evidence shows.

## November 4, 2026 — Agent guidance and human audits become part of the workflow

Riley shaped `AGENTS.md` around explicit approval, concise consulting, project-lead control, and preserving project context in the repository. The audit protocol and log were organized to record meaningful human checks, with evidence and limitations stated clearly.

## November 4, 2026 — The charter and findings file become flexible frameworks

The charter and findings structure were adjusted to support the future business problem without presuming its question, KPI, benchmark, or recommendation. The repository is prepared for descriptive findings before CP1 gap analysis.

## November 5, 2026 — The first monthly trip overview is reviewed

Riley supplied a monthly trip-count result from BigQuery. Its counts reconcile to the totals reported in the dataset documentation. The result contains no monthly rows from October 2016 through March 2017 and reports 5,828,994 rows with missing `starttime`. These are supplied results; the agent did not run the query.

The next descriptive check is to determine whether rows with missing `starttime` are blank across all fields or contain other trip information. After that, exploration can continue before Riley selects the business problem and KPI.
