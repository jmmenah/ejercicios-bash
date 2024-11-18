#!/bin/bash
# Autor: Juan Manuel Mena Hernandez
# Descripción: Comprueba si existe el archivo .profile en el directorio base del usuario dado.
# Si no existe, lo copia desde /etc/skel y establece los permisos correspondientes.

# Verifica que se pase exactamente un argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <nombre de usuario>"
    exit 1
fi

# Asigna el argumento a una variable para mayor claridad
usuario=$1

# Obtén el directorio base del usuario
directorio_base=$(getent passwd "$usuario" | cut -d: -f6)

# Verifica si el usuario existe en el sistema
if [ -z "$directorio_base" ]; then
    echo "Error: El usuario $usuario no existe."
    exit 1
fi

# Verifica si el archivo .profile ya existe
if [ -f "$directorio_base/.profile" ]; then
    echo "El archivo .profile ya existe en el directorio base de $usuario."
else
    # Si no existe, copia el archivo desde /etc/skel
    cp /etc/skel/.profile "$directorio_base/.profile"
    
    # Cambia los permisos a -rw-r--r--
    chmod 644 "$directorio_base/.profile"
    
    # Verifica si la operación tuvo éxito
    if [ $? -eq 0 ]; then
        echo "Archivo .profile copiado exitosamente al directorio base de $usuario y permisos establecidos."
    else
        echo "Error al copiar el archivo .profile."
    fi
fi
