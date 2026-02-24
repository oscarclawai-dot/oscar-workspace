# Token Usage Strategy & Tracking

**Goal:** Maximize value from Claude Max and OpenAI subscriptions by tracking usage and ensuring we use all available tokens each week.

---

## Current Subscriptions

### Claude Max Plan
**Cost:** $100+/month per seat  
**Your tier:** Max (tier TBD - appears to be 5x based on usage patterns)

**Two separate weekly quotas (as of Feb 24, 2026 baseline):**

1. **Sonnet only:**
   - Weekly reset: **Saturday 8:00 AM**
   - Baseline (Mon evening): **8% used**
   
2. **All models:**
   - Weekly reset: **Sunday 2:00 PM**  
   - Baseline (Mon evening): **7% used**

**5-hour rolling window:**
- Current session: 21% used (resets in 45 min at time of baseline)
- This is the short-term rate limit

**Extra usage safety net:**
- ✅ Enabled
- Monthly limit: $15
- Current spend: $1.21 (8% of monthly extra limit)
- Balance: $99.85 with auto-reload

**Shared usage:** claude.ai + Claude Code (CLI) + OpenClaw API usage all count against same quota

**❓ UNKNOWN:** How do the two weekly quotas interact?
- Does Sonnet usage count toward BOTH quotas?
- Or is "All models" actually Haiku + Opus only?
- Need to run burn test to figure this out (see below)

### OpenAI ChatGPT Plus
**Cost:** $20/month

**Limits (2026):**
- **GPT-4o:** ~150 messages per 3-hour window
- **o3 (reasoning):** ~100 messages per week
- **o4-mini:** ~300 messages per day
- **Rolling windows** - not hard weekly caps, but 3-hour windows

**Reset schedule:**
- 3-hour rolling windows for GPT-4o
- Weekly reset for o3
- Daily reset for o4-mini

---

## Usage Tracking System (TO BUILD)

### What we need to track:

**For Claude Max:**
1. Messages sent per 5-hour window
2. Weekly total usage
3. Current tier (5x or 20x)
4. Weekly reset day/time
5. Usage across all surfaces (OpenClaw, claude.ai, Claude Code)

**For OpenAI:**
1. GPT-4o messages per 3-hour window
2. o3 messages per week
3. o4-mini messages per day
4. Which model was used for each task

### Tracking file:
Create `TOKEN-USAGE.json` or similar to log:
- Timestamp
- Model used
- Approximate message/token count
- Rolling window totals
- Weekly totals

---

## Optimization Strategy

### Tier 1: Essential work (always prioritized)
- Career strategy discussions (high value, use Claude Sonnet/Opus)
- Code review for telemetry project (Claude Sonnet)
- Critical work tasks (protocol analyzer, PD projects)
- Important research and learning

### Tier 2: Productive work (use available tokens)
- Documentation writing
- Learning new AI/dev techniques
- Exploring new tools and frameworks
- Code refactoring and optimization
- Memory organization and cleanup

### Tier 3: Token usage optimization (if quota left at end of week)
- Batch process backlog items
- Generate documentation for projects
- Create training materials
- Explore "nice to have" features
- Deep dives on technical topics
- Pre-research for upcoming projects

### Model assignment strategy:
**Claude Haiku (cheap):**
- File operations
- Git commits
- Simple edits
- Heartbeats
- Todo updates

**Claude Sonnet (mid-tier, your current default):**
- Normal conversations
- Code review
- Strategy discussions
- Most daily work

**Claude Opus (expensive):**
- Really hard problems
- Critical decisions
- When Sonnet gives mediocre answers

**OpenAI GPT-4o:**
- Alternative for some tasks
- Load balancing when Claude quota is tight
- Second opinions on architecture/design

**OpenAI o3 (reasoning, weekly limit):**
- Complex reasoning problems
- Math-heavy analysis
- Multi-step logical problems
- Save for hardest problems only

**Local LLM (if we set one up on Z8):**
- Heartbeats (free)
- File monitoring
- Repetitive tasks
- Anything that doesn't need top-tier reasoning

---

## Weekly Review Process (TO IMPLEMENT)

**Every Monday morning (or your preferred day):**
1. Check previous week's usage
2. How much quota did we use vs available?
3. Any unused capacity we should have utilized?
4. Plan the week's work based on available quota

