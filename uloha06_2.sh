#!/bin/bash
x=$RANDOM
cat countrycodes_en.csv | sed '1d' | tr -d \" > /tmp/a$x
cat kodyzemi_cz.csv | sed '1d' | tr -d \" > /tmp/b$x
join -t ';' -1 1 -2 4 /tmp/a$x /tmp/b$x | cut -d \; -f 1
rm /tmp/[ab]$x
