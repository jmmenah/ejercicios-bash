#!/bin/bash

# Directorio bin del usuario
bin_dir="$HOME/bin"

# Verificar si el directorio ~/bin existe
if [ ! -d "$bin_dir" ]; then
    echo "Error: El directorio $bin_dir no existe."
    exit 1
fi

# Recorrer todos los archivos en el directorio ~/bin
for file in "$bin_dir"/*; do
    # Verificar si es un archivo regular
    if [ -f "$file" ]; then
        # Obtener el nombre del archivo sin el directorio
        filename=$(basename "$file")
        
        # Verificar si el archivo tiene una extensión diferente a .sh
        if [[ "$filename" != *.sh ]]; then
            # Renombrar el archivo añadiendo la extensión .sh
            mv "$file" "$bin_dir/$filename.sh"
            echo "Renombrado: $filename a $filename.sh"
        else
            echo "El archivo $filename ya tiene la extensión .sh, no se ha renombrado."
        fi
    fi
done
