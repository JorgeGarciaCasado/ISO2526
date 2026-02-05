#autor: Jorge García Casado
#Fecha: 04/02/26
#!/bin/bash

clear

	if [ ! $# -eq 2 ] ; then

		echo "Error. No has introducido los 2 parametros necesarios"
		echo "Cerrando..."
		exit
	fi
	if [ -f $1 ]; then

		echo "Error. El fichero historial ya existe"
		echo "Cerrando..."
		exit
	fi

e=0
while [ $e -lt $2 ] ; do

	echo "Autor: Jorge García Casado"
 	echo
	echo "======MENÚ DE OPCIONES======"
	echo "S. Sumar"
	echo "R. Restar"
	echo "M. Multiplicar"
	echo "D. Dividir"
	echo "X. Salir"
	echo "============================"
	echo
	read -p "elige opcion (opcion (operación) Op1(numero 1) Op2(numero 2)) " op op1 op2
	case $op in
		"S")

			suma=$((op1 + op2))
			echo "El resultado de la suma es $suma"
			echo "S $op1 $op2" >> $1
			e=$(($e+1))
		;;
		"R")
			resta=$((op1 - op2))
                        echo "El resultado de la resta es $resta"
                        echo "R $op1 $op2" >> $1
			e=$(($e+1))
		;;
		"M")
			mult=$((op1 * op2))
			echo "El resultado de la multiplicación es $mult"
			echo "M $op1 $op2" >> $1
			e=$(($e+1))
		;;
		"D")
			div=$((op1 / op2))
			echo "El resultado de la division es $div"
			echo "D $op1 $op2" >> $1
			e=$(($e+1))
		;;
		"X")
			echo "Saliendo"
			exit
		;;
		*)
			echo "Error. Opción icorrecta"
			e=$(($e+1))
		;;
	esac
done
echo
dir=$(pwd $1)
echo "La ruta del fichero es $dir"
cat $1 2>/dev/null
echo
echo "numero de ejecución superada, cerrando..."
