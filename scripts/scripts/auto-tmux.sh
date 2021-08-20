#!/bin/sh
session="chat"
tmux start-server
tmux new-session -d -s $session
tmux send-keys "toxic" C-m
tmux new-window
tmux send-keys "weechat" C-m
tmux new-window 
tmux attach-session -t $session
