# AI Agent Software-Delivery Harness Practices (2025–2026)

## Purpose
Implementation-focused guidance for building and operating AI coding-agent harnesses with better reliability, testability, and governance.

---

## 1) Concrete practices (10)

### 1. Start spec-first with executable acceptance criteria
Define behavior before prompting agents to code.

**Do:**
- Write a short feature spec with:
  - scope + non-goals
  - inputs/outputs and constraints
  - integration contracts
  - acceptance criteria in Given/When/Then (or equivalent)
- Keep criteria testable (unit/integration/e2e/rubric), not prose-only.

**Implementation artifact:** `specs/<feature>.md` + `tests/acceptance/<feature>/*`

---

### 2. Split acceptance checks into outcome, process, style, and efficiency
Do not rely on one pass/fail metric.

**Do:**
- Outcome: feature works and tests pass
- Process: expected tools/steps used where required
- Style: conventions/security constraints respected
- Efficiency: bounded retries, token/tool-call budgets

**Implementation artifact:** scoring config with weighted checks (e.g., `evals/<feature>.yaml`).

---

### 3. Maintain a held-out scenario suite and never tune directly on it
Use unbiased scenarios to catch regressions and overfitting.

**Do:**
- Keep three sets: `train/dev`, `smoke`, `held-out`
- Use held-out only for release decisions, not prompt iteration
- Include edge cases and adversarial/problematic tickets

**Implementation artifact:** dataset registry with immutable IDs and split labels.

---

### 4. Run multi-trial evals for stochastic tasks
Single-run success is noisy and misleading.

**Do:**
- Run N trials per scenario (e.g., 3–10 based on cost)
- Track pass rate + variance (not only mean)
- Gate release on minimum pass-rate threshold and max variance

**Implementation artifact:** eval runner outputs `pass_rate`, `stddev`, `p95 latency`, `tool-call count`.

---

### 5. Separate planner / developer / tester roles in the harness
Avoid one agent being planner, implementer, and judge of its own work.

**Do:**
- **Planner role:** decomposes spec into tasks and dependencies
- **Developer role:** implements one bounded task at a time
- **Tester role:** validates via tests/rubrics and can reject
- Enforce role-specific prompts + limited tool scopes

**Implementation artifact:** role manifests with allowed tools and I/O contracts.

---

### 6. Require incremental commits and explicit handoff state
Long-running work should survive context resets cleanly.

**Do:**
- Require small atomic commits
- Persist machine-readable progress state (`progress.md` / `progress.json`)
- Leave repo in mergeable state after every session

**Implementation artifact:** “session done” checklist in CI (clean tree, tests green, progress updated).

---

### 7. Build deterministic gates first, then add rubric graders
Use objective checks where possible; rubric/LLM graders for residual quality.

**Do:**
- Prioritize deterministic checks (tests, lint, schema, contracts)
- Add rubric-based grading for readability/architecture/maintainability
- Calibrate rubric graders periodically against human labels

**Implementation artifact:** dual gate pipeline: `hard_gates` then `soft_gates`.

---

### 8. Treat traces as first-class debugging data
You need trajectory-level observability, not just final answers.

**Do:**
- Log full transcripts, tool calls, intermediate artifacts, and final environment state
- Tag failures by stage (planning, tool-selection, implementation, verification)
- Turn production failures into new eval scenarios

**Implementation artifact:** trace IDs linked to scenario IDs and commit SHAs.

---

### 9. Use lightweight rule-based governance with explicit approvals
Most teams need simple enforceable rules, not heavy policy systems.

**Do:**
- Classify actions by risk (read-only, code-write, destructive, deploy/external)
- Require human approval for high-risk actions (deletes, prod deploys, credentials, external side effects)
- Block disallowed actions in tooling (not just prompt text)

**Implementation artifact:** policy file (allow/deny/approval-required) enforced in tool wrapper.

---

### 10. Promote only when harness-level quality bars pass
Benchmark wins alone are insufficient for your repo/workflow.

