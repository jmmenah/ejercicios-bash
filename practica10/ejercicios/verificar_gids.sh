#!/bin/bash

# Verificar si se han pasado argumentos
if [ $# -eq 0 ]; then
    echo "Uso: $0 <GID1> <GID2> ... <GIDn>"
    exit 1
fi

# Inicializar contadores
valid_count=0
invalid_count=0

# Leer todos los GIDs de /etc/group en un array
valid_gids=$(cut -d: -f3 /etc/group)

# Procesar cada argumento (GID) pasado al script
for gid in "$@"; do
    if [[ $valid_gids =~ (^|[[:space:]])"$gid"($|[[:space:]]) ]]; then
        echo "El GID $gid corresponde a un grupo válido."
        valid_count=$((valid_count + 1))
    else
        echo "El GID $gid no corresponde a ningún grupo válido."
        invalid_count=$((invalid_count + 1))
    fi
done

# Mostrar los resultados finales
echo "-------------------------------"
echo "GIDs válidos: $valid_count"
echo "GIDs no válidos: $invalid_count"
