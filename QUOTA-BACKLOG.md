# QUOTA-BACKLOG.md

## Purpose
Tasks I can do autonomously to burn Claude tokens productively when:
- You don't have time for development work
- We're behind pace on quota utilization
- Weekly reset is approaching and we're wasting subscription value

## Process Rule
- Auto-capture actionable items from conversation into this backlog.
- If ambiguity exists, add as `Needs confirmation` and continue.
- Notify Chris when new items are added.

## How This Works

**When you're busy:**
- Say: "Burn some tokens" or "Work the backlog"
- I'll pick the highest priority task that fits the situation
- I'll report back when done

**When to hand off:**
- You're swamped at work
- End of week approaching, low utilization
- I alert that we're behind pace

## Task Backlog (Prioritized)

## This Week Focus (Approved)

- [x] **Decision Desk (ADR Bot)** ✅ v1 drafted (`DECISION-DESK.md`, `DECISION-DESK-SCENARIOS.md`)
  - Convert ideas into decision records (problem, options, pros/cons, recommendation)
  - Keep searchable artifacts for future reference
  - Output: `DECISION-DESK.md` + template file(s)

- [x] **Work Sprint Picker (15/30/60 min)** ✅ v1 drafted (`SPRINT-PICKER.md`)
  - Generate scoped sprint options from backlog based on available time
  - Include expected output and effort confidence
  - Output: `SPRINT-PICKER.md`

- [x] **AI Learning Curator (Software Harness Focus)** ✅ v1 drafted (`AI-LEARNING-CURATOR.md`, `AI-HARNESS-WEEKLY-001.md`)
  - Daily/weekly digest focused on software-development harnesses and practical tasks for Oscar
  - Sources: HN, YouTube, relevant engineering content
  - Output: `AI-LEARNING-CURATOR.md`

- [ ] **Inbox Triage** — **Deferred / explicit approval required**
  - Do not implement until explicit approval
  - Reason: access comfort/maturity gate


### Priority 1: High-Value Aligned Work
*Direct impact on your goals - career, projects, income*

- [ ] **Context Hygiene + Skill Routing Framework**
  - Define "thin core rules, thick skills" architecture
  - Create trigger map for when to use each skill
  - Add confidence thresholds (auto-use vs ask)
  - Design weekly pruning process for active rules/memory noise
  - Add multi-layer skill taxonomy router (incremental file loading)
  - Add missing-skill log + weekly gap review
  - Outputs: `CONTEXT-HYGIENE-FRAMEWORK.md`, `SKILL-ROUTER-TAXONOMY.md`, `SKILL-GAPS.md`

- [ ] **Trust & Transparency System (Anti-Black-Box)**
  - Define transparency standards for every major output:
    - inputs used
    - assumptions made
    - method used
    - confidence level
    - validation/tests run
    - open risks/unknowns
  - Add a required "How this was derived" section template
  - Add audit trail index linking artifacts, test reports, and decisions
  - Propose collaboration trust model (what is autonomous vs approval-gated)
  - Output files: `TRANSPARENCY-STANDARD.md`, `TRACEABILITY-INDEX.md`

- [ ] **Showcase Capability Rollout (All Ideas Added)**
  - Ralph pattern fit/adoption analysis complete: `RALPH-PATTERN-ADOPTION.md`
  - Adopt Ralph-lite loop for capability implementation
  - Decision Desk (this week)
  - Work Sprint Picker (this week)
  - AI Learning Curator (this week, harness-focused)
  - Meeting Brief + Debrief loop
  - Telemetry Feature Spec Factory
  - Personal Ops Health Dashboard
  - Consulting Opportunity Radar
  - Token Arbitrage Planner
  - Autonomy Budget Contracts
  - Inbox Triage (deferred until Chris approval)

- [x] **Capability Matrix Research (NEW)** ✅ (initial draft complete: `CAPABILITY-MATRIX.md`)
  - Wait for Chris's list of potential capabilities
  - Research each capability end-to-end
  - Score on:
    - Difficulty to build
    - Value generated
    - Expected frequency of use
    - Maintenance burden
    - Reliability/risk
    - Time-to-first-value
  - Deliver ranked matrix + phased implementation plan
  - Output file: `CAPABILITY-MATRIX.md`

