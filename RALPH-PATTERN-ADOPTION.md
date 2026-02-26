# Ralph Pattern — Fit Assessment + Adoption Plan

Date: 2026-02-26

## What Ralph Pattern is (practical)
A continuous autonomous loop for coding agents:
1. Agent attempts task chunk
2. Evaluator/tester checks completion + tests
3. If not done, feedback is fed back and loop repeats
4. Exit only when explicit completion criteria are met

Common Ralph ingredients seen in current implementations:
- PRD/task list with status fields
- Fresh agent runs per iteration (reduce context drift)
- Commit/checkpoint each pass
- Explicit exit signal + verifier agreement
- Guardrails against infinite loops and runaway spend

## Why this fits our current direction
You already requested and approved:
- spec-first development
- held-out scenario testing
- separate developer/tester roles
- iterative chunking

Ralph is basically the execution wrapper around those rules.

## Recommended adoption (lightweight, not overbuilt)

### Phase A (today/tomorrow): Ralph-lite process
- Keep current markdown artifacts and templates
- Add loop state file per capability:
  - objective
  - chunk id
  - tests required
  - exit criteria
  - iteration count
- Run Dev agent -> Tester agent loop until exit criteria true

### Phase B (next): file-based state + strict exits
- Add `RALPH_STATUS` block in spec files:
  - `STATE: TODO|IN_PROGRESS|BLOCKED|DONE`
  - `EXIT_CRITERIA: ...`
  - `LAST_TEST_RESULT: pass/fail`
  - `NEXT_ACTION: ...`
- Require BOTH:
  1) agent self-claims done, and
  2) tester validates done

### Phase C (later): automation wrapper script
- small runner that:
  - reads pending chunk
  - spawns dev agent
  - spawns tester agent
  - updates status
  - stops on max-iteration/max-token guardrails

## Guardrails (mandatory)
- Max iterations per chunk (e.g., 5)
- Max token budget per chunk
- Hard stop on sensitive ops (firewall/inbox)
- Human escalation on repeated failures

## Proposed initial targets for Ralph-lite
1. Meeting Brief/Debrief v1 capability
2. Telemetry Spec Factory v1
3. Personal Ops Dashboard v1

## Decision
Adopt **Ralph-lite now** as process discipline, and only add automation wrappers after 2 successful manual loop runs.
