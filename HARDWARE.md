# HARDWARE.md - System Specifications

## ThinkPad T460 (Model 20FN002NUS)

- **CPU:** Intel i5-6300U
- **RAM:** 16GB
- **Storage:** 480GB Samsung MZ7LM480HCHP (enterprise SSD)
- **OS Layout:** Dual-boot
  - Windows 11 Pro (~250GB)
  - Ubuntu 24.04.1 LTS (~195GB) ← **Oscar lives here**
- **Network:** WiFi, local IP `192.168.1.31`

## User Accounts

- **oscar** (me) — dedicated user for OpenClaw operations
- **chris** (human) — admin account, isolated from my operations

This separation keeps my processes, credentials, and file access cleanly isolated from Chris's personal stuff.

## Software Stack

- **Node.js:** v22.22.0
- **OpenClaw:** 2026.2.14 (c1feda1)
- **Model:** anthropic/claude-sonnet-4-5 via subscription auth (setup-token)
- **Shell:** bash

## Local Services
- **Whisper Transcriber:** http://192.168.1.14:7860
  - Health: GET /api/v1/health
  - Transcribe: POST /api/v1/transcribe (multipart/form-data, field: file)
  - List transcriptions: GET /api/v1/transcriptions

## Local Services
- **Whisper Transcriber:** http://192.168.1.14:7860
  - Health: GET /api/v1/health
  - Transcribe: POST /api/v1/transcribe (multipart/form-data, field: file)
  - List transcriptions: GET /api/v1/transcriptions
  - Model: base (cpu, int8)
