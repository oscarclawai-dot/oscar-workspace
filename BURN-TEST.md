# Claude Max Burn Test - Understanding Quota Mechanics

**Created:** 2026-02-24  
**Status:** Ready to execute  
**Goal:** Map exactly how Claude Max's two weekly quotas work

---

## The Mystery

Claude Max shows two separate weekly quotas:
1. **Sonnet only** - resets Saturday 8:00 AM
2. **All models** - resets Sunday 2:00 PM

**Question:** Does using Sonnet decrement BOTH counters? Or is "All models" for Haiku+Opus only?

---

## Baseline (Before Test)

**Captured:** Monday Feb 24, evening

| Quota | Current % | Resets |
|-------|-----------|--------|
| Sonnet only | 8% | Sat 8 AM |
| All models | 7% | Sun 2 PM |
| 5-hour window | 21% | Rolling |

**Extra usage:** $1.21 spent ($15 monthly limit)

---

## Test Plan

### Phase 1: Pure Sonnet Burn (2-3 hours)

**Tasks to perform:**
1. Generate comprehensive documentation for telemetry analyzer
2. Create detailed technical explainers for AI concepts
3. Code review and analysis of existing projects
4. Research summaries on AI development topics
5. Pre-write content/responses for future use

**What to track:**
- Screenshot before starting
- Note message count (estimate)
- Screenshot after Phase 1
- Calculate: How much did each quota increase?

**Expected outcome:**
- Hypothesis: Both "Sonnet only" and "All models" increase
- If true: They're overlapping quotas
- If false: They're separate pools

### Phase 2: Haiku Test (30 min)

**Tasks to perform:**
1. Batch file operations
2. Simple code edits
3. Git commit messages
4. Todo list updates
5. Memory file organization

**What to track:**
- Screenshot before Phase 2
- Note message count
- Screenshot after Phase 2
- Calculate: Which quota increased?

**Expected outcome:**
- Hypothesis: Only "All models" increases, not "Sonnet only"
- This would confirm "All models" = combined usage of all model types

### Phase 3: Hit the Limit (Optional)

**Only if willing to pay for extra usage:**

Continue with productive work until we hit 100% of one quota.

**What to observe:**
1. Does it automatically switch to extra usage?
2. Any warning messages?
3. What's the $/message cost in extra mode?
4. Any degradation in response quality/speed?
5. Can we continue working normally?

---

## Productive Work Ideas (For Burn Test)

### Documentation Generation
- [ ] Complete technical docs for telemetry analyzer features
- [ ] Write user guides for protocol analyzer
- [ ] Create onboarding docs for PD consulting projects
- [ ] Generate API documentation
- [ ] Write technical blog posts (draft)

### Code Analysis & Review
- [ ] Deep review of telemetry analyzer architecture
- [ ] Analyze protocol analyzer for optimization opportunities
- [ ] Review and document coding patterns/best practices
- [ ] Security audit of existing code

### Learning & Research
- [ ] Comprehensive notes on RAG systems
- [ ] Deep dive: Fine-tuning vs prompt engineering
- [ ] Survey of AI agent frameworks
- [ ] Research: Local LLM deployment strategies
- [ ] Anthropic/OpenAI feature comparisons

### Content Pre-Generation
- [ ] Create template responses for common questions
- [ ] Generate code snippets library
- [ ] Write technical explanations for complex topics
- [ ] Pre-draft messages/emails for upcoming projects

---

## Results Template

### Phase 1 Results: Sonnet Burn

**Before:**
- Sonnet only: ___%
- All models: ___%
- 5-hour window: ___%

**Work performed:**
- Task 1: [description]
- Task 2: [description]
- ...
- Estimated messages: ___

**After:**
- Sonnet only: ___% (Δ: +___%)
- All models: ___% (Δ: +___%)
- 5-hour window: ___% (Δ: +___%)

**Conclusion:**
[Does Sonnet count toward both? What's the relationship?]

### Phase 2 Results: Haiku Test

[Same template as Phase 1]

### Phase 3 Results: Hit the Limit

[If executed]

**Extra usage observations:**
- Cost per message: $___
- Total extra spent: $___
- Performance changes: [none/degraded/etc]
- User experience: [seamless/warning shown/blocked/etc]

---

## Final Analysis

### Quota Relationship

[To be filled after test]

- **Sonnet usage:** Counts toward [Sonnet only / All models / both]
- **Haiku usage:** Counts toward [All models only / separate pool]
- **Opus usage:** [TBD - not tested]

### Utilization Strategy

Based on test results:

[Recommendations for how to allocate work across models to maximize value]

---

## Timeline

**Option 1: This week (before Saturday reset)**
- Pro: Immediate learning
- Con: Less than a week of clean data

**Option 2: Next week (after Sunday reset)**  
- Pro: Start from 0% on both quotas
- Con: Delay of several days

**Option 3: Gradual observation**
- Pro: No dedicated burn time needed
- Con: Takes longer to gather data

---

## Decision

**Selected timeline:** [TBD]

**Approved by:** Chris

**Execute burn test:** [Yes/No/When]
