#!/bin/bash

# Directorio bin del usuario
bin_dir="$HOME/bin"

# Verificar si el directorio ~/bin existe
if [ ! -d "$bin_dir" ]; then
    echo "Error: El directorio $bin_dir no existe."
    exit 1
fi

# Inicializar el contador
counter=0

# Recorrer todos los archivos en el directorio ~/bin
for file in "$bin_dir"/*; do
    # Verificar si es un archivo regular y si es un script (por ejemplo, con la extensión .sh)
    if [ -f "$file" ] && [[ "$file" == *.sh ]]; then
        # Obtener el nombre del archivo sin el directorio y sin la extensión .sh
        filename=$(basename "$file" .sh)
        
        # Generar el nuevo nombre con el formato nombre.###.sh
        new_name=$(printf "%s.%03d.sh" "$filename" "$counter")
        
        # Renombrar el archivo
        mv "$file" "$bin_dir/$new_name"
        
        # Incrementar el contador
        ((counter++))
        
        echo "Renombrado: $filename.sh a $new_name"
    fi
done
