# Capability Matrix (Draft v1)

Date: 2026-02-26
Owner: Oscar

## Scoring Model (1-5)
- **Difficulty**: 1 = trivial, 5 = hard
- **Value**: 1 = low, 5 = very high
- **Frequency**: 1 = rare, 5 = daily/high-repeat
- **Time-to-Value**: 1 = long ramp, 5 = immediate
- **Reliability Risk**: 1 = low risk, 5 = high fragility
- **Maintenance Load**: 1 = low upkeep, 5 = high upkeep

### Priority Score
`Priority = (Value*0.35 + Frequency*0.25 + Time-to-Value*0.20 + (6-Difficulty)*0.10 + (6-Risk)*0.05 + (6-Maintenance)*0.05) * 20`

---

## Scored Capabilities

| Capability | Difficulty | Value | Frequency | Time-to-Value | Risk | Maint. | Priority /100 | Notes |
|---|---:|---:|---:|---:|---:|---:|---:|---|
| Morning Daily Briefing | 2 | 5 | 5 | 5 | 2 | 2 | **93** | Already in motion; highest leverage daily loop |
| Email Triage + Summaries + TODO extraction | 3 | 5 | 5 | 4 | 3 | 3 | **84** | Strong downtime use; direct executive-assistant value |
| Overnight Autonomous Work Queue | 3 | 5 | 4 | 4 | 3 | 3 | **80** | Fits current backlog architecture perfectly |
| Project Research + Task Breakdown | 2 | 5 | 4 | 5 | 2 | 2 | **90** | Directly aligned to software-factory workflow |
| YouTube Summarizer via Cron | 2 | 4 | 4 | 5 | 2 | 2 | **84** | Easy to launch; excellent learning compression |
| Hacker News / Feed Curation | 2 | 4 | 4 | 5 | 2 | 2 | **84** | Quick signal pipeline for AI/dev topics |
| Calendar Management via Chat | 3 | 5 | 4 | 4 | 3 | 3 | **80** | High utility once calendar auth is wired |
| Expense/Receipt Tracking | 3 | 4 | 3 | 4 | 3 | 3 | **71** | Useful ops hygiene; less strategic than research stack |
| Multi-Agent Coding Pipeline | 5 | 5 | 4 | 2 | 4 | 4 | **64** | Huge upside, but more orchestration complexity |
| Car Negotiation / Shopping Automation | 4 | 3 | 1 | 2 | 4 | 4 | **41** | High novelty, episodic usage |
| Shared Memory Between Instances | 4 | 3 | 2 | 2 | 4 | 4 | **44** | Valuable later; defer until core loops stable |
| Dedicated Accounts (already done pattern) | 2 | 5 | 3 | 5 | 2 | 2 | **83** | Foundation capability; keep hardening/security |

---

## Recommended Execution Order

### Phase 1 (This Week) — Fastest ROI
1. Morning Daily Briefing (enhance with “what to read” + quote)
2. Project Research + Task Breakdown template
3. Email Triage + action extraction
4. HN/Feed Curation
5. YouTube Summarizer cron

### Phase 2 (This Month) — Workflow Deepening
6. Overnight Autonomous Work Queue
7. Calendar Management via Chat
8. Expense/Receipt Tracking

### Phase 3 (Later) — Advanced System Design
9. Multi-Agent Coding Pipeline
10. Shared Memory Between Instances
11. Car negotiation automation (on-demand)

---

## Implementation Notes (Oscar + Chris)
- Keep each capability as a **small, testable service loop** (input → transform → deliverable).
- Favor **high-frequency habits** over one-off wow demos.
- Ship with **approval gates** for any external actions (email/calendar/negotiation).
- Attach each capability to a backlog card with: owner, trigger, output format, rollback plan.
