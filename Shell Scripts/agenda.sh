#Autor: Jorge García Casado
#Fecha: 29/01/2026

#!/bin/bash

clear

while true; do

	echo "=======OPCIONES======="
	echo "a) Añadir una entrada"
	echo "b) Buscar por DNI"
	echo "c) ver la agenda completa"
	echo "d) eliminar todas las entradas de la agenda"
	echo "e) Finalizar"
	echo
	read -p "Selecciona una opción " opcion

	case $opcion in

		a)

			clear
			read -p "Dime el DNI " dni
			resultado=$(grep "$dni:" agenda.txt | cut -f 1 -d ":")
			if [ "$resultado" == "$dni" 2>/dev/null ]; then
				echo "El usuario ya existe"
			else
				read -p "Dime el nombre " nombre
				read -p "Dime los apellidos " apellidos
				read -p "Dime la localidad " localidad
				clear
				echo "$dni:$nombre:$apellidos:$localidad" >> agenda.txt
				echo "Añadido correctamente a la agenda"
				echo
			fi

		;;
		b)
			clear
			read -p "Dime el DNI " dni
			resultado=$(grep "$dni:" agenda.txt | cut -f 1 -d ":")
			if [ "$resultado" == "$dni" 2>/dev/null ]; then
				nombre=$(grep "$dni:" agenda.txt | cut -f 2 -d ":")
				apellidos=$(grep "$dni:" agenda.txt | cut -f 3 -d ":")
				localidad=$(grep "$dni:" agenda.txt | cut -f 4 -d ":")
				echo "La persona con DNI número $dni es: $nombre $apellidos, y vive en $localidad"
			else
				echo "Error. No existe ese registro"
			fi
		;;

		c)

			if [ -s "agenda.txt" ]; then
				clear
				cat agenda.txt
				echo
			else
				clear
				echo "La agenda esta vacía"
			fi

		;;

		d)

			clear
			echo > agenda.txt
			echo "borrando la agenda"

		;;

		e)

			echo "Finalizando...."
			exit
		;;
		*)

			echo "Error. opción incorrecta"
		;;
	esac

done