**Mid-week check-in (Wednesday or Thursday):**
1. Are we on track to use our quota?
2. Any backlog items we should batch process?
3. Adjust priorities if needed

**Friday/weekend:**
1. If quota still available, identify productive uses:
   - Generate documentation
   - Research topics on backlog
   - Explore new tools/frameworks
   - Deep-dive technical learning

---

## Burn Test Plan (Understanding Quota Mechanics)

**Goal:** Map out exactly how the two weekly quotas work and interact.

**Current baseline (Mon Feb 24, evening):**
- Sonnet only: 8% used (resets Sat 8 AM)
- All models: 7% used (resets Sun 2 PM)
- 5-hour window: 21% used

### Test Design

**Phase 1: Sonnet burn (2-3 hours)**
- Use Sonnet exclusively for a batch of work
- Tasks: Generate documentation, code analysis, research summaries
- Track percentages before/after
- **Hypothesis:** Sonnet usage increments BOTH "Sonnet only" AND "All models"

**Phase 2: Haiku test (30 min)**
- Switch to Haiku for simple tasks
- File operations, simple edits, etc.
- Track percentages before/after
- **Hypothesis:** Haiku increments "All models" but NOT "Sonnet only"

**Phase 3: Hit a limit (optional)**
- If we're willing, push one quota to 100%
- See what happens - does it switch to extra usage?
- How much does extra usage cost per message?
- Can we still work while in extra usage mode?

**Metrics to track:**
1. Screenshot usage page before starting
2. After each phase, screenshot again
3. Note exact tasks performed and approximate message count
4. Calculate $/message for extra usage if we hit it

**Productive work to do during burn test:**
- Generate comprehensive docs for telemetry analyzer
- Create training materials for protocol analyzer
- Research AI development topics for learning
- Code review and analysis
- Pre-write content for future use

**Timeline options:**
- **This week:** Run test before Saturday's Sonnet reset
- **Next week:** Wait for clean slate after both quotas reset (Sun 2 PM)
- **Ongoing:** Just track naturally and analyze patterns over time

### Questions the burn test will answer:

1. Do Sonnet messages count against both quotas or just one?
2. What happens when we hit 100% of a weekly quota?
3. Does it gracefully switch to extra usage?
4. What's the cost per message in extra usage mode?
5. Are the percentages linear or do they change behavior at certain thresholds?
6. Can we work normally in extra usage or are there restrictions?

---

## Questions to Answer

1. **What's your Claude Max tier?** (5x or 20x)
2. **When does your weekly quota reset?** (day/time)
3. **Do you want daily usage reports?** Or just weekly summary?
4. **Priority projects for token allocation?**
   - Telemetry analyzer development
   - Protocol analyzer at work
   - PD consulting projects
   - Personal learning/development

5. **Should we set up local LLM on Z8?** (Would save tokens for low-priority tasks)

6. **OpenAI API access?** You have ChatGPT Plus - do you also have API access or just the web interface?

---

## Next Steps

1. **Verify your Claude Max tier and reset schedule**
2. **Build usage tracking system** (log file or simple script)
3. **Create weekly review routine** (automated or manual)
4. **Identify backlog of "good to have" tasks** that can soak up unused tokens
5. **Decide on local LLM setup** for Z8 workstation
6. **Configure OpenAI integration** in OpenClaw (if desired)

---

## Notes

- You're paying $120+/month for these subscriptions - should extract maximum value
- **Current utilization: ~7-8% on Monday evening** = projected 10-15% weekly usage
- That means ~$90/month in unused Claude Max capacity 😬
- Unused tokens = wasted money
- Having a backlog of productive tasks ready means we can always find something worthwhile to do with available capacity
- Balance between "using all tokens" and "not creating busywork" - focus on genuinely useful output

### Baseline measurement (Feb 24, 2026)
- **Time:** Monday evening
- **Sonnet only:** 8% used (resets Sat 8 AM)
- **All models:** 7% used (resets Sun 2 PM)  
- **5-hour window:** 21% used
- **Extra usage this month:** $1.21 (8% of $15 limit)

This gives us a reference point for tracking future usage and optimization efforts.
