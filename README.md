# bootstrap

Personal Ubuntu setup as Ansible: a stock GNOME desktop with ghostty, neovim and
the supporting tooling. One role per area.

```bash
uv sync                                                  # control-node deps (once)
uv run ansible-galaxy collection install -r requirements.yml   # once
uv run ansible-playbook site.yml --ask-become-pass       # everything
uv run ansible-playbook site.yml --ask-become-pass --tags gnome   # one role
```

Bootstrap (`system`, `uv`, `secrets`) runs first. The `secrets` role needs
OpenBao creds in the environment (`source scripts/load-creds.sh`); see [its README](roles/secrets/README.md).

## Roles

| Role | What |
|---|---|
| [system](roles/system/README.md) | base packages + boot setup (bootstrap) |
| [uv](roles/uv/README.md) | uv Python tool manager |
| [secrets](roles/secrets/README.md) | GitHub SSH key from OpenBao |
| [nodejs](roles/nodejs/README.md) | Node.js via nvm (Neovim/Mason tooling) |
| [pyenv](roles/pyenv/README.md) | pyenv + pyenv-virtualenv |
| [neovim](roles/neovim/README.md) | neovim from source + config; default editor |
| [shell](roles/shell/README.md) | bash env: oh-my-bash + managed dotfiles |
| [gnome](roles/gnome/README.md) | stock GNOME session: GDM, keyring, ssh agent; dwm cleanup |
| [terminal](roles/terminal/README.md) | ghostty as the default terminal + Nerd Font |
| [tmux](roles/tmux/README.md) | tmux config + Alt-g Claude popup |

To add a role, scaffold it with `ansible-galaxy role init roles/<area>`, list it
in `site.yml`, and give it a short README. `pre-commit install` sets up linting
on commit.
