# USER-GUIDE.md - How to Work with Oscar

**Last Updated:** 2026-02-23  
**Your AI Assistant on a ThinkPad T460**

---

## Quick Start

**Ways to reach me:**
- **Telegram:** Message your paired bot (preferred for mobile/notifications)
- **Web Chat:** Connect to the OpenClaw gateway at localhost:18789 (when on the same network)

**Wake words:** Just message me normally. In group chats, mention me by name or use `@oscar`.

---

## What I Can Do

### 🌐 Web & Research
- **Web search** via Brave Search API (real-time results)
- **Web scraping** with headless browser (Chromium)
- **Link extraction** from URLs (article text, metadata)
- **Weather forecasts** (wttr.in, no API key needed)

### 💻 System & Shell
- **Run shell commands** on the ThinkPad (bash, Python, etc.)
- **File operations** (read, write, edit files)
- **Process management** (background tasks, monitoring)
- **Git operations** (commits, pushes, repo management)

### 🤖 AI & Language
- **Primary model:** Claude Sonnet 4.5 (Anthropic)
- **Reasoning mode:** Low (configurable via `/reasoning`)
- **Image understanding** (analyze screenshots, photos)
- **Audio transcription** via Whisper server at 192.168.1.14:7860
- **Text-to-speech** available when configured

### 📱 Messaging & Communication
- **Telegram integration** (your primary interface)
- **Cross-context messaging** (send to other channels when allowed)
- **Message reactions** and formatting
- **Notifications** via Telegram for important events

### 🔧 Automation & Cron
- **Scheduled tasks** (reminders, periodic checks)
- **Morning briefings** (weather, news, custom reports)
- **Heartbeat checks** (every 1 hour by default)
- **Background monitoring** (email, calendar, notifications)

### 🧠 Memory & Context
- **Session continuity** (remembers our conversation)
- **Daily logs** in `memory/YYYY-MM-DD.md`
- **Long-term memory** in `MEMORY.md` (main session only)
- **Memory search** (semantic search over workspace files)

### 🎯 Skills Available

Current skills installed:
- **weather** - Get weather forecasts (wttr.in)
- **coding-agent** - Run CLI coding agents (Claude Code, etc.)
- **healthcheck** - Security hardening and system checks
- **skill-creator** - Create new AgentSkills

To see all skills: check `/usr/lib/node_modules/openclaw/skills/`

---

## How to Interact

### Basic Commands

**Native commands** (when enabled):
- `/status` - Show session stats (tokens, cost, time)
- `/reasoning [on|off|low|medium|high]` - Toggle reasoning mode
- `/model <model>` - Switch language model
- `/help` - Show available commands
- `/reset` - Clear conversation history

**Text commands** (slash prefix):
- `/bash <command>` - Run shell commands directly
- `/config` - Read/write configuration (when allowed)
- `/debug` - Runtime debugging overrides

### Messaging Surfaces

**Telegram:**
- Send text messages, images, audio, files
- Use inline buttons for approvals (when configured)
- Receive notifications and alerts
- Group chat support with @mentions

**WebChat:**
- Access via browser at `http://localhost:18789`
- Real-time streaming responses
- Limited capabilities (no inline buttons)

### File Operations

**Reading files:**
```
Read /path/to/file
Show me HARDWARE.md
What's in memory/2026-02-23.md?
```

**Writing files:**
```
Create a file called notes.txt with [content]
Update HARDWARE.md with [new info]
Append to OPS-LOG.md: [entry]
```

**Editing files:**
```
In HARDWARE.md, replace "ThinkPad" with "Lenovo ThinkPad"
Edit line 5 of config.json to change [value]
```

### Shell Commands

**Direct execution:**
```
Run: ls -la ~
Check if nginx is running
Install package: sudo apt install htop
```

**Background tasks:**
```
Start a web server on port 8080 in the background
Monitor /var/log/syslog for errors
Run a long backup script
```

### Web Browsing

**Basic navigation:**
```
Navigate to https://example.com and take a screenshot
Go to github.com and show me the trending repositories
Search Google for "Linux performance tuning"
```

**Data extraction:**
```
Visit eatthismuch.com and document the interface
Scrape headlines from news.ycombinator.com
Take screenshots of all steps in the checkout flow
```

### Automation & Scheduling

**One-time reminders:**
```
Remind me in 30 minutes to check the server
Set a reminder for 3pm to call John
Alert me tomorrow at 9am about the meeting
```

**Recurring tasks:**
```
Every morning at 7am, send me weather and news
Check email every 2 hours and notify if urgent
Run system healthcheck daily at midnight
```

---

## Current Setup

### Hardware
**Device:** Lenovo ThinkPad T460  
**CPU:** Intel Core i5-6300U (2 cores, 4 threads)  
**RAM:** 8 GB DDR4  
**Storage:** 256 GB SSD  
**OS:** Linux 6.17.0-14-generic (Ubuntu/Debian-based)  
**Network:** WiFi + Ethernet, connected to 192.168.1.x subnet

### Services Running
- **OpenClaw Gateway:** Port 18789 (loopback bind)
- **Chromium Headless:** Port 18800 (CDP control)
- **Whisper Server:** Port 7860 at 192.168.1.14 (external)

### Network Access
- **Whisper transcription:** http://192.168.1.14:7860
- **Local services:** Access via localhost or 192.168.1.x (when bound)
- **External APIs:** Brave Search (enabled), Anthropic Claude (primary model)

### Browser Configuration
- **Mode:** Headless (no GUI)
- **Type:** Chromium (snap package)
- **Profile:** `openclaw` (attach-only mode due to snap limitations)
- **Data dir:** `~/snap/chromium/common/openclaw-browser`

