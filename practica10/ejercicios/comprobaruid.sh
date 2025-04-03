#!/bin/bash

# Comprobar si se pasaron los argumentos correctos
if [ $# -ne 1 ]; then
    echo "Uso: $0 <UID>"
    exit 1
fi

# Obtener el UID pasado como argumento
input_uid=$1

# Validar si el UID es un número
if ! [[ $input_uid =~ ^[0-9]+$ ]]; then
    echo "Error: El UID debe ser un número."
    exit 1
fi

# Inicializar variables
user_info=""
IFS=":"  # Establecer el separador de campos como ":"

# Leer el archivo /etc/passwd línea por línea
while read -r username password uid gid rest; do
    if [ "$uid" -eq "$input_uid" ]; then
        user_info="$username:$password:$uid:$gid"
        break
    fi
done < /etc/passwd

# Verificar si se encontró un usuario con ese UID
if [ -z "$user_info" ]; then
    echo "No se encontró ningún usuario con UID $input_uid."
    exit 0
fi

# Extraer el nombre de usuario, UID y GID
user_name=$(echo "$user_info" | cut -d: -f1)
user_gid=$(echo "$user_info" | cut -d: -f4)

# Mostrar el usuario y verificar si UID coincide con GID
echo "Usuario encontrado: $user_name (UID=$input_uid, GID=$user_gid)"
if [ "$input_uid" -eq "$user_gid" ]; then
    echo "El UID coincide con el GID."
else
    echo "El UID no coincide con el GID."
fi
