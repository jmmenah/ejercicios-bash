#!/bin/bash

# Verificar si el archivo /etc/passwd está disponible
if [ ! -r /etc/passwd ]; then
    echo "Error: No se puede leer /etc/passwd."
    exit 1
fi

# Analizar el archivo /etc/passwd línea por línea
while IFS=: read -r username password uid gid gecos homedir shell; do
    # Filtrar usuarios no del sistema (UID > 1000, asumiendo que los del sistema tienen UID < 1000)
    if [ "$uid" -ge 1000 ] && [ "$homedir" != "$username" ] && [[ "$homedir" != /home/* ]]; then
        echo "Usuario: $username - Directorio base: $homedir"
    fi
done < /etc/passwd
