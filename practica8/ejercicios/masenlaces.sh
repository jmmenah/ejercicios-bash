#!/bin/bash
# Autor: Juan Manuel Mena Hernández
# Descripción: Muestra los n ficheros o directorios con más enlaces duros en el directorio dado.

# Comprobación de número de argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <directorio> <número>"
    exit 1
fi

# Asigna los argumentos a variables
directorio=$1
numero=$2

# Verifica que el primer argumento sea un directorio válido
if [ ! -d "$directorio" ]; then
    echo "Error: '$directorio' no es un directorio válido."
    exit 1
fi

# Verifica que el segundo argumento sea un número válido
if ! [[ "$numero" =~ ^[0-9]+$ ]]; then
    echo "Error: '$numero' debe ser un número entero."
    exit 1
fi

# Muestra los n ficheros o directorios con más enlaces duros
ls -l "$directorio" | tail -n +2 | sort -k2 -n -r | head -n "$numero"