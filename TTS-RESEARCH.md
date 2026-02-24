# Text-to-Speech (TTS) Options for Oscar

**Created:** 2026-02-24  
**Goal:** Give Oscar a voice for phone calls, voice messages, and audio content

---

## Overview

Text-to-Speech would enable:
- **Phone calls** (via Twilio or similar)
- **Voice messages** sent to Chris/Lily
- **Audio summaries** of long documents
- **Podcast/audiobook generation** from written content
- **Voice notifications** for important alerts

---

## Option 1: ElevenLabs (Best Quality, Cloud-Based) 🎯

**Why it's #1:** Industry leader for realistic, emotional, natural-sounding AI voices.

### Pricing
- **Free tier:** 10,000 characters/month (~12-15 minutes of audio)
- **Starter:** $5/month - 30,000 characters (~30 min)
- **Creator:** $22/month - 100,000 characters (~100 min)
- **Pro:** $99/month - 500,000 characters (~500 min)
- **Pay-as-you-go:** Available on higher tiers

### Features
- 70+ languages
- Emotional control (happy, sad, excited, whispering, etc.)
- Voice cloning (could clone Chris's voice!)
- Multiple voice options
- Fast API response times
- Best-in-class naturalness

### Pros
- ✅ Most realistic voices available
- ✅ Easy API integration
- ✅ Free tier is generous for testing
- ✅ Python SDK available
- ✅ Voice cloning included on paid plans

### Cons
- ❌ Cloud-based (requires internet)
- ❌ Ongoing costs for heavy use
- ❌ Data sent to external servers

**Best for:** High-quality voice messages, phone calls, important audio content

---

## Option 2: OpenAI TTS (Good Quality, Easy Integration)

**Part of OpenAI API** - you already have ChatGPT Plus, could add API access.

### Pricing
- **$15 per 1M characters** (~16 hours of audio)
- Very affordable for moderate use
- No free tier (API only)

### Features
- 6 preset voices (Alloy, Echo, Fable, Onyx, Nova, Shimmer)
- Multiple models: `tts-1` (fast) and `tts-1-hd` (higher quality)
- Simple API integration
- Streaming support (low latency)

### Pros
- ✅ Affordable pricing
- ✅ Simple API
- ✅ Good quality voices
- ✅ Fast generation
- ✅ Already familiar with OpenAI ecosystem

### Cons
- ❌ Limited voice customization
- ❌ Not as natural as ElevenLabs
- ❌ Cloud-based only

**Best for:** Everyday use, simple voice messages, moderate volume

---

## Option 3: Local/Open-Source (Free, Private, Offline)

**Run TTS models on your own hardware** - completely free and private.

### Top Models (2026)
1. **Orpheus TTS 3B** - Newest breakthrough (Nov 2025), human-like emotional speech
2. **XTTS v2** - Excellent quality, voice cloning, multilingual
3. **Piper** - Fast, efficient, good quality
4. **Fish Audio** - High quality, open-source alternative to ElevenLabs

### Hardware Requirements
- **CPU only:** Works but slow (30+ seconds for short clips)
- **GPU recommended:** RTX 4000 Ada or similar (real-time generation)
- **Your Z8 workstation:** Perfect candidate! (2x RTX 4000 Ada = plenty of power)

### Pros
- ✅ Completely free (unlimited usage)
- ✅ 100% private (data never leaves your machine)
- ✅ Works offline
- ✅ Full customization
- ✅ No API rate limits

### Cons
- ❌ More complex setup
- ❌ Requires local compute resources
- ❌ Slightly lower quality than top cloud services
- ❌ May need GPU for real-time performance

**Best for:** High-volume usage, privacy-sensitive content, offline capability

---

## Option 4: Google Cloud TTS (Budget Option)

### Pricing
- **$4 per 1M characters** (Standard voices)
- **$16 per 1M characters** (WaveNet/Neural2 voices)
- Very cheap for moderate use

### Pros
- ✅ Very affordable
- ✅ Many language options
- ✅ Decent quality

### Cons
- ❌ Not as natural as ElevenLabs or OpenAI
- ❌ Requires Google Cloud account setup
- ❌ More complex API

**Best for:** Budget-conscious bulk generation

---

## Recommendation

### Start with: **ElevenLabs Free Tier** 🎯

**Why:**
- 10,000 characters/month is plenty for testing
- Best quality voices available
- Easy to upgrade if we like it
- Simple API integration

**Test plan:**
1. Sign up for free ElevenLabs account
2. Generate a few voice messages
3. Test with phone call automation (when Twilio is set up)
4. Monitor usage over first month

**If usage exceeds free tier:**
- **Low-medium use:** Upgrade to ElevenLabs Starter ($5/month)
- **High use:** Consider local TTS on Z8 workstation
- **Budget option:** Switch to OpenAI TTS ($15/1M chars)

### Future: Local TTS on Z8 Workstation

Once we have TTS working and know our usage patterns, **set up Orpheus TTS or XTTS v2 locally** on your Z8 workstation:
- Free unlimited generation
- Privacy for sensitive content
- Backup option if cloud services go down
- Can run 24/7 as a local API endpoint

---

## Use Cases by Priority

### High Priority (Use ElevenLabs)
- Phone calls (Twilio integration)
- Important voice messages to Chris
- Audio summaries of long reports

### Medium Priority (Could use OpenAI or local)
- Daily briefings read aloud
- Email summaries
- Meeting recaps

### Low Priority (Perfect for local TTS)
- Audiobook generation
- Documentation narration
- Bulk audio content

---

## Next Steps

1. **Immediate:** Sign up for ElevenLabs free tier
2. **Test:** Generate sample voice messages
3. **Document:** Add API key to OpenClaw config
4. **Integrate:** Build voice message function in TOOLS.md
5. **Future:** Set up local TTS on Z8 for unlimited free generation

---

## API Integration Notes

### ElevenLabs Python Example
```python
import requests

url = "https://api.elevenlabs.io/v1/text-to-speech/{voice_id}"
headers = {
    "xi-api-key": "YOUR_API_KEY",
    "Content-Type": "application/json"
}
data = {
    "text": "Hello Chris, this is Oscar speaking!",
    "model_id": "eleven_monolingual_v1",
    "voice_settings": {
        "stability": 0.5,
        "similarity_boost": 0.5
    }
}

response = requests.post(url, json=data, headers=headers)
with open("output.mp3", "wb") as f:
    f.write(response.content)
```

### OpenAI TTS Example
```python
from openai import OpenAI
client = OpenAI()

response = client.audio.speech.create(
    model="tts-1",
    voice="alloy",
    input="Hello Chris, this is Oscar speaking!"
)

response.stream_to_file("output.mp3")
```

---

**Decision needed:** Which option to start with? ElevenLabs free tier recommended, but open to alternatives!
