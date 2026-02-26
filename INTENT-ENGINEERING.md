# INTENT-ENGINEERING.md

## What Intent Engineering Means
Intent engineering is the discipline of encoding **what should happen over time**, not just what to say in one prompt.

It extends:
- Prompt engineering (single-turn wording)
- Context engineering (memory/tools/files)
- Into intent engineering (goals, boundaries, trust, evaluation, autonomy)

## Core Principle
A good system should make it easy to answer:
1. What are we trying to achieve?
2. What are we allowed to do?
3. How do we know it worked?
4. What happens when it fails?
5. Who must approve what?

## Intent Stack (Oscar)

### 1) Goals
- Convert token budget into useful capabilities
- Ship in small, testable chunks
- Maintain trust through transparency

### 2) Constraints
- No firewall changes without Chris
- No inbox access without Chris
- Claude usage requires explicit approval

### 3) Operating Loop
- Spec first
- Held-out scenarios
- Task chunking
- Developer/Tester separation
- Iterative validation

### 4) Governance
- Model + burn stats in message prefix
- Traceability for outputs
- Approval gates for sensitive actions

### 5) Measurement
- Token forecast vs actual per chunk
- Scenario pass rates
- Rework rate
- Delivery throughput

## Intent Contracts (Practical)
Each capability should define:
- Objective
- Autonomy level (draft-only / approve-before-act / autonomous)
- Allowed tools/actions
- Required evidence
- Exit criteria
- Escalation conditions

## Anti-Patterns
- Vague goals with no success criteria
- Silent autonomy expansion
- "Done" without test evidence
- Overfit taxonomy/process overhead
- No post-hoc review loop

## Minimal Intent Template

```md
## Intent
- Objective:
- Why now:
- Success criteria:

## Boundaries
- Allowed:
- Approval required:
- Forbidden:

## Execution Plan
- Chunk 1:
- Chunk 2:
- Chunk 3:

## Validation
- Functional checks:
- Held-out scenarios:
- Pass threshold:

## Transparency
- Inputs used:
- Assumptions:
- Confidence:
- Risks:
```

## Adoption Plan
1. Apply this template to all new P1 capability work
2. Add intent block to Decision Desk and Sprint Picker outputs
3. Review weekly: where intent was clear vs where drift occurred

---

Intent engineering is how we turn AI from "clever output" into a reliable teammate with understandable behavior.
