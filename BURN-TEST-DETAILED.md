# DETAILED Claude Max Burn Test Plan

**Created:** 2026-02-24, 6:17 PM EST  
**Goal:** Max out ONE 5-hour session to understand quota relationships  
**Duration:** 30-60 minutes estimated

---

## Current Baseline (before test)

**From Chris's screenshot (~3:00 PM):**
- Current session: 0%
- Weekly "All models": 8%
- Weekly "Sonnet only": 9%

**Token tracking capability:** ✅ YES
- Session file: `~/.openclaw/agents/main/sessions/36c6e4ee-57f4-40ac-834f-e6e1afe379f0.jsonl`
- Can extract: timestamp, input tokens, output tokens, total tokens, cache reads
- Example since 6:00 PM EST: ~5,850 tokens used in 15 minutes

---

## Test Methodology

### Step 1: Record Starting State (5 minutes)
**Actions:**
1. Screenshot Claude usage page (claude.ai/settings/usage)
2. Record exact percentages:
   - Current session: ___%
   - Weekly "All models": ___%
   - Weekly "Sonnet only": ___%
3. Note timestamp
4. Save baseline token count from session file

### Step 2: Burn Session with Sonnet Only (30-45 minutes)
**Model:** Claude Sonnet 4.5 (anthropic/claude-sonnet-4-5)  
**Strategy:** Generate long-form, useful content continuously

**Tasks (in order):**

1. **Telemetry Analyzer Documentation** (10-15 min)
   - Generate comprehensive feature documentation
   - User guides for each analysis type
   - API documentation
   - Architecture deep-dive
   
2. **Protocol Analyzer Technical Spec** (10-15 min)
   - Detailed design document
   - PDF parsing workflow documentation
   - AI extraction methodology
   - RAG system architecture

3. **AI Development Learning Materials** (10-15 min)
   - RAG systems deep-dive
   - Fine-tuning vs prompt engineering comparison
   - Agent framework survey
   - Local LLM deployment guide

4. **Code Review & Analysis** (if needed for more tokens)
   - Telemetry analyzer architecture review
   - Protocol analyzer optimization suggestions
   - Security audit recommendations

**Monitoring:**
- Check usage page every 10 minutes
- Track current session percentage
- Stop when current session reaches 95-100%

### Step 3: Record Ending State (5 minutes)
**Actions:**
1. Screenshot Claude usage page immediately after hitting ~100%
2. Record exact percentages:
   - Current session: ___%
   - Weekly "All models": ___%
   - Weekly "Sonnet only": ___%
3. Note timestamp
4. Save final token count from session file

### Step 4: Calculate Relationships (5 minutes)
**Metrics to calculate:**

```
Session burn = 100% - starting session %

Weekly "All models" increase = ending % - starting %
Weekly "Sonnet only" increase = ending % - starting %

Ratio 1 = (All models increase) / Session burn
Ratio 2 = (Sonnet only increase) / Session burn

Are Ratio 1 and Ratio 2 equal? 
- If YES → Overlapping pools (Sonnet counts toward both)
- If NO → Separate allocations (need to understand why)
```

**Token analysis:**
```
Total tokens consumed = final count - starting count
Tokens per 1% of session = total tokens / session burn %
Estimated tokens for full week = tokens per 1% * 100 * (100 / weekly increase %)
```

---

## Data Collection Template

### Before Test
```
Timestamp: _____________
Current session: ___%
Weekly "All models": ___%
Weekly "Sonnet only": ___%
Session tokens: _____________
```

### During Test (every 10 minutes)
```
Time: _____ | Session: ___% | All: ___% | Sonnet: ___% | Tokens: _______
Time: _____ | Session: ___% | All: ___% | Sonnet: ___% | Tokens: _______
Time: _____ | Session: ___% | All: ___% | Sonnet: ___% | Tokens: _______
```

### After Test
```
Timestamp: _____________
Current session: ___%
Weekly "All models": ___%
Weekly "Sonnet only": ___%
Session tokens: _____________
```

### Calculations
```
Session burned: _____% (100% - start)
All models increased: _____% (end - start)
Sonnet only increased: _____% (end - start)

Ratio (All / Session): _____
Ratio (Sonnet / Session): _____

Tokens consumed: ___________
Tokens per 1% session: ___________
Estimated weekly capacity: ___________ tokens
```

---

## Questions This Will Answer

1. **Does Sonnet usage count toward both weekly trackers?**
   - If "All models" and "Sonnet only" increase by same amount → YES

2. **What percentage of weekly quota is one full session?**
   - If one session (100%) = 5% of weekly → 20 sessions per week max
   - If one session (100%) = 10% of weekly → 10 sessions per week max

3. **Why does "Sonnet only" exist separately?**
   - Possibly: Different limits for Sonnet vs other models
   - Possibly: Overlapping quotas (Sonnet has both session AND weekly limit)
   - Possibly: Haiku/Opus have separate allocation

4. **How many tokens can Chris use per week?**
   - Based on session burn, calculate total weekly capacity

5. **What's the relationship between 5-hour window and weekly quota?**
   - Do they reset independently?
   - Is the 5-hour window a sub-limit of the weekly?

---

## Success Criteria

✅ **Minimum Success:**
- Burn current session to 100%
- Record before/after percentages for both weekly trackers
- Calculate relationship between session and weekly quotas

✅ **Full Success:**
- All of above PLUS
- Token count data from session logs
- Understand why "Sonnet only" tracker exists
- Estimate total weekly token capacity
- Clear documentation for future reference

---

## Risk Assessment

**Risks:** None! This is safe testing.
- Won't exceed weekly quota (only using one session's worth)
- All work is productive (useful documentation)
- Can stop anytime if needed
- Extra usage safety net is enabled ($15/month buffer)

**Mitigation:**
- Generate genuinely useful content (not spam)
- Save all documentation for future use
- Track metrics carefully for accurate analysis

---

## Post-Test Actions

1. Update TOKEN-STRATEGY.md with findings
2. Document quota relationships in BURN-TEST-RESULTS.md
3. Adjust weekly planning based on actual capacity
4. Decide if current usage (10-15%) is acceptable or needs optimization

---

## Ready to Execute?

**Prerequisites:**
- [x] Chris approves this detailed plan
- [ ] Take starting screenshot
- [ ] Record baseline metrics
- [ ] Begin burn test

**Estimated timeline:**
- Setup: 5 minutes
- Burn: 30-45 minutes  
- Analysis: 5-10 minutes
- **Total: 40-60 minutes**

---

## Notes

- Using Sonnet only (not Haiku/Opus) to keep test clean
- All generated content will be saved and useful
- Tracking via both Claude UI and session log files
- Chris can monitor progress via usage page screenshots
- Can abort test anytime if needed

---

**Status:** PENDING APPROVAL

Reply with GO when ready to start!
