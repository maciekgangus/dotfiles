#!/usr/bin/env bash
# Map the Huion H430P (OpenTabletDriver) to the Gigabyte Aorus FO32U2 on GNOME Wayland.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
P=/org/gnome/desktop/peripherals/tablets/0000:0000   # OTD virtual tablet (vid:pid 0000:0000)

# GNOME side: whole tablet -> Aorus only, no aspect cropping
dconf write "$P/output" "['GBT', 'AORUS FO32U2', '0x01010101', 'HDMI-2']"
dconf write "$P/area" '[0.0, 0.0, 0.0, 0.0]'
dconf write "$P/keep-aspect" false
dconf write "$P/mapping" "'absolute'"

# OpenTabletDriver side (display area must match its fixed 5632x1728 virtual range)
mkdir -p ~/.config/OpenTabletDriver
[ -f ~/.config/OpenTabletDriver/settings.json ] && cp ~/.config/OpenTabletDriver/settings.json{,.bak-$(date +%s)}
cp "$here/opentabletdriver-settings.json" ~/.config/OpenTabletDriver/settings.json
systemctl --user restart opentabletdriver
echo "done"
