#!/bin/bash
# Autor: Juan Manuel Mena Hernández
# Descripción: Borra archivos con una extensión específica que sean anteriores a una fecha dada.

# Comprobación de número de argumentos
if [ "$#" -ne 3 ]; then
    echo "Uso: $0 <directorio> <fecha> <extensión>"
    exit 1
fi

# Asigna los argumentos a variables
directorio=$1
fecha=$2
extension=$3

# Verifica si el directorio existe
if [ ! -d "$directorio" ]; then
    echo "Error: El directorio '$directorio' no existe o no es accesible."
    exit 1
fi

# Convierte la fecha dada a formato comparable (YYYY-MM-DD)
fecha_comparable=$(date -d "$fecha" +%Y-%m-%d)

# Recorre los archivos con la extensión especificada en el directorio
for archivo in "$directorio"/*$extension; do
    # Verifica si el archivo existe (para evitar errores si no hay coincidencias)
    if [ -f "$archivo" ]; then
        # Obtiene la fecha de modificación del archivo
        fecha_modificacion=$(ls --full-time "$archivo" | awk '{print $6}' | cut -d. -f1)

        # Compara la fecha de modificación con la fecha dada
        if [[ "$fecha_modificacion" < "$fecha_comparable" ]]; then
            # Si la fecha de modificación es anterior a la fecha dada, borra el archivo
            rm "$archivo"
            echo "Archivo borrado: $archivo"
        fi
    fi
done
