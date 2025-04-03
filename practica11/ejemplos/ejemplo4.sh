#!/bin/bash
# Autor: Francisco
# Descripción: Imprime por pantalla una pirámide de
# asteriscos del tamaño que se pasa como
# argumento
if [ ${#} -ne 1 ] || [[ ${1} = *[^0-9]* ]] # 1
then
    echo "Error. Debes dar sólo un argumento numérico."
else
    if [ ${1} -gt 20 ] # 2
    then
        echo "Error. Número mayor que 20"
    else
        cad="********************" # 3
        i=1
        while [ ${i} -le ${1} ] # 4
        do
            printf "%${1}.${i}s%-${1}.${i}s\n" "${cad}" "${cad}" # 5
            i=$(( ${i}+1 ))
        done
    fi
fi
