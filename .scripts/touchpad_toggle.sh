#!/bin/bash
# AlpsPS/2 ALPS DualPoint TouchPad
id=$(xinput | grep "AlpsPS/2" | awk '{print $7}' | awk -F "=" '{print $2}')
enabled=`xinput --list-props $id | grep -e "Device Enabled\ (127):\s*1"`
 
if [ -n "$enabled" ]; then
  xinput --set-prop $id "Device Enabled" 0
else
  xinput --set-prop $id "Device Enabled" 1
fi
