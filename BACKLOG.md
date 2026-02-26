# Oscar Backlog

**Owner:** Chris  
**Last updated:** 2026-02-25  
**Rule:** Oscar works this list top-down within each priority tier. If a task is blocked, skip it and move to the next. Do not invent tasks outside this list without Chris's approval.

---

## How This Works

- **🟢 Auto** — Oscar can do these on his own, no approval needed. Report results.
- **🟡 Draft** — Oscar does the research/prep work, then presents a proposal to Chris before executing.
- **🔴 Wait** — Do not start until Chris explicitly says go.
- When a task is done, move it to the Completed section at the bottom with the date.
- If Oscar discovers something that should be on this list, add it to the Inbox section and flag Chris.

---

## P0 — Do This Week

### ✅ 🟢 Daily Briefing (cron job) *(Completed 2026-02-25)*
Runs at 6:30 AM EST and posts to Telegram with:
- Weather for Grand Rapids, MI
- Calendar items (next 48h)
- Claude + ChatGPT quota status
- Pending backlog items
- Max 10 lines

### ✅ 🟢 System Health Monitor *(Completed 2026-02-25)*
Recurring check every 4 hours for:
- Gateway health (`openclaw health`)
- Disk usage on ThinkPad
- Memory usage
- Telegram bot connectivity
If anything is unhealthy, alert Chris on Telegram immediately.
### ✅ 🟡 Infrastructure Hardening Checklist *(Completed 2026-02-25)*
Completed items:
- Researched and applied lid-close sleep hardening (logind.conf + BIOS guidance)
- Drafted and applied UFW policy (SSH + gateway LAN-only)
- Drafted and applied file permission tightening (`~/.openclaw` 700, credentials 600)
- Presented single plan and executed after Chris approval

---

## P1 — This Month

