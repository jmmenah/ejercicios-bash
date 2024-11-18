#!/bin/bash
# Autor: Juan Manuel Mena Hernández
# Descripción: Busca números duplicados en un campo específico de un fichero de configuración.

# Comprobación de número de argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <número de campo> <fichero>"
    exit 1
fi

# Asigna los argumentos a variables
campo=$1
fichero=$2

# Verifica que el fichero sea legible
if [ ! -r "$fichero" ]; then
    echo "Error: No se puede leer el fichero '$fichero'."
    exit 1
fi

# Verifica que el campo sea un número válido
if ! [[ "$campo" =~ ^[0-9]+$ ]]; then
    echo "Error: '$campo' debe ser un número entero."
    exit 1
fi

# Busca números duplicados en el campo especificado del fichero
cut -d: -f"$campo" "$fichero" | sort | uniq -d
