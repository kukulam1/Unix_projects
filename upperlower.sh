#!/bin/bash
if [ "$1" != "-r" ] ; then
     for i in $(find ./ -type f); do    
          if [ "$(echo $i | sed 's/\(.*\)\/\(.*\)/\1\/\U\2/')" = "$i" ]; then 
                 mv $i $(echo $i | sed 's/\(.*\)\/\(.*\)/\1\/\L\2/') 
          fi 
     done
else
   for i in $(find ./ -type f); do
         if [ "$( echo $i | sed 's/\(.*\)\/\(.*\)/\1\/\L\2/')" = "$i" ]; then
                 mv $i $(echo $i | sed 's/\(.*\)\/\(.*\)/\1\/\U\2/') 
         fi 
     done
fi
