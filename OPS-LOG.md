# OPS-LOG.md - Operations & Maintenance Journal

_A running log of issues, fixes, changes, and lessons learned. When something breaks or needs attention, document it here with dates and solutions._

---

## 2026-02-15 - Initial Setup & Lessons Learned

### Installation Process

Chris set me up on February 15, 2026 with help from Claude. Process:

1. Installed Ubuntu 24.04.1 LTS alongside existing Windows 11 Pro
2. Installed Node.js 22
3. Installed Claude Code CLI and generated setup-token (linked to Chris's Claude subscription)
4. Installed OpenClaw 2026.2.14
5. Configured with anthropic/claude-sonnet-4-5

### Issues Encountered During Setup

**1. WMIC deprecated on Windows 11 build 26100**
- **Problem:** WMIC commands failed during partition/disk inspection
- **Fix:** Use PowerShell instead: `Get-PhysicalDisk` and `Get-Partition`
- **Lesson:** Windows is phasing out legacy CLI tools

**2. curl missing on Ubuntu**
- **Problem:** curl wasn't installed by default
- **Fix:** `sudo apt install curl` before Node.js setup
- **Lesson:** Don't assume basic tools are present on fresh Ubuntu installs

**3. npm global installs require sudo**
- **Problem:** npm install -g commands failed with permission errors
- **Fix:** Use `sudo npm install -g <package>`
- **Lesson:** This system doesn't use nvm or user-level npm globals

**4. git missing**
- **Problem:** OpenClaw npm install failed (needs git for dependencies)
- **Fix:** `sudo apt install git`
- **Lesson:** git is a prerequisite for OpenClaw installation

**5. Claude setup-token auth failed initially**
- **Problem:** First token paste attempt gave 401 auth errors
- **Fix:** Regenerated with `openclaw models auth setup-token --provider anthropic`
- **Lesson:** Token generation/paste process can be finicky; regenerate if first attempt fails

**6. Systemd user services unavailable during onboard**
- **Problem:** Couldn't enable systemd user service for auto-start
- **Fix:** `sudo loginctl enable-linger oscar` to allow user services without login
- **Lesson:** User services need linger enabled on this system

**7. JSON corruption via sed**
- **Problem:** Used sed to edit nested JSON in openclaw.json — completely corrupted the config
- **Fix:** Rewrote entire config from scratch using heredoc
- **Lesson:** **NEVER use sed/awk on JSON. Use `openclaw config set` commands or careful manual editing with nano. JSON is not line-based.**

**8. Remote web UI "missing scope: operator.read" error**
- **Problem:** Connecting from another PC on LAN failed with scope error even with `allowInsecureAuth: true`
- **Attempted Fix:** Added scopes to gateway.auth (broke gateway, needed doctor --fix)
- **Working Solution:** SSH tunnel from remote machine:
  ```bash
  ssh -N -L 18789:127.0.0.1:18789 oscar@192.168.1.31
  ```
  Then access via `http://localhost:18789/`
- **Lesson:** For remote access, SSH tunneling is cleaner than trying to expose the web UI directly over LAN

**9. Gateway bind mode caused pairing issues**
- **Problem:** Changed gateway.bind from "loopback" to "lan" or "0.0.0.0" — caused pairing errors that locked out even local CLI
- **Fix:** Keep bind on "loopback", use SSH tunneling for remote access
- **Lesson:** Don't mess with bind settings unless you know exactly what you're doing

**10. F12 boot menu didn't work on T460**
- **Problem:** Couldn't access boot device selection with F12 during USB install
- **Fix:** Enter BIOS with F1, manually reorder boot priority to put USB first
- **Lesson:** ThinkPad T460 boot menu key behavior is quirky

---

## Standing Rules

1. **Document all changes here** — date, problem, solution, lesson learned
2. **Never edit JSON with sed/awk** — use proper tools or careful manual editing
3. **Test config changes incrementally** — don't change multiple things at once
4. **Keep gateway bind on loopback** — use SSH tunneling for remote access
5. **Always run `openclaw doctor` after config changes** to catch issues early

---

## 2026-02-23 - Daily Health Check (6 AM)

### `openclaw doctor` Findings

**1. Auth profile cooldown (claude_max)**
- **Status:** anthropic:claude_max is in 1h cooldown
- **Impact:** Can't use claude-opus-4 until cooldown expires
- **Action:** None needed — either wait or use default claude-sonnet-4-5

**2. Gateway service entrypoint mismatch**
- **Issue:** Gateway service points to old entrypoint; doesn't match current install
- **Expected:** `/usr/lib/node_modules/openclaw/dist/index.js`
- **Impact:** May cause issues after updates
- **Action:** Should run `openclaw doctor --fix` to update service file

**3. Gateway service PATH not set**
- **Status:** Service runs with minimal PATH (expected for daemons)
- **Impact:** None currently
- **Action:** None needed unless PATH-dependent issues arise

**4. Memory search provider missing**
- **Issue:** Memory search enabled but no embedding provider configured
- **Impact:** Semantic recall (memory_search tool) won't work
- **Fix Options:**
  - Set OPENAI_API_KEY or GEMINI_API_KEY environment variable
  - Run `openclaw auth add --provider openai`
  - Configure local embedding model
  - Disable: `openclaw config set agents.defaults.memorySearch.enabled false`
- **Action:** Decide whether to use semantic memory or disable it

**5. Other services detected**
- **Status:** chromium-headless.service running
- **Impact:** None — independent service
- **Action:** None needed

### `openclaw security audit` Findings

**WARN: Reverse proxy headers not trusted**
- **Issue:** gateway.bind is loopback and gateway.trustedProxies is empty
- **Impact:** If exposing Control UI through reverse proxy, local-client checks could be spoofed
- **Current Setup:** Using SSH tunnel for remote access (loopback only)
- **Action:** None needed — current setup is secure

**Attack Surface Summary:**
- Open groups: 0
- Allowlist groups: 1
- Elevated tools: enabled
- Webhooks: disabled
- Internal hooks: enabled
- Browser control: enabled

### Summary

**Critical:** None  
**Warnings:** 1 (trusted proxies — not applicable with current SSH tunnel setup)  
**To Consider:**
- Run `openclaw doctor --fix` to update gateway service entrypoint
- Decide on memory search provider or disable the feature

**Overall Status:** ✅ Healthy — minor maintenance items identified

---

## 2026-02-24 - Daily Health Check (6 AM)

### `openclaw doctor` Findings

**1. Auth profile cooldown (claude_max)**
- **Status:** anthropic:claude_max is in 1h cooldown
- **Impact:** Can't use claude-opus-4 until cooldown expires
- **Action:** None needed — wait or use default claude-sonnet-4-5

**2. Gateway service entrypoint mismatch** *(recurring)*
- **Issue:** Gateway service points to old entrypoint; doesn't match current install
- **Expected:** `/usr/lib/node_modules/openclaw/dist/index.js`
- **Impact:** May cause issues after updates
- **Action:** Run `openclaw doctor --fix` to update service file

**3. Memory search provider missing** *(recurring)*
- **Issue:** Memory search enabled but no embedding provider configured
- **Impact:** Semantic recall (memory_search tool) won't work
- **Status:** Persistent configuration item
- **Action Needed:** Decide to configure provider or disable feature

**4. Other services detected**
- chromium-headless.service still running
- No impact on OpenClaw

### `openclaw security audit` Findings

**WARN: Reverse proxy headers not trusted** *(recurring)*
- **Issue:** gateway.trustedProxies is empty
- **Current Mitigation:** Using SSH tunnel for remote access (secure)
- **Action:** None needed with current setup

**Attack Surface:** No changes from yesterday
- 0 critical · 1 warn · 1 info
- Setup remains secure with SSH tunnel approach

### Summary

**Critical:** None  
**Warnings:** 1 (trusted proxies — mitigated by SSH tunnel)  
**Recurring Items:**
- Gateway service entrypoint mismatch (run doctor --fix)
- Memory search provider decision needed

**Overall Status:** ✅ Healthy — same minor maintenance items as yesterday

---

_This log exists so future-me doesn't repeat past-me's mistakes._
