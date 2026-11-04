---
name: project-audit
description: Maintain the BUSM 410 team's audit protocol and log when students verify, challenge, or correct agent work, or request audit-record updates.
---

# Project Audit

At session start, read [AGENTS.md](../../../AGENTS.md), [Other/audit_protocol.md](../../../Other/audit_protocol.md), [decisions.md](../../../decisions.md), and the latest entries in [Other/audit_log.md](../../../Other/audit_log.md). After reading, wait for the user's direction. Follow AGENTS.md for approval and communication rules.

## Support student verification

Follow the [audit protocol](../../../Other/audit_protocol.md). Analyze supplied results, explain the reasoning briefly in plain language, and discuss the interpretation with the students. Do not require them to predict results or interpret them before you help. Challenge unsupported interpretations directly with evidence; offer more detail when requested.

The log records **the human checking the agent's work**: checking a source or schema, independently verifying a calculation, testing an assumption, or correcting an interpretation. Confirmed correct work can count. The agent may help design a check and resolve an issue, but describe each person's actual contribution.

Skip routine approvals, wording feedback, ordinary clarification, the agent's own checks, and checks of human work. An upload, a source request, an accepted decision, or a student explanation alone does not establish verification. Propose consequential choices and reasons for [decisions.md](../../../decisions.md); save them only after explicit approval. Use the audit log only when an actual human check also occurred.

## Propose and add entries

When a substantial human check is worth logging, flag it without waiting to be asked.

1. Read relevant earlier entries to avoid duplicates and identify the next unused number. Never reuse removed numbers.
2. Choose one existing category: Caught an error, Verified a claim, Separated fact from opinion, Changed the analysis, or Improved the agent's instructions.
3. Show the exact proposed entry, its category, the summary-count update, and a brief reason for logging it. Wait for explicit approval before changing the log.
4. Use these five columns: #, Date, What the AI said or did, How I checked it, Result. Start the AI description with "Agent" and the checking description with the actual person's name. Use the actual check date; describe the claim, method/evidence, and outcome briefly. Link sources or query results when available.
5. Update the category's summary count and check that it matches the entries.

Do not invent a reviewer, review, understanding, result, date, source, or learning progress. If a human reports a check performed elsewhere without available evidence, identify it as reported and explain the evidence limit. A source request does not prove the source was checked; a preview does not prove a whole-column property. Mark unresolved outcomes pending.

Preserve old entries. Add a dated resolution referring to an earlier entry when an issue is resolved later; keep the original history.

## Protocol changes and scope

When a meaningful human check suggests a useful new practice, show the exact proposed protocol addition and a brief reason. Apply it only after explicit approval. Avoid turning every interaction into a rule.

Reading files, inspecting the repo, and external research do not require approval. Every repo modification requires explicit approval. Approval to update an audit record or protocol does not authorize a commit, push, pull request, or merge; request separate explicit approval for those Git actions. Prepare queries for the students to run, following AGENTS.md.
