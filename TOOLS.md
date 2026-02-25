# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## Email

### My Email Account
- **Address:** oscar.claw.ai@gmail.com
- **Display Name:** Oscar
- **Client:** Himalaya (CLI email client)
- **Config:** `/home/oscar/.config/himalaya/config.toml`

### Sending Emails

**Basic send (plain text):**
```bash
cat << 'EOF' | himalaya message send
To: recipient@example.com
From: oscar.claw.ai@gmail.com
Subject: Your subject here

Your message body here.
EOF
```

**Send with multiple recipients:**
```bash
cat << 'EOF' | himalaya message send
To: person1@example.com, person2@example.com
Cc: person3@example.com
From: oscar.claw.ai@gmail.com
Subject: Your subject

Message body
EOF
```

**Send from a file:**
```bash
cat /path/to/file.txt | himalaya message send
```

**Send text message (SMS/MMS via email):**

⚠️ **One-way communication only** - I can send texts, but SMS replies don't route back to my inbox.

```bash
# Text Chris
cat << 'EOF' | himalaya message send
To: 2692707761@mypixmessages.com
From: oscar.claw.ai@gmail.com
Subject: 

Your message here
EOF

# Text Lily
cat << 'EOF' | himalaya message send
To: 2692547560@mypixmessages.com
From: oscar.claw.ai@gmail.com
Subject: 

Your message here
EOF
```

**Gateway details:**
- Chris: `2692707761@mypixmessages.com` (Xfinity Mobile/Verizon) - **WORKING ✅**
- Lily: `2692547560@vtext.com` (Verizon) - **WORKING ✅**
  - `@vtext.com` - WORKS (text-only, use this)
  - `@vzwpix.com` - WORKS (MMS alternative)
  - `@mypixmessages.com` - FAILED (didn't deliver)

**Verizon Gateway Recommendations:**
- **Use `@vtext.com` for Lily** - proven reliable
- Use `@vzwpix.com` as backup if MMS needed
- Avoid `@mypixmessages.com` - delivery failures

**Known Issue:** Verizon email-to-SMS gateways vary in reliability by email provider and gateway. Testing showed:
- Gmail → @vtext.com: ✅ Works
- Gmail → @vzwpix.com: ✅ Works  
- Gmail → @mypixmessages.com: ❌ Failed

**Other useful commands:**
```bash
# Check inbox
himalaya envelope list

# Read a message
himalaya message read <envelope-id>

# Full help
himalaya --help
himalaya message --help
```

### SMTP Details (for reference)
- **SMTP Server:** smtp.gmail.com
- **Port:** 465 (TLS)
- **Auth:** App password (stored in config)

### Limitations
- ⚠️ **No attachment support** - Himalaya CLI doesn't handle attachments well
- **Workaround:** Include file contents directly in email body using `cat filename`

---

## GitHub Repositories

### Chris's Projects (READ-ONLY)
- **telemetry-v2** (citterly/telemetry-v2) - Race car telemetry analyzer
  - **Role:** Consultant/code reviewer only
  - **Rule:** Read, analyze, suggest - NO COMMITS OR PUSHES without explicit permission
  - **Location:** `/home/oscar/.openclaw/workspace/telemetry-v2`

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

Add whatever helps you do your job. This is your cheat sheet.
