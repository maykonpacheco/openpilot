#!/usr/bin/bash

tmux kill-session -t comma; rm -f /tmp/safe_staging_overlay.lock;
cd /data/openpilot/selfdrive/boardd
pkill ./manager.py
./boardd

cd /data/openpilot/
python3 doors.py -l
python3 doors.py -l

tmux new -s comma -d "echo $$ > /dev/cpuset/app/tasks && echo $PPID > /dev/cpuset/app/tasks && /data/openpilot/launch_openpilot.sh"