**Do:**
- Maintain repo-specific success metrics (acceptance pass rate, regression delta, rollback rate)
- Compare candidate harness versions on same held-out set
- Ship behind feature flags/canary when uncertainty is high

**Implementation artifact:** release gate report generated per candidate version.

---

## 2) Anti-patterns to avoid

1. **Vibe-based validation** (“looks good to me”) instead of measurable criteria.
2. **Prompt-only specs** with no executable acceptance tests.
3. **Using the same dataset to tune and to claim success** (data leakage).
4. **Single-trial pass/fail reporting** on stochastic agent workflows.
5. **One-agent-does-everything** (planner/coder/tester conflated).
6. **No explicit handoff artifacts** for long-running or multi-session work.
7. **Framework-first complexity** before proving simple direct workflows.
8. **Governance as documentation only** (no enforcement in tool layer).
9. **Ignoring process metrics** (tool misuse, retries, token thrash).
10. **No feedback loop from production incidents into eval suites**.

---

## 3) Minimal daily operating checklist (run each workday)

### A. Pre-merge / pre-release (15–30 min)
- [ ] New/changed specs include clear scope, non-goals, and acceptance criteria.
- [ ] Deterministic gates pass (tests/lint/contracts/security checks).
- [ ] Eval suite run completed for smoke + changed scenarios.
- [ ] Held-out suite sampled or full run per release policy.
- [ ] Pass-rate and variance meet thresholds.
- [ ] No unresolved high-risk policy violations in traces.

### B. Harness health review (10–20 min)
- [ ] Review top failure clusters by stage (plan/dev/test/tool).
- [ ] Add at least one new scenario from yesterday’s real failures.
- [ ] Check tool-call anomalies (unexpected commands, retries, loops).
- [ ] Verify approval gates were triggered where expected.

### C. Governance + audit (5–10 min)
- [ ] Confirm policy file version and enforcement checks are unchanged/intended.
- [ ] Confirm destructive/deploy actions required approvals.
- [ ] Spot-check 3 traces for policy adherence and clean handoff artifacts.

### D. Continuous improvement (10–15 min)
- [ ] Retire one flaky/low-signal check or fix it.
- [ ] Tighten one acceptance criterion that was ambiguous.
- [ ] Update dashboard baselines (pass rate, variance, cost, latency).

---

## 4) Sources (selected)

### Core agent/harness and eval practice
- Anthropic — *Building effective agents*  
  https://www.anthropic.com/engineering/building-effective-agents
- Anthropic — *Demystifying evals for AI agents*  
  https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents
- Anthropic — *Effective harnesses for long-running agents*  
  https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents
- Anthropic — *Writing effective tools for agents — with agents*  
  https://www.anthropic.com/engineering/writing-tools-for-agents
- OpenAI — *Evaluation best practices*  
  https://developers.openai.com/api/docs/guides/evaluation-best-practices
- OpenAI — *Testing Agent Skills Systematically with Evals*  
  https://developers.openai.com/blog/eval-skills/
- OpenAI Agents SDK docs (guardrails, handoffs, tracing)  
  https://openai.github.io/openai-agents-python/

### Spec-first / software-delivery alignment
- Thoughtworks — *Spec-driven development: Unpacking one of 2025’s key new AI-assisted engineering practices*  
  https://www.thoughtworks.com/en-us/insights/blog/agile-engineering-practices/spec-driven-development-unpacking-2025-new-engineering-practices

### Benchmarks and held-out software-task evaluation context
- SWE-bench repository/docs  
  https://github.com/SWE-bench/SWE-bench
- OpenAI — *Introducing SWE-bench Verified*  
  https://openai.com/index/introducing-swe-bench-verified/

### Lightweight governance reference
- NIST AI RMF + Generative AI Profile (AI 600-1)  
  https://www.nist.gov/itl/ai-risk-management-framework
  
---

## Notes for internal adoption
- Start with one repo and 1–2 critical workflows.
- Add governance and eval depth incrementally; keep rules enforceable and observable.
- Favor simple, explicit harness contracts over opaque orchestration.
