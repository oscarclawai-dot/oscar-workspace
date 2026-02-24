# Telemetry Analyzer v2 - Consulting Notes

**Project:** Race car telemetry analysis tool for amateur racing  
**Repo:** `citterly/telemetry-v2` (private)  
**Local clone:** `/home/oscar/.openclaw/workspace/telemetry-v2`  
**Role:** Read-only consultant - code review, architecture feedback, AI coding mentorship

---

## Project Overview

Full-stack web app that turns data logger files into actionable racing insights.

**Users:** Chris + Andy (drivers), Tom + Jeff (engineering crew)  
**Use case:** Import session data, analyze corner-by-corner performance, track setup changes, measure driver progression  
**Core goal:** Find where time is hiding - through consistency analysis and capability-based gap analysis

**Tech Stack:**
- Backend: Python 3.12 + FastAPI + SQLite + Pandas
- Frontend: Vue 3 + Vite + Plotly.js
- Data: Parquet files (time-series telemetry), SQLite (metadata catalog)
- Testing: pytest (407 tests) + Vitest (50 tests)

**External dependencies:**
- XRK Service (http://192.168.1.78:8000) - converts AiM data logger files to Parquet
- NAS storage for raw XRK files
- Separate Windows tool handles proprietary DLL extraction

---

## Project Status (as of 2026-02-24)

**Completed:**
- Import pipeline with quality assessment
- Session/lap/corner CRUD
- Lap comparison (speed overlay, time delta)
- Corner analysis (entry/apex/exit speeds, G-forces)
- Setup tracking with diff
- Driver progression tracking
- What-if scenarios (gearing, weight)
- Import inbox & review workflow
- Raw data table with virtual scroll

**Remaining (from spec.md):**
- External timing integration (MyLaps)
- Video integration
- ML-guided practice planning

**Active backlog items:**
- Track map with GPS cursor sync
- Boundary editing + reprocess
- Leaderboard views
- Braking zone analysis

---

## Key Files to Reference

**Documentation:**
- `CLAUDE.md` - AI assistant context, tech stack, progress tracking
- `spec.md` - Comprehensive specification (30KB, user journeys, core principles, edge cases)
- `spec-import-review.md` - Separate spec for import/review workflow
- `BACKLOG.md` - Feature ideas and issues

**Code:**
- `/backend` - FastAPI Python app
- `/frontend` - Vue 3 app
- `/docs` - Historical planning docs (archive only)

---

## Chris's AI Coding Workflow

**Strengths:**
- Detailed spec.md as single source of truth ✅
- CLAUDE.md provides context to AI assistants ✅
- 30-60 minute work chunks (right approach) ✅
- Clear progress tracking ✅
- Good test coverage (407 + 50 tests) ✅

**Areas to improve:**
1. Add specific acceptance criteria to user journeys (visuals, thresholds, calculations)
2. Include example scenarios (input data → expected output)
3. Create "Definition of Done" checklists per feature
4. Document formulas explicitly (especially for what-if scenarios)

**Spec-builder skill:**
- Custom skill Chris built for refining specs before coding
- Location: `~/projects/tools/spec-builder/SKILL.md` (not on ThinkPad)
- Plan: Create separate repo for AI coding harness and share with Oscar

---

## Consulting Focus Areas

**Code review:**
- Architecture decisions
- Data model design
- API design patterns
- Test coverage

**AI coding mentorship:**
- Writing better specs for AI tools
- Structuring prompts for complex features
- Debugging when AI goes off-track
- Best practices for AI-assisted development

**Domain expertise:**
- Not a race car expert - Chris has that knowledge
- Can help with software patterns, not racing strategy

---

## Notes

**Chris's constraint:** Read-only access committed. No commits/pushes without explicit permission. Documented in TOOLS.md.

**Communication style:** Chris's brain jumps around topics (normal for him). Memory/context tracking is critical so when he cycles back, full context is available.

**Next steps:**
- Wait for Chris to share spec-builder skill repo
- Available for code reviews and AI coding questions as needed
- Can help write mini-specs for backlog items when requested
