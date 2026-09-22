TMUX_NEW_SESSION_NAME=$(whiptail --inputbox "New tmux session name?" 10 40 3>&1 1>&2 2>&3) \
    && tmux new-session -d -A -s "$TMUX_NEW_SESSION_NAME" \; switch-client -t "$TMUX_NEW_SESSION_NAME"
