#!/bin/bash
# Autor: Juan Manuel Mena Hernandez
# Descripción: Comprueba si un directorio existe, si no, lo crea. Luego le da permisos drwx------.

# Verifica que se pase exactamente un argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <nombre del directorio>"
    exit 1
fi

# Asigna el argumento a una variable para mayor claridad
directorio=$1

# Comprueba si el directorio ya existe
if [ -d "$directorio" ]; then
    echo "El directorio '$directorio' ya existe."
else
    # Crea el directorio si no existe
    mkdir "$directorio"
    if [ $? -eq 0 ]; then
        echo "El directorio '$directorio' ha sido creado."
    else
        echo "Error al crear el directorio '$directorio'."
        exit 1
    fi
fi

# Cambia los permisos a drwx------
chmod 700 "$directorio"

# Verifica si el cambio de permisos fue exitoso
if [ $? -eq 0 ]; then
    echo "Se han asignado los permisos drwx------ al directorio '$directorio'."
else
    echo "Error al cambiar los permisos del directorio '$directorio'."
    exit 1
fi
