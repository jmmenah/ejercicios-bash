#!/bin/bash
# Autora: Lina García Cabrera
# Descripción: Recibe dos argumentos una ruta y un email
# extrae parte de la ruta y del email
# Verificamos dos argumentos (ruta y email)
if [ $# -ne 2 ]
then
    echo "Uso: $0 <ruta_al_archivo> <correo_electronico>"
else
    # Asignamos los argumentos a variables
    ruta="$1"
    email="$2"
    # Extraemos directorio del archivo
    directorio="${ruta%/*}"
    # Extraemos el nombre del archivo completo
    nombre_completo="${ruta##*/}"
    # Extraemos el nombre del archivo sin extensión
    nombre_sin_extension="${nombre_completo%.*}"
    # Extraemos la extensión del archivo
    extension="${nombre_completo#*.}"
    # Extraemos el nombre de usuario del email
    usuario_email="${email%%@*}"
    # Extraemos el dominio del email
    dominio_email="${email##*@}"
    # Mostramos los resultados
    echo "Ruta completa: $ruta"
    echo "Nombre completo del directorio: $directorio"
    echo "Nombre completo del archivo: $nombre_completo"
    echo "Nombre del archivo sin extensión:$nombre_sin_extension"
    echo "Extensión del archivo: $extension"
    echo "Nombre de usuario del email: $usuario_email"
    echo "Dominio del email: $dominio_email"
fi