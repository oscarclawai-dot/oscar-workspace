# QUOTA-TRACKING.md

## How This Works

**Your part:**
- When convenient, send me your current usage numbers from claude.ai/settings/usage
- Just say "quota update" and give me the 3 numbers: session %, all models %, sonnet %
- Or send a screenshot like you just did

**My part:**
- Track usage over time in `memory/claude-usage-tracking.json`
- Calculate weekly burn rate and project end-of-week utilization
- **Proactively suggest work** when usage is low and we're at risk of wasting quota
- Remind you on reset days (Sat 8 AM, Sun 2 PM) to plan heavy work

## Weekly Reset Schedule

- **Saturday 8:00 AM** - Sonnet quota resets (good time for heavy Sonnet work)
- **Sunday 2:00 PM** - All models quota resets (good time for Opus work)

## Utilization Goals

**Target:** Use 85-90% of weekly quotas before reset
- Anything below 80% by mid-week = I should suggest productive work
- Below 50% by Thursday = definite action needed

## Quick Update Format

When you want to feed me numbers, just say:

```
quota update
session: 44%
all: 15%
sonnet: 14%
```

Or send a screenshot. I'll log it and let you know if we're on track or need to burn tokens.

## Token-Burning Task Backlog

When we're low on usage, I can suggest:

**High-value work (aligned with your goals):**
- Generate documentation for telemetry analyzer
- Research for protocol analyzer RAG system
- Code reviews for projects
- Career strategy analysis
- Learning/mentorship on AI development topics

**Medium-value work:**
- Organize workspace documentation
- Research PD consulting opportunities
- Brainstorm Zoetis automation ideas
- Plan New Orleans trip with Lily

**Low-priority token burners (only if desperate):**
- Generate creative content (stories, etc.)
- Deep research on random interesting topics
- Batch process old emails/notes

## Proactive Monitoring

**Daily Morning Brief (7-10 AM):**
- Weather for Kalamazoo
- **Quota status:** On pace / Behind / Ahead for 85% target
- Upcoming events (when calendar integrated)

**Notification Cadence:**
- **Mon-Wed:** Once/day (morning brief)
- **Thu-Fri (if below 60%):** Escalate to **2x/day** (morning + evening ~6-8 PM)
- **Sat 8 AM:** Sonnet quota reset reminder
- **Sun 2 PM:** All models reset reminder

**Weekly Pacing Expectations:**
- Monday/Tuesday: ~25-35% used
- Wednesday: ~45-55% used  
- Thursday: ~60-70% used
- Friday: ~75-85% used

**Alert Thresholds:**
- Below 20% on Tuesday: "Behind pace"
- Below 35% on Wednesday: "Behind pace - pick it up"
- Below 50% on Thursday: "ALERT - wasting tokens"
- Below 65% on Friday: "URGENT - burn today or lose them"

## Current Status

Last snapshot: **Feb 25, 9:20 AM**
- Session: 44% (2h 47m remaining)
- All models: 15% (resets Sun 2 PM) - **85% unused**
- Sonnet only: 14% (resets Sat 8 AM) - **86% unused**

**Status:** Plenty of quota available. No urgent action needed. You have massive headroom for the rest of the week.

---

*This tracking system ensures we maximize value from your $100+/month Claude Max subscription by using quota before it expires weekly.*
