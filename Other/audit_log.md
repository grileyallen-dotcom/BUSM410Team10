# Audit Log

This log records actual human checks of agent work. Routine approvals and the agent's own checks are excluded.

The entries below were reconstructed from the project conversation on 2026-11-04. Table dates refer to when each check occurred; each entry describes the human's observed action and its evidence limits.

| Category | What it records | Entries |
|---|---|---|
| [Caught an error](#caught-an-error) | A human found an error in the agent's work. | 1 |
| [Verified a claim](#verified-a-claim) | A human checked a claim against evidence. | 1 |
| [Separated fact from opinion](#separated-fact-from-opinion) | A human checked whether a statement was documented or inferred. | 0 |
| [Changed the analysis](#changed-the-analysis) | A human check led to a change in the analysis. | 0 |
| [Improved the agent's instructions](#improved-the-agents-instructions) | A human tested or corrected how the agent is instructed. | 1 |

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

## Improved the agent's instructions

| # | Date | What the AI said or did | How I checked it | Result |
|---|---|---|---|---|
| 3 | 2026-11-04 | Agent proposed AGENTS instructions that embedded a fixed current stage and direction. | Riley questioned the proposed instruction in conversation, warning that the current stage could become "a blockade later," and explained that AGENTS should be a lasting working guide. | Instructions were revised to keep changing stage in [progress.md](../progress.md), retain durable rules in [AGENTS.md](../AGENTS.md), and allow Riley to override outdated project instructions. The revision was published; future agent behavior has not been independently tested. |

Before adding an entry, propose its wording and category for approval. Use the actual date; start the AI description with "Agent" and identify the human by name in the checking column. Include evidence and unresolved limits. Use unique entry numbers and update the summary counts.
