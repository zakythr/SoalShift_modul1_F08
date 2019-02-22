#!/bin/bash

loop=1
order=1

while [ $loop -ne 0 ]
do
if [[ -f password$order.txt ]]
then order=$((order + 1))
else
cat /dev/urandom | tr -dc '0-9a-zA-Z0-9' | fold -w 12 | head -n 1 > password$order.txt
loop=0
fi
done
