#!/bin/bash
# opraveny mezery v nazvech souboru a parametry skriptu
if [ $# = 2 -a "$1" = "-r" ] ; then
    find "$2" -type f -exec sh -c '
          if [ "$(echo "$0" | sed '\''s/\(.*\)\/\(.*\)/\1\/\L\2/'\'')" = "$0" ]; then
                 mv "$0" "$(echo "$0" | sed '\''s/\(.*\)\/\(.*\)/\1\/\U\2/'\'')"
          fi ' {} ';'
elif
  [ "$1" = "-r" ]; then
    find ./ -type f -exec sh -c '
          if [ "$(echo "$0" | sed '\''s/\(.*\)\/\(.*\)/\1\/\L\2/'\'')" = "$0" ]; then
                 mv "$0" "$(echo "$0" | sed '\''s/\(.*\)\/\(.*\)/\1\/\U\2/'\'')"
          fi ' {} ';'
elif 
  [ "$1" != "" ]; then
    find "$1" -type f -exec sh -c '
          if [ "$(echo "$0" | sed '\''s/\(.*\)\/\(.*\)/\1\/\U\2/'\'')" = "$0" ]; then
                 mv "$0" "$(echo "$0" | sed '\''s/\(.*\)\/\(.*\)/\1\/\L\2/'\'')"
          fi ' {} ';'     
else 
    find ./ -type f -exec sh -c '
          if [ "$(echo "$0" | sed '\''s/\(.*\)\/\(.*\)/\1\/\U\2/'\'')" = "$0" ]; then
                 mv "$0" "$(echo "$0" | sed '\''s/\(.*\)\/\(.*\)/\1\/\L\2/'\'')"
          fi ' {} ';'
fi
