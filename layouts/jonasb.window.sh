# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/jonasb"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "jonasb"

# Split window into panes.
#split_v 20
#split_h 50

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into active pane

# Set active pane.
#select_pane 0
hosts='pe1 tc01 isyspup1 psyspup1 foreman psysmon1 psysbkp1 psysbkp2 psysbkp3 psysbkp4 dsyspup1'

for host in $hosts
do
  tmuxifier-tmux new-window -t "${session-$(tmuxifier current-session)}:" -d -n "$host" "ssh $host"
done
# tmuxifier-tmux new-window -t "$session:" -d -n "pe1" "ssh pe1"
# tmuxifier-tmux new-window -t "$session:" -d -n "tc01" "ssh tc01"
# tmuxifier-tmux new-window -t "$session:" -d -n "isyspup1" "ssh isyspup1"
# tmuxifier-tmux new-window -t "$session:" -d -n "psyspup1" "ssh psyspup1"
# tmuxifier-tmux new-window -t "$session:" -d -n "foreman" "ssh foreman"
# tmuxifier-tmux new-window -t "$session:" -d -n "psysmon1" "ssh psysmon1"
# tmuxifier-tmux new-window -t "$session:" -d -n "psysbkp1" "ssh psysbkp1"
# tmuxifier-tmux new-window -t "$session:" -d -n "psysbkp2" "ssh psysbkp2"
# tmuxifier-tmux new-window -t "$session:" -d -n "dsyspup1" "ssh dsyspup1"
