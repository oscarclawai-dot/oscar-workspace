# Agent Delivery Loop (Rule-Based, Lightweight)

## Objective
Ship capabilities reliably using small chunks, clear specs, held-out scenarios, and independent testing.

## Core Rules (Always / Ask / Never)

### Always
1. Write a short spec first (goal, scope, constraints, done criteria).
2. Break work into chunks that fit 30–90 minutes.
3. Create held-out scenarios before implementation.
4. Use separate roles: Specifier → Developer → Tester.
5. Require pass on functional checks + scenario checks.
6. Log outcomes and update backlog after each chunk.

### Ask First
1. Firewall/network/security changes.
2. Inbox/email/calendar access.
3. External messaging/posts/transactions.

### Never
1. Silent model/provider switching.
2. Destructive system changes without approval.
3. Marking work complete without test evidence.

## Spec Template (Minimal)
- Problem
- Goal
- Non-goals
- Constraints
- Acceptance criteria (testable)
- Risks
- Deliverables

## Scenario Template (Held-out)
- Scenario ID
- Setup
- Expected behavior
- Failure signal

## Delivery Pipeline
1. **Spec Draft** (short, explicit AC)
2. **Scenario Pack** (kept separate)
3. **Task Split** (small chunks)
4. **Dev Pass** (implement chunk)
5. **Test Pass**
   - Functional tests
   - Scenario tests (held-out)
6. **Review Artifact**
   - What shipped
   - What failed
   - Next chunk

## Quality Gates
A chunk is only “done” if:
- AC pass = yes
- Scenario pass rate >= 90% (or documented exceptions)
- No high-risk unresolved issue
- Backlog + memory updated

## Token Budget Gate (Mandatory)
Before starting each chunk:
1. Read current quota (`session_status` / `openclaw models status`)
2. Estimate token burn for chunk (Low/Med/High + numeric range)
3. Decide if chunk fits current 5h window remaining
4. If not, down-scope to smaller chunk

Budget bands (working estimates):
- **Small**: 5k–20k tokens (single artifact/update)
- **Medium**: 20k–60k tokens (spec + scenarios + one implementation pass)
- **Large**: 60k–150k tokens (multi-agent build + test cycle)

Stop/adjust rules:
- If 5h remaining < 25%, run only Small chunks
- If 5h remaining < 15%, run only maintenance/logging tasks
- Never start a Large chunk when 5h remaining < 40%

## Metrics to Track
- Spec-to-ship cycle time
- First-pass test pass rate
- Scenario pass rate
- Rework count per chunk
- Estimated vs actual token burn per chunk

## Current Approved Mode
- Autonomous execution for capability development
- Explicit approval required for firewall and inbox access
