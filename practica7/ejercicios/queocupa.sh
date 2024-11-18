#!/bin/bash
# Autor: Juan Manuel Mena Hernandez
# Verifica si se han proporcionado los argumentos necesarios
if [ "$#" -ne 3 ]; then
    echo "Uso: $0 <directorio> <extensión> <número>"
    exit 1
fi

# Argumentos
directorio=$1
extension=$2
numero=$3

# Verifica si el directorio existe
if [ ! -d "$directorio" ]; then
    echo "Error: El directorio '$directorio' no existe."
    exit 1
fi

# Encuentra los archivos con la extensión dada, calcula su tamaño y los ordena
find "$directorio" -type f -name "*$extension" -exec du -b {} + | sort -n -r | head -n "$numero"