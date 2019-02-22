#!/bin/bash

awk '(/CRON/ || /cron/),!/sudo/' /var/log/syslog | awk 'NF < 13' >> /home/zaky/nomer5
