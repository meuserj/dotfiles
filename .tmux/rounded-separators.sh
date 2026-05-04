#!/bin/sh
# Replace Powerline sharp separators with rounded ones
SHARP_R=$(printf '\xee\x82\xb0')   # U+E0B0
SHARP_RT=$(printf '\xee\x82\xb1')  # U+E0B1
SHARP_L=$(printf '\xee\x82\xb2')   # U+E0B2
SHARP_LT=$(printf '\xee\x82\xb3') # U+E0B3
ROUND_R=$(printf '\xee\x82\xb4')   # U+E0B4
ROUND_RT=$(printf '\xee\x82\xb5')  # U+E0B5
ROUND_L=$(printf '\xee\x82\xb6')   # U+E0B6
ROUND_LT=$(printf '\xee\x82\xb7') # U+E0B7

replace() {
  echo "$1" | sed "s/$SHARP_R/$ROUND_R/g; s/$SHARP_RT/$ROUND_RT/g; s/$SHARP_L/$ROUND_L/g; s/$SHARP_LT/$ROUND_LT/g"
}

tmux set -g  status-left "$(replace "$(tmux show -gv status-left)")"
tmux set -g  status-right "$(replace "$(tmux show -gv status-right)")"
tmux set -gw window-status-current-format "$(replace "$(tmux show -gvw window-status-current-format)")"
tmux set -gw window-status-format "$(replace "$(tmux show -gvw window-status-format)")"
