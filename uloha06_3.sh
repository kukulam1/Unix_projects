#!/bin/bash
x=$RANDOM
users=-1
sort -t : -k 4 /etc/group | cut -d : -f 1,4 | sed '1!G;h;$!d' > /tmp/a$x
cut -d : -f 1 /tmp/a$x > /tmp/b$x
cut -d : -f 2 /tmp/a$x | sed 's/,/ /g' | awk '{print NF}' > /tmp/c$x
paste /tmp/b$x /tmp/c$x -d : | sort -t : -k 2 | sed '1!G;h;$!d' > /tmp/a$x
cut -d : -f 1 /tmp/a$x > /tmp/b$x
cut -d : -f 2 /tmp/a$x > /tmp/c$x
#zde mame v suboru ..b.. jmena skupin a v ..c.. pocet clenu a "cteme" je po radkach, soubory b c jsou stejne serazene
while [ $users -le $(head -n 1 /tmp/c$x) ] ; do
      echo $(head -n 1 /tmp/b$x)
      users=$(head -n 1 /tmp/c$x)
      sed -i '1d' /tmp/b$x
      sed -i '1d' /tmp/c$x 
done
rm /tmp/[abc]$x
