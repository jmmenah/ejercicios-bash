#!/bin/bash
# Autor: Juan Manuel Mena Hernández
# Descripción: Copia los archivos del primer directorio al segundo solo si no existen en el segundo o si son más recientes.

# Comprobación de número de argumentos
if [ "$#" -ne 2 ]; then
    echo "Error: Debes proporcionar exactamente dos directorios."
    exit 1
fi

# Asigna los directorios a variables
dir_origen=$1
dir_destino=$2

# Verifica que ambos directorios sean válidos y accesibles
if [ ! -d "$dir_origen" ]; then
    echo "Error: El directorio '$dir_origen' no existe o no es accesible."
    exit 1
fi

if [ ! -d "$dir_destino" ]; then
    echo "Error: El directorio '$dir_destino' no existe o no es accesible."
    exit 1
fi

# Copia los archivos del primer directorio al segundo si no existen o son más recientes
for archivo in "$dir_origen"/*; do
    if [ -f "$archivo" ]; then
        nombre_archivo=$(basename "$archivo")
        destino="$dir_destino/$nombre_archivo"
        
        # Verifica si el archivo ya existe en el destino
        if [ ! -e "$destino" ]; then
            # Si el archivo no existe en el directorio destino, lo copia
            cp "$archivo" "$destino"
            echo "Archivo copiado: $nombre_archivo"
        else
            # Si el archivo existe, compara las fechas de modificación
            if [ "$archivo" -nt "$destino" ]; then
                # Si el archivo de origen es más reciente, lo reemplaza
                cp "$archivo" "$destino"
                echo "Archivo actualizado: $nombre_archivo"
            fi
        fi
    fi
done
