# Token Estimation Policy (v1)

## Mandatory per chunk
Before execution:
- assign taxonomy label
- record projected token count + class
- record projected range (low/high)

After execution:
- record actual token count
- compute error %
- run post-hoc classifier review (keep/relabel)
- append to ledger

## Projection Method
- Primary: historical median for same taxonomy label
- Fallback 1: nearest parent label (drop dependency/mode)
- Fallback 2: class baseline from complexity map

## Complexity -> baseline estimate
- C1: 3k
- C2: 8k
- C3: 18k
- C4: 35k
- C5: 65k

## Range rule
- Low = estimate * 0.7
- High = estimate * 1.4
- tighten as data quality improves

## Weekly report fields
- total chunks
- total projected vs actual
- MAPE
- top overestimated labels
- top underestimated labels
- relabel rate (how often initial taxonomy was corrected)
- 80/20 concentration check (volume coverage by top labels)
- recommended recalibration changes
