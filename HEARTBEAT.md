# HEARTBEAT.md

## Daily Morning Brief (Check once between 7-10 AM)

1. **Weather** - Kalamazoo forecast for today

2. **Claude Quota Status** - Read last snapshot from memory/claude-usage-tracking.json
   - Calculate: Are we on pace for 85% utilization by reset?
   - Monday-Wednesday: Daily check-in
   - Thursday+: If below 60% utilization, escalate to 2x/day (morning + evening)
   - Report: "On pace" / "Behind pace" / "Need to burn tokens"

3. **OpenAI Status & Proposals**
   - Run `openclaw models status` to get current quota
   - Read memory/openai-usage-tracking.json for work history
   - Report yesterday's work completed
   - Propose 2-3 high-priority tasks from OPENAI-BUDGET.md backlog
   - Estimate token usage (low/medium/high)
   - Wait for approval before executing

4. **Calendar** - Check for upcoming events next 48h (when calendar integrated)

## Quota Check Logic

**Monday/Tuesday:** 
- Expected: ~25-35% weekly usage
- Below 20%: "We're behind pace"
- Above 40%: "We're ahead of pace"

**Wednesday:**
- Expected: ~45-55% weekly usage  
- Below 35%: "We're behind pace - need to pick up"
- Above 60%: "We're ahead of pace"

**Thursday:**
- Expected: ~60-70% weekly usage
- Below 50%: "ALERT: We're wasting tokens - need task backlog"
- If below 60%: Escalate to 2x/day notifications

**Friday:**
- Expected: ~75-85% weekly usage
- Below 65%: "URGENT: Burn tokens today or lose them"
- Suggest autonomous tasks from backlog

**Saturday morning (after Sonnet reset):**
- Sonnet quota just refreshed - suggest heavy Sonnet work if available

**Sunday afternoon (after All Models reset):**
- All models quota refreshed - good time for Opus work
