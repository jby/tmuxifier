#! /usr/bin/env bash
source "../../test-helper.sh"
source "${root}/lib/layout-helpers.sh"

#
# new_window() tests.
#

# When called without arguments, creates new window.
create-test-session
stub __go_to_window_or_session_path
assert "test-socket-window-count" "1"
new_window
assert "test-socket-window-count" "2"
assert "stub_called_times __go_to_window_or_session_path" "1"
restore __go_to_window_or_session_path
kill-test-session

# When called with name argument, creates new window with specified name.
create-test-session
stub __go_to_window_or_session_path
assert "test-socket-window-count yippieezzz" "0"
new_window "yippieezzz"
assert "test-socket-window-count" "2"
assert "test-socket-window-count yippieezzz" "1"
restore __go_to_window_or_session_path
kill-test-session

# When called with name and command argument, creates new window with
# specified name and executes given command.
rm "/tmp/tmuxifier-new_window-test" &> /dev/null
create-test-session
stub __go_to_window_or_session_path
new_window "foobardoo" "touch /tmp/tmuxifier-new_window-test; bash"
assert "test-socket-window-count" "2"
assert "test-socket-window-count foobardoo" "1"
assert_raises 'test -f "/tmp/tmuxifier-new_window-test"' 0
restore __go_to_window_or_session_path
kill-test-session
rm "/tmp/tmuxifier-new_window-test" &> /dev/null


# Tear down.
kill-test-server

# End of tests.
assert_end "new_window()"
