# terminal-setup

Ghostty + tmux + zsh (Starship) for Fedora.

| File | Linked to |
|---|---|
| `ghostty-config` | `~/.config/ghostty/config` |
| `tmux.conf` | `~/.tmux.conf` |
| `zshrc` | `~/.zshrc` |
| `starship.toml` | `~/.config/starship.toml` |
| `bin/*` | `~/.local/bin/*` |

```bash
bash terminal-setup/install.sh     # symlinks; old files are backed up, never deleted
bash terminal-setup/wire-claude.sh # once: feeds the Claude usage widget in the tmux bar
```

Secrets (e.g. `SOURCEGRAPH_ACCESS_TOKEN`) live in `~/.config/secrets.zsh` (chmod 600),
sourced by `zshrc`, and are not part of this repo.

Prompt notes: AWS shows only when `AWS_PROFILE` is set; Kubernetes context is always on
(narrow it with `detect_files` in `[kubernetes]`); `pyenv`/`sdk` are lazy-loaded.
