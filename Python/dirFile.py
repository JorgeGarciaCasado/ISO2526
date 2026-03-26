#Autor: Jorge García Casado
#Fecha: 25/03/2026
import os
import shutil as su
rutas = open("rutas.txt","r")
l = rutas.readlines()

ficheros=[]
directorios=[]
for i in l:
    st = i.strip()
    if os.path.isfile(st):
        ficheros.append(st)
    if os.path.isdir(st):
        directorios.append(st)
while True:
    print("====================================================")
    print("A.Pedir nombre de fichero y eliminarlo")
    print("B.Pedir nombre de directorio y mostrar info")
    print("C.Pedir nombre de fichero, nombre destino y copiarlo")
    print("D.Mostrar lista elegida por el usuario")
    print("E.Salir")
    op = input("Dime una opcion ")
    match op:
        case "A":
            nf = input("dime el nombre del fichero ")
            contador = 0
            for i in ficheros:
                nombref = os.path.basename(i)
                if nf == nombref:
                    if os.path.isfile:
                        print("borrando...")
                        os.system("rm "+i)
                        print("hecho")
                        contador = contador + 1
                    else:
                        print("Error no es un fichero")
            if contador == 0:
                print("error el directorio no existe")
        case "B":
            nd = input("Dime el nombre del directorio ")
            contador = 0
            for i in directorios:
                nombred = os.path.basename(i)
                if nd == nombred:
                    if os.path.isdir:
                        print("mostrando")
                        os.system("ls -l "+i)
                        contador = contador + 1
                    else:
                        print("Error no es un directorio")
            if contador == 0:
                print("error el directorio no existe")
        case "C":
            origen = input("dime el fichero de origen ")
            destino = input("Dime la ruta de destino ")
            if os.path.isfile(origen):
                if os.path.isdir(destino):
                    print("copiando...")
                    su.copy(origen,destino)
                    print("hecho")
                else:
                    print("Error el destino no es un directorio")
            else:
                print("Error el origen no es un fichero")
        case "D":
            lista = input("Dime la lista que quieres mostrar ")
            if lista == "ficheros":
                print("mostrando...")
                print(ficheros)
            if lista == "directorios":
                print("mostrando...")
                print(directorios)
        case "E":
            print("saliendo...")
            exit()
        case _:
            print("opcion incorrecta")

rutas.close()
