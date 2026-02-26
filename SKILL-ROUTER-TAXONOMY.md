# Skill Router Taxonomy (v1)

## Design Goal
Route to the right skill with minimal context load using a multi-layer lookup path.

## Layered Router
1. **Layer 0: Core intent class**
   - plan | build | test | operate | communicate | research
2. **Layer 1: Domain**
   - software | personal-ops | infra | comms | analytics
3. **Layer 2: Task shape**
   - one-shot | recurring | incident | review | generation
4. **Layer 3: Risk level**
   - low | medium | high (approval gates)
5. **Layer 4: Skill candidate(s)**
   - exact skill or fallback process

## Routing Principle
- Load only one candidate skill file at first.
- Escalate to deeper taxonomy node only if confidence is low.
- Do not preload all skill descriptions.

## Missing Skill Protocol
If no suitable skill found:
1. Log event in `SKILL-GAPS.md`
2. Complete task using thin-core process
3. Propose new skill candidate during weekly review

## Confidence Thresholds
- >=0.85: auto-route
- 0.60–0.84: route + self-check
- <0.60: ask/confirm or use generic process

## Weekly Hygiene
- Top repeated tasks without skills
- Misroutes and corrections
- Retire/merge stale taxonomy nodes
- Keep taxonomy compact (80/20 coverage)
