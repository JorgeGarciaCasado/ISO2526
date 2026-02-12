#Autor: Jorge García Casado
#Fecha: 12/02/26

#!/bin/bash

clear

if [ !  $USER == "root" 2>/dev/null ]; then
	echo "Error. No eres root"
	exit
fi

if [ $# -eq 1 ]; then
	referencia=$1
else
	referencia=1000
fi

lineas=$(cat /etc/passwd)
echo "==============================="
echo
echo "Informe de ususarios el día $(date +"%d-%m-%Y") a las $(date +"%H:%M")"
for l in $lineas ; do
	u=$(echo $l |  cut -f 3 -d ":")
        user=$(echo $l | cut -f 1 -d ":")
	if [ $u -ge $referencia 2>/dev/null ]; then
		echo "$user - $u"
	fi
done
echo
echo "==============================="
echo "$(date +"%d-%m-%Y") - $(date +"%H:%M") El usuario $USER ha solicitado un informe de usuarios" >> /tmp/logeventos