### 🟡 Telemetry App Assistant — Knowledge Base
Chris wants to embed Oscar (as a scoped secondary agent) into a Zoetis telemetry application to help users navigate the app, understand data, and submit feature requests. Start by drafting:
- `APP-GUIDE.md` — template structure for documenting the app screen-by-screen
- `DATA-DICTIONARY.md` — template for telemetry metrics (name, description, units, thresholds, what's normal vs concerning)
- `FAQ.md` — common user questions template
- `FEEDBACK-SCHEMA.md` — structured format for capturing user feature requests (timestamp, user, category, priority, description, current workaround)
**Note:** Chris will need to fill in the actual app details. Oscar builds the scaffolding.

### 🟡 Telemetry App Assistant — Agent Config
Draft the `openclaw.json` config for a scoped secondary agent:
- Agent ID: `telemetry-assistant`
- Separate workspace at `~/.openclaw/workspace-telemetry`
- Tool permissions: read, write, memory_search, memory_get only
- Deny: exec, edit, apply_patch, browser, canvas, nodes, cron, sessions_send
- Sandbox mode: all, scope: agent
- Draft the identity docs (IDENTITY.md, USER.md) for the telemetry assistant persona
Present to Chris for review before implementing.

### 🟢 Meal Planning Research
Research the Eat This Much website and API:
- Can it be automated via browser or API?
- What inputs does it need (dietary preferences, calories, budget)?
- What does the output look like?
- Document findings in `workspace/research/eat-this-much.md`
Do NOT automate anything yet — just research and document.

### 🟢 Learn Oscar's Own Capabilities
Systematically explore and document what you can do:
- What skills are available? (`openclaw skills list`)
- What tools are loaded? Document each one's purpose
- What hooks are available and what do they do?
- What cron patterns work well?
- Write this up as `workspace/CAPABILITIES.md`
This helps Chris understand what to ask you for and helps you know your own limits.

### ✅ 🟢 YouTube Channel Monitor *(Completed 2026-02-25)*
Monitor selected YouTube channels and automatically save transcripts for new videos.
- Channel list stored in `workspace/youtube/channels.md`
- Tracking state in `workspace/youtube/processed.json`
- Transcript output in `workspace/youtube/transcripts/`
- Cron schedule: every 6 hours (`YouTube Channel Monitor 6h`)
- Notification: Telegram success/failure message per new video


### 🟢 Memory Search Embeddings Decision *(Approved from Inbox)*
- Decide and implement one of:
  - Configure embeddings provider (OpenAI/Gemini/local), or
  - Disable semantic memory search
- Document final choice in OPS-LOG.md

### 🟢 Cron Verification & Audit *(Approved from Inbox)*
- Verify execution and logs for:
  - Morning briefing (6:30 AM)
  - System health monitor (every 4h)
  - YouTube monitor (every 6h)
- Confirm alert behavior and log outcomes in OPS-LOG.md

---

## P2 — When You Have Downtime

### 🟢 Quota Tracking
Maintain daily tracking of Claude and ChatGPT subscription usage:
- Log token counts and costs per day
- Track burn rate and project whether quotas will last the billing cycle
- Store in `workspace/memory/quota/` with daily files
- Include summary in morning briefing

### 🟡 Whisper Integration
Oscar has access to Chris's Whisper transcription server at `http://192.168.1.14:7860/`. Research:
- What's the API format?
- Can Oscar send audio files for transcription?
- Draft an integration plan
Present findings before implementing.

### 🟡 GitHub Integration
Oscar has a GitHub account (oscarclawai-dot). Research:
- What can the GitHub skill do?
- What would be useful for Chris's workflow?
- Draft a plan for what repos/permissions to set up
Present before implementing.

### 🟢 Workspace Organization
Keep the workspace clean and organized:
- Maintain a clear folder structure
- Archive old daily memory files monthly
- Keep documentation up to date
- Don't let the workspace become a junk drawer

---

## P3 — Ideas to Explore (need Chris's approval to start)

### 🔴 Home Automation Integration
Explore smart home control possibilities (if Chris has devices to integrate).

### 🔴 Mustang / 335d Maintenance Tracker
Chris has a Mustang (racing) and a 335d. Could track maintenance schedules, part numbers, upcoming service dates.

### 🔴 Email Management
The himalaya skill supports email. Could help triage Oscar's dedicated Gmail inbox or draft responses.

### 🔴 Multi-Model Comparison
With both Claude and ChatGPT available, could run comparative analyses on specific tasks to help Chris understand which model is better for what.

---

## Inbox (Oscar adds discovered tasks here)

- [ ] **Dashboard remote access stabilization**
  - Validate LAN dashboard access and define Tailscale-first access path for off-LAN use
  - Suggested priority: **P1**

- [ ] **Career strategy weekly check-in cadence**
  - Track protocol analyzer ROI + PD budget status (March)
  - Suggested priority: **P1**

- [ ] **Twilio phone automation setup plan**
  - New number strategy, softball roster workflow automation, implementation checklist
  - Suggested priority: **P2**

- [ ] **TTS voice enablement decision**
  - Choose provider/tier and define initial use cases (voice updates/story mode)
  - Suggested priority: **P2**

- [ ] **Lily assistant feasibility follow-up**
  - Confirm interest and, if yes, draft isolated agent setup plan
  - Suggested priority: **P2**

- [ ] **Spec-builder skill repo handoff**
  - Await repo share from Chris and integrate into capability docs/workflow
  - Suggested priority: **P2**

- [ ] **New Orleans trip booking follow-through**
  - Confirm final dates with Lily, then book flight + hotel
  - Suggested priority: **P1**

- [ ] **Workspace cleanup for YouTube transcript artifacts**
  - Remove/organize temporary and duplicate files (`tmp.xml`, duplicate transcript attempts, raw vtt retention policy)
  - Suggested priority: **P2**

---

## Completed

_Move finished tasks here with the completion date._

---

## Ground Rules for Oscar

1. **Stick to ChatGPT models** for autonomous work. Claude quota is for Chris's direct use.
2. **Don't modify your own config** without Chris's approval. No switching models, adding tools, or changing permissions autonomously.
3. **Document everything you build.** If Chris can't understand it by reading a markdown file, it's not done.
4. **Fail gracefully.** If something breaks, log it, alert Chris, and move on. Don't crash-loop trying to fix yourself.
5. **Be honest about limitations.** If you can't do something or don't know how, say so. Don't fake competence.
6. **Respect the priority order.** P0 before P1, P1 before P2. Don't skip ahead to fun stuff when important work remains.
7. **Morning briefing is sacred.** Even if nothing else works, the daily briefing should always fire.
8. **Feature requests from telemetry users are gold.** Treat them with care — structured, categorized, and preserved. This data drives product decisions.

## Claude Usage Policy

Oscar may request Claude model access for specific tasks where Claude's capabilities meaningfully outperform ChatGPT. To request Claude:

1. **Post a request to Chris on Telegram** with:
   - What task needs Claude
   - Why ChatGPT isn't sufficient (specific limitation, not just "Claude is better")
   - Estimated token usage (small/medium/large)
   - Which Claude model is needed (Sonnet vs Opus)
2. **Wait for explicit approval** before switching models
3. **Switch back to ChatGPT immediately** when the approved task is complete
4. **Log the usage** in `workspace/memory/claude-requests.md` with date, task, model, and outcome

**Good reasons to request Claude:** Long-context analysis, complex code generation, tasks requiring Opus-level reasoning, writing that needs Claude's voice/style.

**Not good reasons:** Routine tasks, web searches, file management, daily briefings, anything ChatGPT handles fine.
