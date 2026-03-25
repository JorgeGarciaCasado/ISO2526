#Autor: Jorge García Casado
#Fecha: 24/03/2026
import os
from cpuinfo import get_cpu_info

info = get_cpu_info()

lineas=open("/etc/passwd","r")
uid = os.getuid()

if uid == 0:
    while True:
        print("===============================")
        print("1.Mostrar Información SSOO.")
        print("2.Pedir un usuario o crear")
        print("3.Pedir un directorio o crearlo")
        print("4.Salir")
        print("===============================")
        op = int(input("Dime una opción "))
        match op:
            case 1:
                print("nombre del SSOO:",os.uname().sysname)
                print("nombre del nodo:",os.uname().nodename)
                print("release",os.uname().release)
                print("arquitectura:",os.uname().machine)
                print("version",os.uname().version)
                print("Procesador:", info["brand_raw"])
            case 2:
                u = input("Dime el usuario ")
                contador = 0
                for i in lineas:
                    usuario = i.split(":",1)[0]
                    if usuario == u:
                        print(i)
                        contador = contador + 1
                if contador == 0:
                    print("Creando usuario")
                    os.system("useradd "+u)
            case 3:
                d = input("Dime un directorio ")
                if os.path.exists(d):
                    if os.path.isdir(d):
                        print("existe y si es un directorio")
                else:
                    print("creando carpeta")
                    os.mkdir(d)
                    print("hecho")
            case 4:
                print("saliendo...")
                exit()
else:
    print("Error no eres root")

lineas.close()
