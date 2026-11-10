#!/usr/bin/env bash
# One-time: make Claude Code's statusLine feed the tmux usage widget.
# Your existing statusline command is wrapped, not replaced; settings.json is
# backed up first. Safe to run twice.
set -euo pipefail
python3 - <<'PY'
import json, os, shutil, time
f = os.path.expanduser("~/.claude/settings.json")
w = os.path.expanduser("~/.local/bin/claude-usage-cache")
d = json.load(open(f)) if os.path.exists(f) else {}
sl = d.get("statusLine") or {}
cur = (sl.get("command") or "").strip()
if "claude-usage-cache" in cur:
    print("already wired"); raise SystemExit
if os.path.exists(f):
    b = f + ".bak-" + time.strftime("%Y%m%d-%H%M%S"); shutil.copy2(f, b); print("backup:", b)
new = {"type": "command", "command": (w + " " + cur).strip()}
if "padding" in sl: new["padding"] = sl["padding"]
d["statusLine"] = new
os.makedirs(os.path.dirname(f), exist_ok=True)
json.dump(d, open(f, "w"), indent=2, ensure_ascii=False)
print("statusLine ->", new["command"])
PY
echo "Restart Claude Code and send one message; the tmux bar fills in after the first reply."
