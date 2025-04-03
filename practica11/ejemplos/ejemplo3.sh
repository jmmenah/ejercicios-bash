#!/bin/bash
# Autor: Francisco de Asís Conde Rodríguez
# Descripción: Recibe como argumento una palabra y
# la escribe al revés (su palíndromo)
if [ ${#} -ne 1 ]
then
    echo "Error. Debes escribir un sólo argumento."
else
    i=$(( ${#1} - 1 ))
    palindromo="" # Variable para acumular el palíndromo
    while [ ${i} -ge 0 ]
    do
        # Extraemos el carácter actual y lo añadimos al palíndromo.
        palindromo="${palindromo}${1:$i:1}"
        i=$(( ${i} - 1 ))
    done
    echo "El palíndromo es: $palindromo" # Mostramos el resultado.
fi