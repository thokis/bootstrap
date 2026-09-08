# bootstrap

Personal Ubuntu setup as Ansible: a from-source dwm/st X session with the
supporting tooling. One role per area.

```bash
uv sync                                                  # control-node deps (once)
uv run ansible-galaxy collection install -r requirements.yml   # once
uv run ansible-playbook site.yml --ask-become-pass       # everything
uv run ansible-playbook site.yml --ask-become-pass --tags st   # one role
uv run ansible-playbook site.yml --ask-become-pass --tags wm   # window-manager stack
```

Bootstrap (`system`, `uv`, `secrets`) runs first — start it from a tty or SSH,
not the GUI. The `secrets` role needs OpenBao creds in the environment
(`source scripts/load-creds.sh`); see [its README](roles/secrets/README.md).

## Roles

| Role | What |
|---|---|
| [system](roles/system/README.md) | base packages + console boot (bootstrap) |
| [uv](roles/uv/README.md) | uv Python tool manager |
| [secrets](roles/secrets/README.md) | GitHub SSH key from OpenBao |
| [nodejs](roles/nodejs/README.md) | Node.js via nvm (Neovim/Mason tooling) |
| [pyenv](roles/pyenv/README.md) | pyenv + pyenv-virtualenv |
| [neovim](roles/neovim/README.md) | neovim from source + config; default editor |
| [xorg](roles/xorg/README.md) | X server + xinit |
| [dwm](roles/dwm/README.md) | tiling window manager (upstream + vendored patch) |
| [st](roles/st/README.md) | terminal (upstream + vendored patch) |
| [dmenu](roles/dmenu/README.md) | launcher (upstream, stock) |
| [slstatus](roles/slstatus/README.md) | status bar (templated config.h) |
| [xsecurelock](roles/xsecurelock/README.md) | screen locker |
| [shell](roles/shell/README.md) | bash env: oh-my-bash + managed dotfiles |
| [desktop](roles/desktop/README.md) | X session glue: .xinitrc, dotfiles, scripts, fonts |

To add a role, scaffold it with `ansible-galaxy role init roles/<area>`, list it
in `site.yml`, and give it a short README. `pre-commit install` sets up linting
on commit.
