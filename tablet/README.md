# tablet

Huion H430P via OpenTabletDriver, mapped to the Gigabyte Aorus FO32U2 (HDMI-2) on GNOME Wayland.

Install: `bash tablet/install.sh`

Notes:
- GNOME key: `org.gnome.desktop.peripherals.tablets/0000:0000` (the OTD virtual tablet). Keep `HDMI-2` as the 4th `output` element; `keep-aspect=false`; `area` all zeros.
- OTD `AbsoluteModeSettings.Display` must stay 5632x1728 @ (2816, 864): the virtual device has a fixed 5632x1728 axis range. Setting it to the monitor's pixel size makes the Y axis hypersensitive.
- A system update can reset the GNOME keys: rerun `install.sh`.
- Fallback: GNOME Settings -> Tablet -> pick the OTD virtual tablet, choose the Aorus, turn off keep aspect ratio.
