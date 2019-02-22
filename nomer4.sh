#!/bin/bash

key=$(date +"%H")

input="/var/log/syslog"

low=abcdefghijklmnopqrstuvwxyz
low=$low$low
upper=ABCDEFGHIJKLMNOPQRSTUVWXYZ
upper=$upper$upper

syslogupdate=$(date +"%H:%M %d-%m-%Y")
cat $input | tr [${low:26}${upper:26}] [${low:$key:26}${upper:$key:26}] > "$syslogupdate"
