#!/bin/bash
unzip /home/zaky/Downloads/nature.zip
File=/home/zaky/Downloads/nature/*
mkdir /home/zaky/Documents/naturejpg
tujuan=/home/zaky/Documents/naturejpg
i=0
for f in $File
do
	chmod 777 $f
	echo "ganti permission"
	#echo jadiin hexa
	base64 -d $f | xxd -r > $tujuan/$i.jpg
	let i=$i+1
done
#zip naturejpg.zip $target/*
#rm -r $target
#rm -r /home/zaky/Documents/nature
