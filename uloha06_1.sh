#!/bin/bash
x=$RANDOM
sort social.txt > /tmp/a$x
sort actor.txt > /tmp/b$x
sort beverly_hills.txt > /tmp/c$x
join /tmp/a$x /tmp/b$x > /tmp/ab$x
join /tmp/ab$x /tmp/c$x > /tmp/abc$x
# zde joinute pouze podle prvniho jmena, musime overit prijmeni
cat /tmp/abc$x | awk '{ if ($2 == $3 && $3  == $4) print $1,$2 }'
rm /tmp/[a-c]*$x