- [ ] **Generate telemetry analyzer documentation** (large token spend)
  - User guides, API docs, deployment guides
  - Physics references, testing strategies
  - Generated ~150KB in Phase 1, can do more
  
- [ ] **Research PD consulting opportunities**
  - Sentencing guidelines automation approaches
  - Body cam transcript analysis techniques
  - Similar public sector AI projects and pricing
  
- [ ] **Protocol analyzer RAG system research**
  - Vector DB options comparison (Pinecone, Weaviate, Qdrant, ChromaDB)
  - Embedding model selection for scientific protocols
  - Evaluation frameworks for RAG quality
  
- [ ] **Zoetis automation brainstorming**
  - What other lab processes could be automated?
  - ROI documentation templates
  - AI use cases in pharma manufacturing
  
- [ ] **Career strategy research**
  - Comp data for AI/automation engineers in pharma
  - Negotiation tactics with skip-level managers
  - Building consulting business while employed

### Priority 2: Medium-Value Work
*Useful but not urgent*

- [ ] **Video-derived: Setup-Procrastination Guardrails**
  - Define max time budget for "system tuning" vs "shipping outputs"
  - Weekly ratio target: build/useful outputs >= 80% of effort

- [ ] **Video-derived: Role-based Agent Structure Audit**
  - Validate current role split (main/dev/creative/research)
  - Ensure each role has clear job-to-be-done and boundaries

- [ ] **Video-derived: Caption Quality Scoring for YouTube Skill**
  - Add transcript quality score + auto-flag low-confidence transcripts
  - Trigger reprocess path when quality falls below threshold

- [ ] **Database Adoption Decision (for agent operations)**
  - Research when flat files are enough vs when DB is better
  - Identify candidate datasets: token ledger, decisions index, backlog items, traceability links
  - Propose lightweight options (SQLite-first) + migration plan
  - Include cost/complexity and maintenance tradeoffs
  - Output: `DATABASE-ADOPTION-PLAN.md`

- [ ] **Fix LAN access for markdown viewer (firewall policy)** — **Approval required (Chris must be involved)**
  - Investigate/adjust UFW rules to allow chosen viewer port from LAN
  - Validate from phone on local Wi-Fi
  - Document rollback + persistent run strategy

- [ ] **Organize workspace documentation**
  - Review and consolidate memory files
  - Update MEMORY.md from recent daily notes
  - Clean up old snapshots
  
- [ ] **New Orleans trip research**
  - Restaurant recommendations
  - Things to do March 12-15
  - Jazz clubs, food tours, hidden gems
  
- [ ] **AI development learning**
  - Deep dives on new frameworks/tools
  - RAG best practices
  - Agent architecture patterns
  
- [ ] **Code review practice**
  - Review telemetry analyzer codebase sections
  - Document patterns and improvements
  - Learn the system deeply

### Priority 3: Token Burners
*Only if desperate - low priority but uses tokens*

- [ ] **Generate creative content**
  - Short stories (Chris might enjoy)
  - Technical explainers
  - Racing physics simulations
  
- [ ] **Deep research dives**
  - Interesting technical topics
  - Industry trends
  - Future tech exploration

## Current Top Pick

**If you say "burn tokens" right now, I would:**

Generate comprehensive documentation for the protocol analyzer RAG system - covering:
- Vector database architecture
- PDF parsing pipeline (Docling integration)
- Embedding strategy for scientific protocols
- Retrieval and generation workflow
- Evaluation and quality metrics

**Why:** High-value, aligned with Zoetis work, fills documentation gap, large token spend.

---

## Usage Notes

- Add new tasks as they come up
- Mark completed with [x]
- I'll log what I worked on in daily memory
- Estimated token usage will improve as I learn burn rates

**Last Updated:** 2026-02-25
