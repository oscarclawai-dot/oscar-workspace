# Work Sprint Picker (15/30/60) — v1

## Purpose
When Chris has limited time, propose 3 focused options sized to available time with clear outputs.

## Input
- Time budget: 15 / 30 / 60 minutes
- Energy level (optional): low / normal / high
- Context (optional): work / personal / mixed

## Output Format
For each sprint option:
1. **Task name**
2. **Why now** (1 sentence)
3. **Exact deliverable**
4. **Definition of done**
5. **Confidence** (Low/Med/High)

## Sizing Rules

### 15-minute sprints
- One micro-deliverable only
- No external dependencies
- Example outputs: update one doc section, draft one message, classify 5 backlog items

### 30-minute sprints
- One focused deliverable
- Light research or one artifact
- Example outputs: mini brief, decision record, scoped task list

### 60-minute sprints
- One primary + one support deliverable
- Includes quick validation pass
- Example outputs: doc + scenario checks, research memo + prioritized actions

## Constraints
- Prefer high-value backlog items first
- Avoid external sends/actions unless explicitly approved
- Keep all outputs in markdown files for review

## Candidate Sprint Library (Current)

### 15 min
- Triage top 5 backlog items by impact/effort
- Draft one Decision Desk record from latest idea
- Update OPS-LOG summary from latest findings

### 30 min
- Create capability comparison table for one topic
- Produce AI harness micro-brief (1 pattern + 3 actions)
- Build one reusable template (decision/spec/test scenario)

### 60 min
- Produce curated AI harness digest + actionable tasks
- Draft telemetry mini-spec with acceptance criteria
- Build and validate one process doc (spec + held-out scenarios)

## Auto-Selection Heuristic
1. Choose highest value item in This Week Focus
2. Prefer unfinished work already started
3. Minimize context switching
4. Return 3 options sorted by expected value
