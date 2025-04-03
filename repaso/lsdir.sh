#!/bin/bash

# Verificar si se pasa un argumento
if [ $# -ne 1 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

# Asignar el directorio pasado como argumento
directorio="$1"

# Verificar si el directorio existe
if [ ! -d "$directorio" ]; then
    echo "Error: El directorio '$directorio' no existe."
    exit 1
fi

# Listar los subdirectorios y contar sus elementos
for dir in "$directorio"/*/; do
    # Verificar si es un directorio
    if [ -d "$dir" ]; then
        # Contar los elementos dentro del directorio
        count=$(ls -1q "$dir" | wc -l)
        # Mostrar el nombre del directorio y el número de elementos
        echo "$(basename "$dir") ($count elementos)"
    fi
done
