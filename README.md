# dotfiles

Personal config for Fedora.

| Directory | What | How to install |
|---|---|---|
| `terminal-setup/` | Ghostty, tmux, zsh + Starship, Claude usage widget | `bash terminal-setup/install.sh` |
| `nvim/` | Neovim (LazyVim) | `stow nvim` (or symlink `.config/nvim`) |
| `ssh/` | SSH client config | `stow ssh` (or symlink `.ssh_config`) |

See [`terminal-setup/README.md`](terminal-setup/README.md) for details.
Secrets never live here: use `~/.config/secrets.zsh` (chmod 600).
