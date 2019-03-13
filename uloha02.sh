#!/bin/bash
if [ "$1" = "--normal" ]; then
  shift 1;
  for i in "$@"; do
     echo  $i;
  done

elif [ "$1" = "--reverse" ]; then
  shift 1;
  for i in "$@" ; do
        echo "$i" >> /tmp/qwe ;
  done  
  tac /tmp/qwe;
  rm /tmp/qwe;
# puvodni reseni 
# for i in $(seq $# -1 1); do 
#    echo ${!i}\ ;
# done
elif [ "$1" = "--subst" ]; then
  shift 1;
  x1=$1;
  x2=$2;
  shift 2;
  for i in "$@" ; do
     echo ${i//$x1/$x2};
  done
# puvodni reseni 
# for i in $(seq 3 $#); do
#    echo ${i//$1/$2};
# done
echo
elif [ "$1" = "--len" ]; then
   shift 1;
  for i in "$@"; do
     echo  "${#i}";
  done

elif [ "$1" = "--help" ]; then
  echo "Pouzitie: uloha02.sh [OPTION] [args]
  --normal	vypise vsechny argumety pocinaje druhym
  --reverse     vypise vsechny argumenty v opacnem poradi 
  --subst       substituuje vsechny podretezce shodne s parametrem 2 za parametr 3 v ostattnich parametrech a vypise je
  --len         vypise pocet znaku vsech parametru pocinaje druhym 
  --help	pomoc"
fi
