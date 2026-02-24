# Dashboard Proposal - Simple Overview Site

**Goal:** Quick, mobile-friendly view of your TODO, Calendar, and recent activity - accessible from anywhere via Tailscale

---

## Layout Concept

### **Single-Page Dashboard** (Clean & Scannable)

```
┌─────────────────────────────────┐
│  Oscar's Dashboard    🔄 Updated │
│  Mon Feb 23, 6:30 PM            │
├─────────────────────────────────┤
│                                 │
│  🔥 TODAY / THIS WEEK           │
│  ────────────────────           │
│  [ ] Blood work tomorrow 7-9am  │
│  [x] Confirm Bronson appt ✓     │
│  [ ] New Orleans: check dates   │
│                                 │
│  + 2 more upcoming              │
│  [Expand All]                   │
│                                 │
├─────────────────────────────────┤
│                                 │
│  📅 NEXT 7 DAYS                 │
│  ────────────────               │
│  Tue Feb 24                     │
│    • Blood work (7-9am)         │
│                                 │
│  Sun Mar 2                      │
│    • Bronson Hearing (9:30am)   │
│                                 │
│  Wed-Sat Mar 12-15              │
│    • New Orleans (pending)      │
│                                 │
│  [Show Full Calendar]           │
│                                 │
├─────────────────────────────────┤
│                                 │
│  ✅ RECENTLY COMPLETED          │
│  ────────────────────           │
│  • Set up morning briefing      │
│  • Configure headless browser   │
│  • Create USER-GUIDE.md         │
│                                 │
│  [Show All]                     │
│                                 │
├─────────────────────────────────┤
│                                 │
│  💡 QUICK ACTIONS               │
│  ────────────────               │
│  [View Full TODO]               │
│  [View Full Calendar]           │
│  [Recent Notes]                 │
│  [Talk to Oscar] ← opens chat   │
│                                 │
└─────────────────────────────────┘
```

---

## Features

### **Core Display (Always Visible)**

**1. Today/This Week Section**
- Shows top 3-5 urgent tasks
- Checkboxes (just visual, not interactive for v1)
- Color coding:
  - 🔴 Overdue
  - 🟡 Due today/tomorrow
  - ⚪ This week
- "Expand All" button to see full TODO list

**2. Next 7 Days Calendar**
- Grouped by day
- Only shows days with events
- Time + brief description
- "Show Full Calendar" expands to 30 days

**3. Recently Completed**
- Last 3-5 completed tasks
- Shows you made progress
- Auto-populated from TODO.md "Done" section

**4. Quick Actions**
- Links to full TODO.md, CALENDAR.md (formatted nicely)
- Link to open chat with me (OpenClaw control UI)
- Maybe "Add Quick Note" later

---

## Technical Approach

### **Option A: Static HTML + Auto-Refresh (Simplest)**

**How it works:**
- I generate a static HTML file every time TODO/CALENDAR changes
- File lives at `~/.openclaw/workspace/dashboard.html`
- You bookmark `http://100.x.x.x:8080/dashboard.html` (Tailscale IP)
- Page auto-refreshes every 60 seconds (or manual refresh)

