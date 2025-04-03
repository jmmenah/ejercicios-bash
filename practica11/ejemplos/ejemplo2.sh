#!/bin/bash
# Autor: Francisco de Asís Conde Rodríguez
# Descripción: Recibe como argumento una palabra y
# la escribe al revés (su palíndromo)
if [ ${#} -ne 1 ]
then
    echo "Error. Debes escribir un sólo argumento."
else
    i=$(( ${#1} - 1 ))
    while [ ${i} -ge 0 ] # 1
    do
        echo -n ${1:${i}:1} # 2
        i=$(( ${i} - 1 ))
    done
    echo # 3
fi