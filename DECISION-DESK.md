# Decision Desk v1 (Spec)

## Goal
Turn rough ideas into structured decision records that are easy to review, compare, and revisit.

## Output Format (Decision Record)
Each record includes:
1. **Context** (what triggered this)
2. **Problem Statement**
3. **Decision to Make**
4. **Options Considered** (A/B/C)
5. **Pros / Cons per option**
6. **Recommendation**
7. **Confidence (Low/Med/High)**
8. **Risks / Unknowns**
9. **Validation Scenarios** (held-out)
10. **Approval Status** (Proposed / Approved / Rejected / Deferred)
11. **Next Action + Owner + Due window**

## Workflow (Chunked)

### Step 1 — Intake (small)
Input can be a rough message/voice dump.
I normalize it into Problem + Decision + Constraints.

### Step 2 — Draft Record (small)
I generate a first draft with 2-4 options max.

### Step 3 — Held-Out Scenarios (test design)
I generate usage/test scenarios in a separate section/file.
These are not used while drafting the recommendation logic.

### Step 4 — Review Gate (human)
Chris reviews and can request edits before approval.

### Step 5 — Actionization
Approved decision gets translated into backlog/task items.

## Quality Rules
- Prefer concrete over generic
- Keep options mutually exclusive when possible
- Include one “do nothing” option when useful
- Surface assumptions explicitly
- Keep records short enough to scan in <3 minutes

## v1 Scope
- Manual invocation in chat
- Markdown records stored in workspace
- Human approval required before execution

## v2 Ideas (later)
- Tagging + index file
- Auto-link to backlog items
- Weekly decision review summary
