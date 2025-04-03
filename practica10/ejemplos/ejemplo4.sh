#!/bin/bash
# Autor: Francisco de Asís Conde Rodríguez
# Descripción: Comprueba si existe o no un usuario
# analizando el archivo /etc/passwd
if [ ${#} -ne 1 ]
then
    echo "Error. Hay que escribir un argumento."
else
    while read linea # 2
    do
        usuario=`echo ${linea} | cut -d: -f1` # 3
        if [ ${1} = ${usuario} ] # 4
        then
            echo "El usuario ${1} existe"
            exit
        fi
    done < /etc/passwd # 1
    echo "El usuario ${1} no existe" # 5
fi