#!/bin/bash

# Verificar que se hayan dado dos argumentos
if [ $# -ne 2 ]; then
    echo "Uso: $0 <nombre> <directorio>"
    exit 1
fi

# Asignar los argumentos a variables
nombre="$1"
directorio="$2"

# Verificar si el directorio existe
if [ ! -d "$directorio" ]; then
    echo "Error: El directorio '$directorio' no existe."
    exit 1
fi

# Verificar si el nombre termina en .tar.gz, si no, agregarlo
if [[ "$nombre" != *.tar.gz ]]; then
    nombre="$nombre.tar.gz"
fi

# Crear el archivo comprimido tar.gz con los archivos del directorio (sin subdirectorios)
tar czf "$nombre" -C "$directorio" $(find "$directorio" -maxdepth 1 -type f -exec basename {} \;)

echo "Archivo comprimido creado: $nombre"
