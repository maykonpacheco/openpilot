#!/usr/bin/bash

cd /data/openpilot/selfdrive/boardd
pkill ./manager.py
./boardd

cd /data/openpilot/
python3 doors.py -l