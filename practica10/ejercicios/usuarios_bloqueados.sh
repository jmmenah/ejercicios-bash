#!/bin/bash

# Comprobar si se tiene permiso para leer /etc/shadow
if [ ! -r /etc/shadow ]; then
    echo "Error: No tienes permisos para leer /etc/shadow. Ejecuta el script como root."
    exit 1
fi

echo "Usuarios bloqueados en el sistema:"
echo "---------------------------------"

# Leer el archivo /etc/shadow línea por línea
while IFS=: read -r user password rest; do
    # Comprobar si el campo de contraseña contiene el signo '!'
    if [[ $password == !* ]]; then
        echo "$user"
    fi
done < /etc/shadow

# Fin del script
