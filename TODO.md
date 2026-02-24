# TODO - Active Tasks

**Last Updated:** 2026-02-23

---

## 🔥 Today / This Week

- [ ] **Blood work - TOMORROW MORNING** ⚠️
  - **Time:** Between 7:00 AM - 9:00 AM
  - **Status:** ASAP - don't delay

- [ ] **Troubleshoot dashboard LAN access**
  - Gateway listening on 0.0.0.0:18789 but not accessible from phone or school laptop
  - Both hang at 20% loading progress
  - Works locally on ThinkPad
  - Possible firewall or auth issue - investigate later

- [x] ~~Confirm Bronson Hearing Center appointment~~ ✅
  - **Confirmed!** Appointment March 2 at 9:30 AM
  - Online check-in: https://mchrt.io/hcT9rm4kMo8xBZjWLWk
  
- [x] ~~Call ENT for referral appointment~~ (ear issue)
  - **Note:** Appointment already scheduled for March 2!

- [ ] **Career strategy check-in** (see CAREER.md for details)
  - Track protocol analyzer progress
  - Document wins/time savings
  - Watch for PD budget news (March)

---

## 📅 Upcoming / Scheduled

- **New Orleans Trip Planning**
  - [ ] Check with Lily on Wed (Mar 12) vs Thu (Mar 13) departure preference
  - [ ] Book flights once dates confirmed (Southwest from Chicago Midway recommended)
  - [ ] Book hotel (Dauphine Orleans or Hotel Le Marais suggested)
  - **Deadline:** Book soon for best prices

---

## 💡 Someday / Maybe

- **Set up Text-to-Speech (give Oscar a voice!)** 🎤
  - **Research complete:** See TTS-RESEARCH.md for full analysis
  - **Recommendation:** Start with ElevenLabs free tier (10k chars/month)
  - Use cases: phone calls, voice messages, audio summaries
  - Future: Local TTS on Z8 workstation for unlimited free generation
  - Options compared: ElevenLabs, OpenAI TTS, Google Cloud, local models
- **Set up Twilio for phone call automation** 🎯 ⚾
  - Get phone number (~$1/month) + pay-as-you-go calls (~$0.01/min)
  - Official API for making/receiving calls programmatically
  - Features: outbound calls, inbound routing, SMS, call recording, voicemail transcription
  - **KEY USE CASE:** Softball roster management (Wednesday games)
    - Text team on Monday for availability
    - Track responses, follow up with non-responders
    - Confirm roster by Tuesday
    - Send game day reminders Wednesday
    - See SOFTBALL-ROSTER.md for workflow
  - Other uses: appointment scheduling, calling businesses, automated reminders
  - Alternative: Browser automation with Google Voice (free but hacky)
- Consider setting up GitHub repo for workspace docs
- Explore Eat This Much automation (meal planning)
- Create systemd service for auto-starting headless browser
- Explore Nvidia Parakeet as Whisper alternative (current home Whisper feels slow vs Pixel 7 on-device)
- **Set up separate OpenClaw agent for Lily** (if interested - need to ask her first)
  - Message draft: `message-to-lily.txt`
  - Would use her Claude account API key
  - Separate workspace, totally isolated from Chris's
  - Separate Telegram chat or messaging surface
- **Model strategy optimization**
  - Default to Haiku for simple tasks, Sonnet for conversations/code review, Opus for hard problems
  - Consider local LLM on Z8 workstation (2x RTX 4000 Ada) for heartbeats/repetitive tasks
  - Potentially add OpenAI integration for load balancing
- **Share spec-builder skill repo with Oscar** (Chris needs to create separate repo for AI coding harness)
- **Token usage optimization system**
  - Created TOKEN-STRATEGY.md with full plan
  - Need to verify Claude Max tier (5x or 20x)
  - Need to find weekly reset day/time
  - Build usage tracking system
  - Create weekly review routine
  - Identify backlog of productive tasks for unused tokens
- **Remote access to OpenClaw dashboard via Tailscale**
  - Currently only accessible on home LAN (192.168.1.31:18789)
  - Set up Tailscale for secure access from outside network
  - OpenClaw has built-in Tailscale support (currently mode: "off" in config)

---

## ✅ Done

- [x] Set up morning briefing automation (Kalamazoo weather + AI dev news)
- [x] Create USER-GUIDE.md documentation
- [x] Configure headless browser for web scraping
- [x] Research New Orleans flights and hotels

---

## 📝 Notes

**How to use this file:**
- Add tasks as they come up
- Move things between sections as priorities change
- Check boxes with `[x]` when done
- I'll help keep this updated and remind you about deadlines
