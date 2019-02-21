#!/bin/bash

awk -F ',' '{ if($7 == '2012') i[$1]+=$10} END {for (x in i){print i[x]" "x}}' ~/Downloads/WA_Sales_Products_2012-14.csv | sort -rn | head -1

printf "\n"

awk -F ',' '{ if($7 == "2012" && $1 == "United States") i[$4]+=$10} END {for (x in i){print i[x]" "x}}' ~/Downloads/WA_Sales_Products_2012-14.csv | sort -rn | head -3

printf "\n"

awk -F ',' '{ if($7 == '2012' && $1 == "United States" && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) i[$6]+=$10} END {for (x in i){print i[x]" "x}}' ~/Downloads/WA_Sales_Products_2012-14.csv | sort -rn | head -3
