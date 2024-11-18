#!/bin/bash
# Autor: Juan Manuel Mena Hernandez
# Descripción: Verifica si la primera cadena está ordenada alfabéticamente con respecto a la segunda.

# Verifica que se pasen exactamente dos argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <cadena1> <cadena2>"
    exit 1
fi

# Asigna los argumentos a variables para mayor claridad
cadena1=$1
cadena2=$2

# Compara las cadenas alfabéticamente
if [[ "$cadena1" < "$cadena2" ]]; then
    echo "La cadena '$cadena1' está alfabéticamente antes que '$cadena2'."
else
    echo "La cadena '$cadena1' no está alfabéticamente antes que '$cadena2'."
fi
