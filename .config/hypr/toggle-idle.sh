#!/bin/bash
if pgrep -x hypridle >/dev/null; then
  pkill hypridle
  notify-send "Hypridle" "Idle lock/suspend disabled (caffeine mode)"
else
  hypridle &
  notify-send "Hypridle" "Idle lock/suspend enabled"
fi
