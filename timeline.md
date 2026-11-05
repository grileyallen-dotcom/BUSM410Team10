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

## November 5, 2026 — Data-quality checks confirm 5.8M blank rows and station snapshot limits

Riley supplied results for Queries 02–04:
- Query 02 confirmed that rows with missing `starttime` have null `stoptime`, `tripduration`, station IDs, and `bikeid`.
- Query 03 confirmed that `usertype` is an empty string for all 5,828,994 blank rows.
- Query 04 confirmed that `citibike_stations` represents a modern snapshot (953 stations, 72% active) rather than a historical table matching the 2013–2018 trip data.

## November 5, 2026 — Descriptive exploration establishes user, route, and traffic baselines

Riley executed Queries 05–12 in BigQuery and provided the results, which were documented in `sql/README.md` and synthesized in `findings.md`:
- **User mix and duration (Queries 05–07):** Annual subscriber share increased from ~78% in 2013 to ~87% by 2018. Subscribers take shorter, utility-focused trips (median ~10–12 minutes), while short-term customers take longer trips (median ~20–25 minutes).
- **Day of week and routes (Queries 08–09):** Subscriber trips peak during weekdays; customer trips peak on weekends. Top customer routes concentrate around park loops (Central Park) and waterfronts with high same-station return rates, whereas subscriber routes reflect point-to-point transit.
- **Demographics, commute hours, and station traffic (Queries 10–12):** Subscribers account for virtually all demographic reporting. Weekday trip volume spikes sharply during commute rush hours (8–9 AM and 5–6 PM). Station departures are heavily concentrated among major transit hubs like Pershing Square North and 8th Ave & W 31st St.

## November 5, 2026 — Project stages defined and Cleaning Rule C1 approved

Riley added a formal seven-stage project roadmap to `progress.md` (Stage 0 Setup through Stage 6 Review/Audit/Merge) to guide progress through CP1 requirements. 

Riley also formally approved the project's first analytical cleaning rule in `decisions.md`:
- **Rule C1 (Exclude blank rows):** All subsequent analyses filter out rows where `starttime IS NULL`, removing the 5,828,994 non-trip rows and leaving 53,108,721 validated trips.
