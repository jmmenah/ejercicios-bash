#!/bin/bash
# Autor: Juan Manuel Mena Hernandez
# Verifica si se han proporcionado los argumentos necesarios
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <fichero_entrada> <fichero_salida>"
    exit 1
fi

# Argumentos
fichero_entrada=$1
fichero_salida=$2

# Verifica si el fichero de entrada existe
if [ ! -f "$fichero_entrada" ]; then
    echo "Error: El fichero '$fichero_entrada' no existe."
    exit 1
fi

# Quita las líneas duplicadas y guarda el resultado en el fichero de salida
cat $fichero_entrada | sort | uniq -d > $fichero_salida

# Confirmación
echo "Las líneas únicas se han guardado en '$fichero_salida'."