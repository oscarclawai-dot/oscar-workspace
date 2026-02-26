# AI Harness Weekly 001
Date: 2026-02-26

## What changed (practical signals)
1. **Spec-first + held-out scenario testing is becoming standard** for reliable agent workflows.
2. **Multi-agent pipelines** are useful, but only after single-agent loops are stable and measurable.
3. **Decision logs/ADRs** dramatically reduce context loss and improve iteration quality.
4. **Approval-gated autonomy** is a key trust pattern for assistants with external action ability.
5. **Model routing by task type** (cost/capability-aware) improves consistency and budget efficiency.

## Why this matters to your workflow
- You already discovered the core truth: large, vague asks underperform; chunked specs + tests outperform.
- Your current system now has the right primitives: backlog, decision docs, quota governance, approval gates.
- Next leverage is repeatable templates and evaluation loops, not bigger one-off agent runs.

## Adopt now / Watch later / Ignore

### Adopt now
- Decision Desk records for non-trivial choices
- Sprint Picker for 15/30/60 execution windows
- Held-out scenario bank attached to each new capability
- Weekly learning curation that maps directly to backlog items

### Watch later
- Multi-agent coding pipeline orchestration
- Shared memory between separate assistant instances

### Ignore (for now)
- High-novelty automation with low frequency (e.g., specialty shopping negotiators)

## 10 concrete tasks Oscar can execute autonomously
1. Create reusable decision template pack (`DECISION-TEMPLATES/`)
2. Build `DECISIONS-INDEX.md` for searchable decision history
3. Add Sprint Picker command snippets/examples
4. Generate weekly harness curation briefs (`AI-HARNESS-WEEKLY-*`)
5. Build a lightweight eval checklist for each capability
6. Add “failure modes” section to all major specs
7. Create capability acceptance-test template
8. Normalize backlog item format (owner, trigger, output, done criteria)
9. Build a “smallest viable next step” playbook for busy days
10. Add a weekly retrospective template (planned vs shipped vs blocked)

## 3 validation/evaluation loops to add immediately

### Loop A: Capability Spec Gate
- Must include: objective, scope, constraints, done criteria, failure modes
- If missing, capability does not start

### Loop B: Held-Out Scenario Validation
- Keep scenarios separate from spec drafting
- Validate outputs against scenarios before declaring done

### Loop C: Post-Ship Review
- 24–72h after shipping, rate:
  - usefulness
  - reliability
  - maintenance burden
- Convert findings into backlog updates

## Recommended next actions (this week)
1. Finalize Decision Desk templates + index
2. Run 2 real decisions through the workflow
3. Operationalize Sprint Picker for daily use
4. Publish Weekly 002 with one deeper focus: software-development harness testing patterns
