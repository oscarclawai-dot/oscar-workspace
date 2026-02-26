# Token Burn Taxonomy (v1)

## Purpose
Standardize task classification so token estimates become increasingly accurate over time.

## Dimensions
1. **Domain**: planning | research | implementation | testing | operations | messaging
2. **Artifact Type**: spec | scenario-pack | code | test-report | brief | dashboard | config
3. **Complexity**: C1..C5
4. **Execution Mode**: single-agent | multi-agent
5. **Dependency Level**: D0..D3 (none -> external integration)

## Complexity Bands (granular)
- **C1** micro update (single file section)
- **C2** short artifact (<= 1 new file)
- **C3** standard chunk (spec + scenarios or build + test)
- **C4** multi-artifact chunk (3-5 files and validation)
- **C5** orchestration chunk (multi-agent loop with review)

## Token Classes (granular)
- **T01**: 0–5k
- **T02**: 5k–12k
- **T03**: 12k–20k
- **T04**: 20k–35k
- **T05**: 35k–55k
- **T06**: 55k–80k
- **T07**: 80k–120k
- **T08**: 120k+

## Task Label Format
`<domain>.<artifact>.<complexity>.<mode>.<dependency>`

Example:
- `planning.spec.C3.single-agent.D0`
- `implementation.code.C4.multi-agent.D1`
- `testing.test-report.C3.single-agent.D0`

## Estimation Workflow
1. Assign taxonomy label
2. Lookup historical records by nearest label match
3. Compute estimate:
   - median(actual_tokens)
   - p75(actual_tokens) as risk buffer
4. Set projected range = median ± variance band
5. After execution, store actual and error%

## Accuracy Metrics
- MAPE (mean absolute percentage error)
- Bias (over/under estimate trend)
- Coverage (% actuals inside projected range)

## Improvement Loop
- Weekly recalibration per top 10 labels
- Post-execution classifier review: confirm or relabel each completed chunk if initial label was poor
- Merge/split labels if too sparse/too broad
- Adjust projected ranges from empirical percentiles

## 80/20 Taxonomy Rule (Anti-overfit)
- Target state: ~80% of work volume should map to ~20% of labels.
- If long-tail labels exceed 20% of volume for 2+ weeks, simplify/merge.
- Keep label count small enough to be useful, large enough to preserve forecasting signal.
- Prefer stable parent labels over creating new micro-labels unless repeated evidence supports it.