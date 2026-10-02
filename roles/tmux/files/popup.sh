#!/bin/bash
# usage: popup.sh <parent-session> <dir> <client> [--no-attach]
s="popup-$1"
if tmux has -t "=$s" 2>/dev/null; then
  [ "$(tmux display -p -t "=$s:bash" '#{pane_current_command}')" = bash ] &&
    tmux send-keys -t "=$s:bash" " cd $(printf %q "$2") && clear" Enter
else
  tmux new -d -s "$s" -c "$2" claude
  tmux new-window -d -n bash -t "=$s:" -c "$2"
fi
[ "$4" = --no-attach ] ||
  tmux display-popup -c "$3" -E -w 40% -h 40% -d "$2" "tmux attach -t $(printf %q "=$s")"
