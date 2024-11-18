#!/bin/bash
# Autor: Juan Manuel Mena Hernandez
# Verifica que se pasen exactamente 2 argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <número de campo> <fichero>"
    exit 1
fi

# Asigna los argumentos a variables para mayor claridad
campo=$1
fichero=$2

# Verifica que el primer argumento sea un número positivo
if ! [[ "$campo" =~ ^[0-9]+$ ]]; then
    echo "Error: $campo no es un número válido."
    exit 1
fi

# Verifica que el segundo argumento sea un fichero legible
if [ ! -f "$fichero" ]; then
    echo "Error: $fichero no es un fichero válido."
    exit 1
fi

# Extrae el campo especificado usando cut, ordena y encuentra duplicados
duplicados=$(cut -d: -f"$campo" "$fichero" | sort | uniq -d)

# Verifica si hay duplicados y los muestra
if [ -z "$duplicados" ]; then
    echo "No se encontraron valores duplicados en el campo $campo del fichero $fichero."
else
    echo "Se encontraron los siguientes valores duplicados en el campo $campo del fichero $fichero:"
    echo "$duplicados"
fi
