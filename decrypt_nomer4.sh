#!/bin/bash

low=abcdefghijklmnopqrstuvwxyz
low=$low$low
upper=ABCDEFGHIJKLMNOPQRSTUVWXYZ
upper=$upper$upper

filename=$1
key=${filename:0:2}
syslogupdate="${filename}_decrypt"

awk '{print}' "$filename" | tr [${low:$key:26}${upper:$key:26}] [${low:0:26}${upper:0:26}] > "$syslogupdate"
