# secrets

Fetches the GitHub SSH private key from **OpenBao** (`https://bao.helios9.org`,
KV v2 at `secret/ssh/github`) and installs it to `~/.ssh/github` (`0600`), plus a
`github.com` `IdentityFile` entry in `~/.ssh/config` so ssh uses that non-default
key name for the `git@github.com` forks the later roles clone. Runs early (right
after `system`), before any clone.

Auth is **AppRole**, read from the environment (`ANSIBLE_HASHI_VAULT_ADDR`,
`ANSIBLE_HASHI_VAULT_AUTH_METHOD=approle`, `ANSIBLE_HASHI_VAULT_ROLE_ID`,
`ANSIBLE_HASHI_VAULT_SECRET_ID`). Load them with
**`source scripts/load-creds.sh`**, which mints a fresh secret_id over SSH to
helios9 and exports the vars into your shell (never written to disk); then run
`ansible-playbook site.yml` yourself. The lookup runs on the **controller**; the
key is written onto the target. Every secret-touching task is `no_log: true`.

Controller prerequisites: the `community.hashi_vault` collection (in
`requirements.yml`) and the `hvac` Python library — declared in `pyproject.toml`,
so `uv sync` installs both into the project venv. Run the playbook inside it
(`uv run ansible-playbook ...` or activate `.venv`). SSH to helios9 is only used
by `scripts/load-creds.sh` to mint the secret_id, not by the playbook run.

Vars: `secrets_kv_mount`, `secrets_ssh_key_path`, `secrets_ssh_key_field`,
`secrets_ssh_key_dest`.