**Pros:**
- Dead simple, works immediately
- No server needed (just serve the file via Python's http.server)
- Mobile-friendly (responsive CSS)

**Cons:**
- Not real-time (60-second delay max)
- Can't check off tasks from the dashboard (view-only)

### **Option B: Live Server + WebSocket (Fancier)**

**How it works:**
- Small Node.js/Python server watches TODO/CALENDAR files
- Pushes updates to dashboard instantly via WebSocket
- Could add interactive features (check off tasks from phone)

**Pros:**
- Real-time updates
- Could add interactivity later
- Feels more app-like

**Cons:**
- More complex setup
- Another service to run

---

## Recommended Approach (Start Simple)

**Phase 1 (Now):**
- Static HTML dashboard
- Auto-generated whenever TODO/CALENDAR changes
- Served via simple Python HTTP server
- Mobile-responsive design
- Auto-refresh every 60 seconds

**Phase 2 (Later, if you want):**
- Add WebSocket for instant updates
- Make tasks interactive (check them off from phone)
- Add "Quick Add" task button
- Integrate with OpenClaw chat

---

## Visual Style

**Design Philosophy:** Clean, scannable, mobile-first

**Colors:**
- Background: Dark mode friendly (dark gray #1e1e1e or light #f5f5f5)
- Accent: Blue for links, green for completed, red/orange for urgent
- Text: High contrast, large enough to read on phone

**Typography:**
- Sans-serif font (system default for speed)
- 16px base size (readable on mobile)
- Bold headers, clear hierarchy

**Layout:**
- Single column (perfect for phone)
- Generous padding/spacing (easy to tap)
- Collapsible sections (keep it compact)

---

## Update Strategy

**How the dashboard stays current:**

1. **File Watcher:** I monitor TODO.md and CALENDAR.md for changes
2. **Auto-Regenerate:** Whenever either file changes, I rebuild the HTML
3. **Your View:** Your phone sees the update on next refresh (max 60 seconds)

**Manual Updates:**
- You tell me "update the dashboard" and I regenerate it
- Or just edit TODO.md/CALENDAR.md and I detect the change

---

## Mobile Considerations

**Key Requirements:**
- Works on small screens (iPhone SE to iPhone Pro Max)
- Touch-friendly targets (minimum 44px tap areas)
- Fast loading (minimal CSS/JS, no frameworks)
- Works offline (cached locally once loaded)
- No login required (protected by Tailscale network)

**Nice-to-Haves:**
- Add to home screen icon (PWA manifest)
- Swipe to refresh gesture
- Dark mode toggle

---

## Security

**Since it's on Tailscale:**
- No password needed (Tailscale handles auth)
- Only accessible to devices on your tailnet
- Can't be accessed from public internet
- Simple is safe (no database, no user input initially)

---

## File Structure

```
~/.openclaw/workspace/
├── dashboard.html          ← The dashboard (generated)
├── dashboard-style.css     ← Styling (clean, mobile-first)
├── dashboard-script.js     ← Minimal JS (auto-refresh, expand/collapse)
├── TODO.md                 ← Source data
├── CALENDAR.md             ← Source data
└── dashboard-server.py     ← Simple HTTP server (optional)
```

---

## Example "Today" Section (HTML Preview)

```html
<section class="urgent">
  <h2>🔥 Today / This Week</h2>
  
  <div class="task high-priority">
    <input type="checkbox" disabled>
    <span class="task-text">Blood work tomorrow 7-9am</span>
    <span class="task-meta">Due: Tue 7:00 AM</span>
  </div>
  
  <div class="task completed">
    <input type="checkbox" checked disabled>
    <span class="task-text">Confirm Bronson appt</span>
    <span class="task-meta">✓ Completed</span>
  </div>
  
  <button class="expand-btn">+ 2 more upcoming</button>
</section>
```

---

## Next Steps (If You Approve)

1. **Build v1 HTML template** (clean, mobile-first design)
2. **Write generator script** (converts TODO/CALENDAR to HTML)
3. **Set up file watcher** (auto-rebuild on changes)
4. **Test locally** (before Tailscale setup)
5. **Deploy** (simple Python server on port 8080)
6. **Access via Tailscale** (from your phone)

**Timeline:** Could have v1 working in ~30 minutes once we start

---

## Questions to Consider

1. **Dark mode or light mode** (or both with toggle)?
2. **Show completed tasks** or hide them to reduce clutter?
3. **How many days ahead** for calendar (7, 14, 30)?
4. **Auto-refresh interval** (60 seconds, or manual only)?
5. **Want weather widget** on dashboard (since I grab it daily anyway)?

---

## Alternative: Just Serve Markdown

**Ultra-simple option:**
- Serve TODO.md and CALENDAR.md as-is
- Use a markdown viewer on your phone
- No HTML generation needed

**Pros:** Zero work, ready immediately  
**Cons:** Not as pretty, less mobile-optimized

---

**Ready to build when you say go!** Let me know what you think and what adjustments you'd like.
