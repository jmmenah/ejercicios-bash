#!/bin/bash
# Autor: Juan Manuel Mena Hernández
# Descripción: Lista el contenido de cada directorio accesible desde el directorio de trabajo actual.

# Comprobación de si se han pasado argumentos
if [ "$#" -eq 0 ]; then
    echo "Error: Debes proporcionar al menos un directorio."
    exit 1
fi

# Recorre cada argumento (directorio) y muestra su contenido
for dir in "$@"; do
    # Verifica si el directorio es accesible y existe
    if [ -d "$dir" ]; then
        echo "Contenido de '$dir':"
        ls -l "$dir"
    else
        echo "Advertencia: '$dir' no es un directorio válido o accesible desde el directorio actual."
    fi
    echo ""
done
