if [ "$1" = "--typ" ]; then
      
   if test -h "$2"; then
        echo "symbolicky link"
      elif test -f "$2" ; then
        echo soubor
      elif test -d "$2" ; then
        echo "adresar"
      elif test -c "$2" ; then
        echo "znakove zaradeni" 
      elif test -b "$2" ; then
        echo "blokove zarazeni" 
      elif test -S "$2" ; then
        echo "socket" 
      elif test -p "$2" ; then
        echo "fifo" 
      else 
        echo Chyba    
   fi 

elif [ "$1" = "--help" ]; then
   echo "Pouziti: uloha01.sh [--typ|--help] [cesta_k_souboru]
  --typ		popis typu souboru
  --help	popis funkce programu

Exit status:
  0 program funguje dle ocekevani
  1 program nefunguje dle ocekavani (soubor nenalezen, chybny vstup...)"

else 
  echo Chyba
fi

