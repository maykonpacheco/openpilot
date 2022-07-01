#!/usr/bin/env python3

import sys
import time
from panda import Panda

unlockCommand = [0x40, 0x05, 0x30, 0x11, 0x00, 0x40, 0x00, 0x00]
lockCommand = [0x40, 0x05, 0x30, 0x11, 0x00, 0x80, 0x00, 0x00]
p = Panda()

def main():
  p.set_safety_mode(Panda.SAFETY_ALLOUTPUT)

  # args
  if len(sys.argv) != 2:
    sys.exit('usage$: doors.py --lock or --unlock')

  if sys.argv[1]  == '--lock' or sys.argv[1]  == '-l':
    print(f'command: {lockCommand}')
    p.can_send(0x750, bytes(unlockCommand), 0) 
    p.can_send(0x750, bytes(lockCommand), 0) 

  if sys.argv[1] == '--unlock' or sys.argv[1] == '-u':
    print(f'unlock command: {unlockCommand}')
    p.can_send(0x750, bytes(lockCommand), 0) 
    p.can_send(0x750, bytes(unlockCommand), 0) 

  time.sleep(0.2)
  p.set_safety_mode(Panda.SAFETY_TOYOTA)
  p.send_heartbeat()
  print('\n\n\nrelay ON again\nkthxbay\n')

main()
