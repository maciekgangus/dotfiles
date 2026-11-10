#!/usr/bin/env bash
# Installs Ghostty + tmux config by symlinking from this folder.
# Old files are moved (not deleted) into ~/.terminal-setup-backup-<timestamp>.
set -euo pipefail
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BK="$HOME/.terminal-setup-backup-$(date +%Y%m%d-%H%M%S)"

link() {
  local src=$1 dst=$2
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    [ "$(readlink -f "$dst")" = "$(readlink -f "$src")" ] && { echo "ok      $dst"; return; }
    mkdir -p "$BK"; mv "$dst" "$BK/$(echo "$dst" | tr / _)"
    echo "backup  $dst -> $BK"
  fi
  ln -s "$src" "$dst"; echo "linked  $dst"
}

# validate tmux config on a throwaway socket before touching anything
tmux -L ts-check -f "$SRC/tmux.conf" new-session -d -s chk
err=$(tmux -L ts-check show-messages 2>/dev/null | grep -iE 'error|unknown|invalid|not found' || true)
tmux -L ts-check kill-server 2>/dev/null || true
if [ -n "$err" ]; then echo "tmux config problem, aborting:"; echo "$err"; exit 1; fi
echo "tmux config validates"

link "$SRC/tmux.conf"       "$HOME/.tmux.conf"
link "$SRC/ghostty-config"  "$HOME/.config/ghostty/config"
link "$SRC/zshrc"           "$HOME/.zshrc"
link "$SRC/starship.toml"   "$HOME/.config/starship.toml"
for f in tmux-start claude-usage-cache claude-usage-segment; do link "$SRC/bin/$f" "$HOME/.local/bin/$f"; done

command -v ghostty >/dev/null && ghostty +validate-config || true
tmux info >/dev/null 2>&1 && { tmux source-file "$HOME/.tmux.conf" && echo "reloaded running tmux"; } || true
echo; echo "Claude usage widget: run  bash $SRC/wire-claude.sh  once."
echo "Done. Close all Ghostty windows and open a new one."
