# terminal

Makes ghostty the default terminal for everything on GNOME 46 / glib 2.80 and
installs the CaskaydiaCove Nerd Font (ghostty `font-family`, nvim icons). It
expects ghostty to already be installed (it comes from a non-apt source), and its
settings live in `defaults/main.yml`. Log out or reboot after the first run — the
keystone shim only lands on `$PATH` at login.

| Piece | Controls |
|---|---|
| `~/.local/bin/xdg-terminal-exec` → ghostty | **keystone.** Ctrl+Alt+T + every `Terminal=true` launch (incl. nvim on a text file). glib tries this on `$PATH` before gnome-terminal. |
| `update-alternatives x-terminal-emulator` → ghostty | tools calling `x-terminal-emulator` directly |
| `python3-nautilus` + `ghostty.py` | Files right-click "Open in Ghostty" |
| dconf custom0/custom1 | Super+Return → ghostty, Shift+Super+Return → ghostty+tmux |

- `x-scheme-handler/terminal` mime = **not** the terminal-launch path; parity only.
- gnome-terminal removal pulls xterm unless ghostty is installed (`Provides: x-terminal-emulator`); role removes gnome-terminal + its nautilus ext + xterm.

Verify:
```bash
readlink ~/.local/bin/xdg-terminal-exec            # /usr/bin/ghostty
readlink -f /etc/alternatives/x-terminal-emulator  # /usr/bin/ghostty
command -v gnome-terminal xterm                    # absent
```
