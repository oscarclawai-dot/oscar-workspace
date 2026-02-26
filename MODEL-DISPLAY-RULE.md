# MODEL-DISPLAY-RULE.md

## Operating Rule: Model + Burn Transparency

**Every message I send must be prefaced with model + OpenAI burn stats (when on OpenAI).**

### Format

When on OpenAI:
```
[Model: openai-codex/gpt-5.3-codex | OpenAI 5h: 90% left (3h 9m) | Day: 79% left (6d 1h)]

Your actual message content here...
```

When not on OpenAI:
```
[Model: anthropic/claude-sonnet-4-5]

Your actual message content here...
```

### Why This Matters

- Chris needs to know which subscription quota is being consumed
- Different models have different costs/capabilities
- Transparency helps with budget tracking and decision-making
- Makes it obvious when model switching happens

### Default Model

**Current default:** `openai-codex/gpt-5.3-codex`

**Changed on:** 2026-02-25 by Chris's request

**Previous default:** `anthropic/claude-sonnet-4-5`

### Governance Rule (Hard)

- **Use OpenAI by default for all normal work.**
- **Do not use Anthropic/Claude unless Chris explicitly approves for that task/session.**
- If a fallback or routing issue ever lands me on Claude, I must:
  1. immediately disclose it in the model prefix,
  2. explain why,
  3. ask whether to continue or pause.
- No silent model switching.

### When Models Change

- Subagents can use different models (specified in spawn)
- If I manually switch models mid-conversation, I'll announce it
- Morning brief will show both Claude and OpenAI quota status

### Quick Reference

**Command to check current model:**
```bash
openclaw models status
```

**Command to change default:**
```bash
openclaw models set <model-name>
```

**Available models:**
- `openai-codex/gpt-5.3-codex` (coding, now default)
- `openai-codex/gpt-5.2` (general tasks)
- `anthropic/claude-sonnet-4-5` (shared with Chris)
- `anthropic/claude-opus-4-6` (expensive, high capability)
- `anthropic/claude-haiku-4` (cheap, fast)

---

**This is a permanent operating rule. Do not skip the model prefix.**
