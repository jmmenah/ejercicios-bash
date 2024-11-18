#!/bin/bash
# Autor: Juan Manuel Mena Hernández
# Descripción: Muestra los 'n' ficheros con más espacio ocupado en un directorio con una extensión específica.

# Verifica que se pasen exactamente tres argumentos
if [ "$#" -ne 3 ]; then
    echo "Uso: $0 <directorio> <extensión> <número>"
    exit 1
fi

# Asigna los argumentos a variables
directorio=$1
extension=$2
numero=$3

# Verifica que el primer argumento sea un directorio
if [ ! -d "$directorio" ]; then
    echo "Error: '$directorio' no es un directorio válido."
    exit 1
fi

# Verifica que el segundo argumento sea una extensión válida (comienza con .)
if [[ "$extension" != .* ]]; then
    echo "Error: La extensión '$extension' debe comenzar con un punto (.)"
    exit 1
fi

# Verifica que el tercer argumento sea un número válido
if ! [[ "$numero" =~ ^[0-9]+$ ]]; then
    echo "Error: '$num' debe ser un número entero."
    exit 1
fi

# Encuentra los ficheros con la extensión dada, calcula el espacio ocupado y ordena por tamaño
find "$directorio" -type f -name "*$extension" -exec du -b {} + | sort -n -r | head -n "$numero"
