#!/bin/bash

# Obtener el directorio base del usuario actual
base_dir="$HOME"

# Verificar si el directorio base existe
if [ ! -d "$base_dir" ]; then
    echo "Error: No se encontró el directorio base del usuario ($base_dir)."
    exit 1
fi

# Contador para el número de archivos core eliminados
core_count=0

# Buscar y eliminar archivos llamados "core"
find "$base_dir" -type f -name "core" -print0 | while IFS= read -r -d '' core_file; do
    # Eliminar el archivo
    rm -f "$core_file"
    # Incrementar el contador
    core_count=$((core_count + 1))
done

# Mostrar el número de archivos eliminados
echo "Se han eliminado $core_count archivo(s) core."
