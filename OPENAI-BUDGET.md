# OPENAI-BUDGET.md

## OpenAI Token Budget & Proposal System

**Status:** OpenAI ChatGPT Plus tokens are **fully allocated to Oscar** (me) for autonomous work.

Chris retains approval authority - I propose, he approves.

## ChatGPT Plus Quota Limits

**Session limits:**
- GPT-4o: ~150 messages per 3-hour window
- o3-mini: ~100 messages per week  
- o4-mini: ~300 messages per day

**Current usage tracking:** `openclaw models status` shows real-time quota

**Actual limits discovered:**
- 5-hour window: ~2.87M tokens estimated (resets rolling)
- Daily quota: Separate limit, much higher (barely touched at 1% after 86k tokens)
- Token capacity is ~14x larger than Claude's 200k context window

## Budget Philosophy

**Primary goal:** Use tokens productively on high-value work aligned with Chris's goals.

**Priorities:**
1. **Career/income work** - Zoetis automation, PD consulting prep, skill development
2. **Project support** - Telemetry analyzer docs, protocol analyzer research
3. **Learning/research** - AI development techniques, new frameworks, best practices
4. **Workspace optimization** - Documentation, organization, automation
5. **Creative/experimental** - Only when all else is done

## Proposal Workflow

**Daily proposals (part of morning brief):**
- Review backlog and suggest 2-3 high-priority tasks
- Estimate token usage (low/medium/high)
- Wait for approval before executing

**Ad-hoc proposals:**
- When I identify urgent/timely work
- When Chris asks "what should we work on?"
- Format: Brief description + estimated tokens + expected output

**Auto-approved categories (standing permission):**
- Responding to Chris's direct requests
- Emergency/time-sensitive research
- Small documentation updates (<500 tokens estimated)

## Usage Tracking

**Location:** `memory/openai-usage-tracking.json`

**Logged data:**
- Timestamp of work sessions
- Task description
- Estimated tokens used
- Quota percentages (when available)
- Output produced

**Review cadence:**
- Daily check during morning brief
- Weekly retrospective on token efficiency

## Current Work Queue

**Active (running now):**
1. RAG Evaluation Framework research
2. Body cam transcript analysis research  
3. Telemetry visualization guide
4. Creative technical content generation

**Backlog (from QUOTA-BACKLOG.md):**
- Protocol analyzer RAG system deep dive
- Zoetis automation brainstorming
- Career strategy research
- New Orleans trip planning
- AI framework learning

## Token Efficiency Goals

**Measure success by:**
- Value produced per token (not just volume)
- Alignment with Chris's stated goals
- Reusability of output (docs that get referenced)
- Learning that compounds (skills that transfer)

**Avoid:**
- Busywork just to burn tokens
- Duplicate research Chris already did
- Content nobody will ever read
- Overly generic advice (aim for specific/actionable)

---

**Last Updated:** 2026-02-25  
**Next Review:** Tomorrow's morning brief
