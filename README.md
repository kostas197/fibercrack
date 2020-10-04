# fibercrack
este es un script para utilizar aircrack con passwords de 10 digitos

se puede utilizar de la siguiente forma:

1) git clone https://github.com/kostas197/fibercrack.git
2) guardar los archivos .cap (generados por airdump-ng) en la misma carpeta "fibercrack"
3) ejecutarlo con la siguiente sintaxis

1er parametro, nombre de la red
2do parametro, archivo.cap
3ro parametro, comienzo número de DNI 25.XXX.XXX

./fibercrack.sh "Fiberxxxx2.4GHz"  "archivo.cap" "25"

El script funciona, con las siguientes dependencias.
aircrack-ng

Solo con fines educativos. Descargo de responsabilidad del mismo.
Uselo solo en redes en las que estés autorizado a hacer pentesting.
