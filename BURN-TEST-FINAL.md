# REVISED BURN TEST PLAN — Multi-Model Quota Mapping

**Created:** 2026-02-24, 6:28 PM EST  
**Author:** Chris Itterly  
**Goal:** Hit 100% session limit while determining the relationship between "Sonnet only" and "All models" weekly bars by switching models mid-session.

**Core Question Oscar's original plan couldn't answer:** Does using Opus/Haiku move the "Sonnet only" bar? We need model switching to find out.

---

## SETUP (5 min)

- Screenshot claude.ai/settings/usage
- Record: Session %, All Models %, Sonnet Only %
- Record session token count from log file
- Note timestamp

---

## PHASE 1: Sonnet Burn (target ~40% session)

**Model:** claude-sonnet-4-5  
**Useful work:**
- Telemetry Analyzer full documentation (feature docs, user guides, API reference)
- Protocol Analyzer technical spec (parsing workflow, AI extraction methodology)

**At end of phase:** Screenshot usage page, record all three bars + token count

---

## PHASE 2: Opus Burn (target ~40% session)

**Model:** claude-opus-4-5  
**Useful work:**
- Architecture review & optimization recommendations for both projects
- Security audit of protocol analyzer
- RAG system deep-dive & design recommendations

**At end of phase:** Screenshot usage page, record all three bars + token count

**KEY OBSERVATION:** Did "Sonnet only" stay flat while "All models" increased? Log this clearly.

---

## PHASE 3: Finish the Session (~20% remaining)

**Model:** Whichever has more interesting results so far (or split between Haiku and Sonnet)  
**Useful work:**
- AI development learning materials (fine-tuning vs prompting, agent frameworks, local LLM guide)
- Any remaining documentation gaps

**At end of phase:** Screenshot usage page, record all three bars + token count

---

## MONITORING — Record at every phase boundary:

```
Time | Model Used | Session % | All Models % | Sonnet % | Tokens Since Last
_____|____________|___________|______________|__________|___________________
```

---

## ANALYSIS

For each phase, calculate:
- Tokens consumed
- Session % increase
- All Models % increase
- Sonnet Only % increase

Then answer:
1. **Does Opus move "Sonnet only"?** If NO → separate pools. If YES → overlapping.
2. **Do different models burn session % at different rates per token?** (Opus may cost more)
3. **What's the ratio of session % to weekly %?** → How many sessions per week?
4. **Total estimated weekly token capacity per model**

---

## RULES FOR OSCAR

- Keep token volume roughly comparable between Phase 1 and Phase 2
- Log EXACT model used for every request
- All generated content must be saved — no throwaway work
- Screenshot at every phase transition, not just start/end
- If session limit is hit early, that's fine — record everything and stop

---

## Status: GO when ready.

---

## Data Collection Template

### SETUP
```
Timestamp: _____________
Current session: ___%
Weekly "All models": ___%
Weekly "Sonnet only": ___%
Session tokens: _____________
```

### PHASE 1 END (Sonnet)
```
Timestamp: _____________
Current session: ___%
Weekly "All models": ___%
Weekly "Sonnet only": ___%
Session tokens: _____________
Tokens this phase: _____________
```

### PHASE 2 END (Opus)
```
Timestamp: _____________
Current session: ___%
Weekly "All models": ___%
Weekly "Sonnet only": ___%
Session tokens: _____________
Tokens this phase: _____________
🔍 DID "SONNET ONLY" STAY FLAT? _____
```

### PHASE 3 END (Final)
```
Timestamp: _____________
Current session: ___%
Weekly "All models": ___%
Weekly "Sonnet only": ___%
Session tokens: _____________
Tokens this phase: _____________
Model(s) used: _____________
```

---

## Calculations & Findings

### Phase 1 (Sonnet):
- Session increase: ____%
- All models increase: ____%
- Sonnet only increase: ____%
- Tokens consumed: _______

### Phase 2 (Opus):
- Session increase: ____%
- All models increase: ____%
- Sonnet only increase: ____ (EXPECTED: 0% if separate pools)
- Tokens consumed: _______

### Phase 3 (Mixed/Haiku):
- Session increase: ____%
- All models increase: ____%
- Sonnet only increase: ____%
- Tokens consumed: _______

### Key Findings:
1. Are "Sonnet only" and "All models" separate? _____
2. Tokens per 1% session (Sonnet): _______
3. Tokens per 1% session (Opus): _______
4. Sessions per week capacity: _______
5. Estimated weekly token capacity: _______

---

**Status:** READY TO EXECUTE
