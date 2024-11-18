#!/bin/bash
# Autor: Francisco de Asís Conde Rodríguez
# Descripción: Comprueba si los dos argumentos que se dan
# son iguales.
if [ ${#} -ne 2 ]
then
    echo "Error. No se han dado dos argumentos"
else
    if [ ${1} = ${2} ]
    then
        echo "Error. Los argumentos son iguales"
    fi
fi
