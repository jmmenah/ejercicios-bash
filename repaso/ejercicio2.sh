#!/bin/bash

# Verificar que se hayan dado suficientes argumentos
if [ $# -lt 3 ]; then
    echo "Uso: $0 <nombre> <número de días> <directorio1> [<directorio2> ...]"
    exit 1
fi

# Asignar los argumentos a variables
nombre="$1"
dias="$2"
shift 2  # Moverse a los directorios

# Obtener la fecha de hoy en formato YYYY-MM-DD
fecha=$(date +%F)

# Verificar si el nombre termina en .tar.gz, si no, agregarlo
if [[ "$nombre" != *.tar.gz ]]; then
    nombre="$nombre.tar.gz"
fi

# Crear una lista de archivos modificados en los últimos n días
archivos=()
for dir in "$@"; do
    # Verificar si el directorio existe
    if [ ! -d "$dir" ]; then
        echo "Advertencia: El directorio '$dir' no existe, se omite."
        continue
    fi

    # Buscar los archivos modificados en los últimos n días en el directorio
    found_files=$(find "$dir" -type f -mtime -"$dias")
    archivos+=($found_files)
done

# Verificar si se han encontrado archivos
if [ ${#archivos[@]} -eq 0 ]; then
    echo "No se encontraron archivos modificados en los últimos $dias días."
    exit 1
fi

# Crear el archivo comprimido con los archivos encontrados
tar czf "$nombre" -C "$(dirname "${archivos[0]}")" $(basename -a "${archivos[@]}")

echo "Archivo comprimido creado: $nombre"
