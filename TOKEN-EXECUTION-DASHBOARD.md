# Token Execution Dashboard

Updated: 2026-02-26 08:36 ET

## Current Quota State
- Model: openai-codex/gpt-5.3-codex
- 5h window: **91% left** (resets in ~3h 28m)
- Daily quota: **79% left**

## Burn-Rate Model (Working)
Based on observed runs:
- 4-doc batch consumed ~86.2k tokens and moved 5h by ~3%
- Approximate conversion: ~28.7k tokens per 1% of 5h window (rough)

## Task Size Bands
- Small: 5k–20k
- Medium: 20k–60k
- Large: 60k–150k

## Session Planning Rule
- With 91% left, we can run:
  - ~2-3 Large chunks, or
  - ~6-12 Medium chunks, or
  - many Small chunks.

## In-Flight Today (planned)
1. Decision-loop hardening fixes — Small/Medium
2. Second full decision-cycle run — Medium
3. Meeting Brief/Debrief v1 spec+scenarios+test — Medium
4. EOD package assembly — Small

## Per-Chunk Tracking Template
- Chunk ID:
- Estimated tokens:
- Actual tokens:
- Variance (%):
- Outcome:
- Next adjustment:
