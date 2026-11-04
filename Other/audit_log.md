# Audit Log

This log records actual human checks of agent work. Routine approvals and the agent's own checks are excluded.

The entries below were reconstructed from accessible project conversations on 2026-11-04. Table dates refer to when each check occurred; each entry describes the human's observed action and its evidence limits.

| Category | What it records | Entries |
|---|---|---|
| [Caught an error](#caught-an-error) | A human found an error in the agent's work. | 1 |
| [Verified a claim](#verified-a-claim) | A human checked a claim against evidence. | 1 |
| [Separated fact from opinion](#separated-fact-from-opinion) | A human checked whether a statement was documented or inferred. | 0 |
| 3 |
| 2 |

## Caught an error

| # | Date | What the AI said or did | How I checked it | Result |
|---|---|---|---|---|
| 2 | 2026-11-04 | Agent drafted a coverage query and asked Riley to paste it into BigQuery while the task was building the repo. | Riley challenged the proposed step, stating: "we are not running queries. We are building the repo." | Agent acknowledged moving into query planning too soon and returned to repository organization. This records Riley's task-scope correction; it does not claim a check of SQL correctness or query results. |

## Verified a claim

| # | Date | What the AI said or did | How I checked it | Result |
|---|---|---|---|---|
| 1 | 2026-11-03 | Agent suspected that the project folder was using a Git repository rooted in Riley's home folder. | Riley ran `git rev-parse --show-toplevel` and `git rev-parse --git-dir` and shared terminal output identifying the home folder and its `.git` directory. | Confirmed the diagnosis. Work moved to a fresh clone with its own project repository. Evidence: terminal output shared in this conversation on 2026-11-03. |

## Separated fact from opinion

| # | Date | What the AI said or did | How I checked it | Result |
|---|---|---|---|---|

## Changed the analysis

| # | Date | What the AI said or did | How I checked it | Result |
|---|---|---|---|---|
| 4 | 2026-11-02 | Agent proposed an initial data-quality and coverage query. | Riley reported BigQuery's estimate: "It says it will process 1.98 GB of data. I want to process less." | Agent proposed 1% table sampling for exploration and a shorter-window alternative. The post-change scan estimate and execution of those alternatives were not verified in this review. Sources: `Identify market KPIs`. |
| 5 | 2026-11-02 | Agent supplied a station-flow query covering departures and arrivals. | Riley reported that query 4 wanted to process 2.91 GB and requested a smaller query. | Agent proposed a replacement using one table reference and CROSS JOIN UNNEST to count both directions, and requested a new estimate. An actual reduction in processed bytes was not demonstrated in the accessible messages. Sources: `Identify market KPIs`. |
| 7 | 2026-11-03 | Agent drafted an Antigravity prompt covering the full project and referring to project files. | Riley reviewed the prompt and restricted execution to Stage 1 with preparation for Stage 2; Riley also pointed out that Antigravity had no uploaded files and needed the essential context inline. | Agent delivered a revised prompt limited to Stage 1 and a Stage 2 launch plan, with self-contained context. The revision is visible; this review does not verify Antigravity's subsequent execution or completion claims. Sources: `Project Overview Update`. |

## Improved the agent's instructions

| # | Date | What the AI said or did | How I checked it | Result |
|---|---|---|---|---|
| 3 | 2026-11-04 | Agent proposed AGENTS instructions that embedded a fixed current stage and direction. | Riley questioned the proposed instruction in conversation, warning that the current stage could become "a blockade later," and explained that AGENTS should be a lasting working guide. | Instructions were revised to keep changing stage in [progress.md](../progress.md), retain durable rules in [AGENTS.md](../AGENTS.md), and allow Riley to override outdated project instructions. The revision was published; future agent behavior has not been independently tested. |
| 6 | 2026-11-03 | Agent asked Riley to supply project context that had already been provided in the repo or other project chats. | Riley directed the agent to check GitHub before asking unanswered questions, and later challenged the repeated upload request by pointing to context already supplied in other project sessions. | Agent retrieved repo context and earlier chats, acknowledged that it should have looked first, and narrowed its questions to unresolved choices. This records the context-retrieval correction, not human verification of every recovered fact. Sources: `Summarize project guidance`; `Create project stages graphic`. |

Before adding an entry, propose its wording and category for approval. Use the actual date; start the AI description with "Agent" and identify the human by name in the checking column. Include evidence and unresolved limits. Use unique entry numbers and update the summary counts.
