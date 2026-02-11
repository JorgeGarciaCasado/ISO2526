#Autor: Jorge García Casado
#Fecha: 10/02/26

#!/bin/bash

clear

if [ ! $# -eq 2 ]; then
	echo "Error. Debes de introducir 2 parametros"
	echo "Cerrando..."
	exit
fi
if [ -f "$1" ]; then
	echo "Error. El fichero existe"
	echo "Cerrando..."
	exit
fi
if [ ! -d "$2" ]; then
	echo "Error. El directorio no existe"
	echo "Cerrando..."
	exit
fi
directorio=$(ls $2 2>/dev/null)
if [ -z "$directorio" ] ; then
	echo "Error. El directorio está vacio"
	echo "Cerrando..."
	exit
fi
echo "Autor: Jorge García Casado"
echo
echo "Los ficheros con mas de 5 lineas encontrados son los siguientes"
echo
numeroficheros=0
for i in $2/*.txt ; do
	lineas=$(wc "$i" -l | cut -f 1 -d " ")
	if [ "$lineas" -ge 5 ]; then
		fichero=$(echo "$i" | rev | cut -f 1 -d "/" | rev)
		echo "$fichero"
		palabras=$(wc "$i" -w | cut -f 1 -d " ")
		echo "El fichero original tiene $palabras palabras" > "$i.q."
		cat "$i" >> "$i.q."
		echo "$fichero" >> "$1"
		numeroficheros=$((numeroficheros+1))
	fi
done
echo "El numero de ficheros identificados es $numeroficheros" >> "$1"

