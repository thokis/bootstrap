# nodejs

Installs Node.js via [nvm](https://github.com/nvm-sh/nvm) — matches the existing
per-user setup and provides `node`/`npm` for Neovim's Mason LSP/formatter
tooling. Runs before the `editor` role.

- Clones nvm to `{{ nodejs_nvm_dir }}` at `nodejs_nvm_version`.
- Ensures `~/.bashrc` sources nvm (own managed block).
- Installs and default-aliases `{{ nodejs_version }}` (skips if already present).

Vars: `nodejs_nvm_version`, `nodejs_nvm_dir`, `nodejs_version`.