**Starting the browser:**
```bash
chromium-browser --headless=new --no-sandbox --disable-gpu \
  --remote-debugging-port=18800 \
  --user-data-dir=$HOME/snap/chromium/common/openclaw-browser \
  about:blank &
```

---

## Workflows & Examples

### Morning Briefing
**Setup:** Cron job runs daily at 7am  
**Delivers:** Weather forecast + top tech/AI news headlines via Telegram

**Manual trigger:**
```
Give me today's weather in Grand Rapids and latest tech news
```

### Research & Documentation
**Example workflow:**
```
1. Search for "Raspberry Pi 5 specs"
2. Visit the top result
3. Extract key specs and pricing
4. Create a comparison table in specs.md
5. Commit and push to GitHub
```

### System Monitoring
**Example:**
```
Check system load and memory usage
Show me running docker containers
Tail the nginx error log for issues
```

### Web Automation
**Example:**
```
1. Navigate to eatthismuch.com
2. Take screenshots of the login and main pages
3. Document the site structure in docs/eatthismuch-analysis.md
4. Test the meal planner workflow
```

---

## Configuration & Customization

### Key Config Files
- **Main config:** `~/.openclaw/openclaw.json`
- **Workspace:** `~/.openclaw/workspace/`
- **Identity:** `~/.openclaw/workspace/IDENTITY.md`
- **User preferences:** `~/.openclaw/workspace/USER.md`
- **Memory:** `~/.openclaw/workspace/MEMORY.md` (main session only)

### Persona & Behavior
Edit `SOUL.md` to customize my personality, tone, and behavior style.

### Tools & Permissions
- **Tool profile:** Currently set to default (most tools available)
- **Elevated commands:** Disabled by default (configure via `commands.ownerAllowFrom`)
- **Cross-context messaging:** Limited (same provider only)

### Model Selection
**Current:** `anthropic/claude-sonnet-4-5`  
**Change via:** `/model <provider/model>`  
**Available:** Check config.models for catalog

### Reasoning Mode
**Current:** Low (concise thinking)  
**Levels:** off, minimal, low, medium, high, xhigh  
**Toggle:** `/reasoning <level>`

---

## Capabilities Matrix

| Feature | Status | Notes |
|---------|--------|-------|
| **Web Search** | ✅ Enabled | Brave Search API |
| **Web Fetch** | ✅ Enabled | HTML → markdown/text |
| **Browser Control** | ✅ Enabled | Headless Chromium, attach-only |
| **Image Understanding** | ✅ Available | Via primary model (Claude Sonnet 4.5) |
| **Audio Transcription** | ✅ Available | External Whisper server at 192.168.1.14:7860 |
| **Text-to-Speech** | ⚠️ Configurable | Not currently configured |
| **Shell Execution** | ✅ Enabled | Full bash access (security: allowlist mode) |
| **File Operations** | ✅ Enabled | Read/write/edit workspace + broader filesystem |
| **Git Operations** | ✅ Available | Via shell exec |
| **Memory Search** | ✅ Enabled | Semantic search over workspace files |
| **Cron Scheduling** | ✅ Enabled | Isolated session jobs with delivery |
| **Telegram** | ✅ Connected | Primary messaging surface |
| **WebChat** | ✅ Available | Via localhost:18789 |
| **Discord/Slack/etc** | ❌ Not configured | Can be added via plugins |

---

## Troubleshooting

### Browser not working?
1. Check if Chromium is running: `ps aux | grep chromium`
2. Verify CDP port: `curl -s http://127.0.0.1:18800/json/version`
3. Restart browser: kill the process and re-run the start command

### Can't reach me on Telegram?
1. Check gateway status: `openclaw status`
2. Verify Telegram bot token in config
3. Check if bot is paired with your account

### Memory/context issues?
1. Daily logs: Check `memory/YYYY-MM-DD.md`
2. Long-term memory: Update `MEMORY.md` manually
3. Reset session: Use `/reset` command

### Performance slow?
1. Check system resources: `htop` or `top`
2. Review session token usage: `/status`
3. Consider model switch for lighter tasks

---

## Security Notes

**Sensitive data:**
- Config tokens are redacted in logs
- Workspace files can contain personal info (keep MEMORY.md private)
- Shell commands run with your user permissions

**Best practices:**
- Keep API keys in environment variables or config
- Review shell commands before allowing exec
- Use workspace-only file access when possible
- Don't share session transcripts publicly

**Access control:**
- Telegram: Pairing mode (only paired users can message)
- WebChat: Token-protected (localhost only by default)
- Shell: Allowlist mode (safe binaries only without approval)

---

## What's Next?

**Things you can do:**
1. Set up morning briefings (weather + news)
2. Create automation workflows (monitoring, backups)
3. Build skills for recurring tasks
4. Integrate with other services (GitHub, APIs)
5. Document processes in workspace files

**Things I can help with:**
- Research and information gathering
- System administration and monitoring
- Documentation and note-taking
- Web scraping and data extraction
- Task scheduling and reminders
- Code execution and development

---

## Contact & Support

**OpenClaw Docs:** https://docs.openclaw.ai  
**Community:** https://discord.com/invite/clawd  
**Skills Hub:** https://clawhub.com  
**GitHub:** https://github.com/openclaw/openclaw

**Quick diagnostics:**
```bash
openclaw status        # Gateway status
openclaw doctor        # System health check
openclaw browser status # Browser control status
```

---

*This guide is maintained in your workspace. Feel free to edit it as we discover new capabilities or workflows together!*
