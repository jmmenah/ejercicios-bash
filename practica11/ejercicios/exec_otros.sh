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
        # Obtener los permisos del archivo usando stat
        perms=$(stat -c "%A" "$file")

        # Extraer los permisos de grupo y otros
        group_perms=${perms:4:3}  # Posiciones 4-6
        other_perms=${perms:7:3}  # Posiciones 7-9

        # Verificar si hay permisos de lectura o escritura para el grupo o para otros
        if [[ "$group_perms" == *r* || "$group_perms" == *w* || "$other_perms" == *r* || "$other_perms" == *w* ]]; then
            echo "El archivo '$file' tiene permisos de lectura o escritura activados para el grupo o para otros usuarios."
        fi
    fi
done
