# tmux

Installs tmux + xclip and deploys `~/.tmux.conf` and `~/.tmux/popup.sh`.

Alt-g toggles a centred popup per tmux session (`popup-<session>`): window 0
runs `claude` (closes when it exits), window `bash` is a shell that `cd`s to the
current pane's path on every open. Copies go to the X clipboard via xclip.

Vars: `tmux_packages`.
