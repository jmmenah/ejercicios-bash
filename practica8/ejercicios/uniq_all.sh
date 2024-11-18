#!/bin/bash
# Autor: Juan Manuel Mena Hernández
# Descripción: Elimina las líneas duplicadas (adyacentes o no) de un fichero y guarda el resultado en otro fichero.

# Verifica que se pasen exactamente dos argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <fichero_entrada> <fichero_salida>"
    exit 1
fi

# Asigna los argumentos a variables para mayor claridad
fichero_entrada=$1
fichero_salida=$2

# Comprueba si el fichero de entrada existe y es un fichero regular
if [ ! -f "$fichero_entrada" ]; then
    echo "Error: El fichero '$fichero_entrada' no existe o no es un fichero válido."
    exit 1
fi

# Usa sort y uniq para eliminar líneas duplicadas y guarda el resultado en el fichero de salida
sort "$fichero_entrada" | uniq -d > "$fichero_salida"

# Verifica si la operación tuvo éxito
if [ $? -eq 0 ]; then
    echo "Las líneas duplicadas han sido eliminadas. El resultado se guardó en '$fichero_salida'."
else
    echo "Error: No se pudo procesar el fichero."
    exit 1
fi
