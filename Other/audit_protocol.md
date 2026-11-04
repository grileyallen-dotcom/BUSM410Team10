# Audit Protocol

This is our process for directing and checking the agent. Riley Allen is the project lead; the agent is a consultant. Actual human checks are recorded in [audit_log.md](audit_log.md).

## How we work

1. **The project lead directs the work.** The agent reads the repo, waits for Riley's direction, and helps with one small step at a time. Use [progress](../progress.md) for the current stage and Riley's latest direction for the task. A setup discussion does not authorize starting analysis.
2. **The agent proposes an action.** It explains the purpose and shows the exact proposed change. The project lead explicitly approves repo modifications before they happen.
3. **We check the evidence.** For factual claims, review the linked documentation, table definition, query result, or research source. Separate documented facts, calculations, assumptions, and the agent's interpretation.
4. **The agent prepares a short query.** It explains the output row, fields, filters, and estimated scan and cost. If the estimate is unavailable, it requests BigQuery's estimate. The project lead confirms the required tables and columns using available evidence, and Riley or a teammate reviews and runs the query when directed.
5. **The consultant explains the results.** The agent analyzes supplied results and discusses the reasoning with the project lead. It challenges unsupported interpretations directly and asks before treating an interpretation as an approved conclusion.
6. **We perform meaningful checks.** Depending on the claim, verify a definition, independently calculate a result, check totals and denominators, question a filter or join, or compare the interpretation with its source. Describe what was actually checked and any remaining uncertainty.
7. **The agent proposes the record.** For a substantial human check, it shows the proposed audit entry and category. It saves the entry only after the project lead approves the proposed entry and summary-count update. It separately proposes any new checking habit worth adding to this protocol.

## Checks to consider for CP1

- Confirm the date coverage and what one source row and one output row represent.
- Check relevant missing values, duplicates, impossible values, and incomplete comparison periods.
- Verify the gap, benchmark, denominators, difference, and chart against the query results.
- Check the value calculation, units, time period, price or cost source, and assumptions.
- Distinguish a benchmark scenario from a claim that an intervention will cause a particular result.

These are planned checks, not claims that the checks have already happened.

## Approval boundaries

- Reading files, inspecting the repo, external research, and discussing results do not require approval.
- Every repo modification requires explicit approval of the proposed change.
- Commits, pushes, pull requests, and merges require explicit approval separate from file edits.
- Each audit entry and protocol addition requires approval of its proposed wording.

## What belongs in the log

Record real human checks of agent work under one of the five required categories. Use the same five columns for every entry, with an accurate date, named human checker, evidence, and outcome.

Do not count routine approvals, uploads, wording preferences, ordinary clarification, or the agent's own checks as human audits. Do not invent checks or attribute the instructor's example checks to this team. If a check is unresolved, record that limit.

Keep the summary counts accurate, preserve existing entries, and add dated resolutions when needed. The [project-audit skill](../.agents/skills/project-audit/SKILL.md) provides the entry workflow; [AGENTS.md](../AGENTS.md) governs how the agent works with us.
