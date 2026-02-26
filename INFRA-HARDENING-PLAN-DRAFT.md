# Infrastructure Hardening Plan (Draft)

Date: 2026-02-25
Owner: Oscar
Status: Draft for Chris approval

## Scope
Tier 1-2 hardening items requested:
1. Disable lid-close sleep
2. UFW firewall policy for LAN-only gateway access
3. Tighten file permissions under ~/.openclaw

---

## 1) Disable Lid-Close Sleep (logind + BIOS)

### Recommended OS config (systemd-logind)
Edit `/etc/systemd/logind.conf`:

```ini
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
LidSwitchIgnoreInhibited=yes
```

Apply:
```bash
sudo systemctl restart systemd-logind
```

Verify:
```bash
grep -E 'HandleLidSwitch|LidSwitchIgnoreInhibited' /etc/systemd/logind.conf
loginctl show-logind | grep -i Lid
```

### BIOS/UEFI check (ThinkPad)
- Boot BIOS setup
- Disable sleep-on-lid-close / set to "Do nothing" when available
- Ensure AC power behavior does not force suspend

### Risk/notes
- Prevents background jobs from stopping when lid is closed.
- Slightly higher battery drain if left unplugged.

---

## 2) UFW Firewall Rules (SSH + Gateway on LAN only)

### Policy
- Default deny incoming
- Allow outgoing
- Allow SSH
- Allow gateway port 18789 only from local subnet (example: 192.168.1.0/24)

### Draft commands
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow from 192.168.1.0/24 to any port 18789 proto tcp
sudo ufw deny 18789/tcp
sudo ufw enable
sudo ufw status verbose
```

### Optional tightening
If SSH only needed from LAN:
```bash
sudo ufw delete allow 22/tcp
sudo ufw allow from 192.168.1.0/24 to any port 22 proto tcp
```

### Risk/notes
- If subnet differs, replace `192.168.1.0/24` before applying.
- Apply while physically present at machine to avoid lockout.

---

## 3) File Permission Tightening (~/.openclaw)

### Targets
- `~/.openclaw` directory: `700`
- Credential/token files: `600`

### Draft commands
```bash
chmod 700 ~/.openclaw
find ~/.openclaw -type d -exec chmod 700 {} \;
find ~/.openclaw -type f -name "*auth*" -exec chmod 600 {} \;
find ~/.openclaw -type f -name "*token*" -exec chmod 600 {} \;
find ~/.openclaw -type f -name "*.key" -exec chmod 600 {} \;
```

### Safer audit-first flow
```bash
find ~/.openclaw -maxdepth 3 -printf "%M %u %g %p\n" > ~/.openclaw-perms-before.txt
# apply targeted chmods
find ~/.openclaw -maxdepth 3 -printf "%M %u %g %p\n" > ~/.openclaw-perms-after.txt
```

---

## Proposed Implementation Order
1. Audit current state (UFW status, subnet, current file perms)
2. Apply file permission hardening
3. Apply logind lid-switch config
4. Apply UFW rules with LAN allowlist
5. Validate: gateway reachable on LAN, SSH works, no public exposure

## Rollback Plan
- UFW rollback:
```bash
sudo ufw disable
```
- logind rollback: revert values in `/etc/systemd/logind.conf`, restart service
- permission rollback: restore from `~/.openclaw-perms-before.txt` as needed

## Approval Needed
Please approve before execution. I have only drafted and documented the plan.
