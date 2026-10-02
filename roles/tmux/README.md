# tmux

Installs tmux + xclip and deploys `~/.tmux.conf` and `~/.tmux/popup.sh`.

Alt-g toggles a centred popup per tmux session (`popup-<session>`) with a
`bash` shell that `cd`s to the current pane's path on every open. Alt-c toggles a second popup
(`popup-ai-<session>`) with windows `claude` and `codex`. Windows whose
command is not installed are skipped. Copies go to the X clipboard via xclip.

Vars: `tmux_packages`.
