#!/bin/bash
# usage: popup.sh <shell|ai> <parent-session> <dir> <client> [--no-attach]
kind=$1; shift
if [ "$kind" = ai ]; then s="popup-ai-$1" apps="claude codex"; else s="popup-$1" apps=bash; fi
if tmux has -t "=$s" 2>/dev/null; then
  [ "$kind" = shell ] &&
    [ "$(tmux display -p -t "=$s:bash" '#{pane_current_command}')" = bash ] &&
    tmux send-keys -t "=$s:bash" " cd $(printf %q "$2") && clear" Enter
else
  for app in $apps; do
    command -v "$app" >/dev/null || continue
    if tmux has -t "=$s" 2>/dev/null; then
      tmux new-window -d -n "$app" -t "=$s:" -c "$2" "$app"
    else
      tmux new -d -s "$s" -n "$app" -c "$2" "$app"
    fi
  done
  tmux has -t "=$s" 2>/dev/null || { tmux display -c "$3" "none of: $apps"; exit 1; }
fi
[ "$4" = --no-attach ] ||
  tmux display-popup -c "$3" -E -w 40% -h 40% -d "$2" "tmux attach -t $(printf %q "=$s")"
