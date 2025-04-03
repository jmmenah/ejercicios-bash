#!/bin/bash

# Contador para grupos con usuarios asignados
group_count=0

echo "Grupos con usuarios asignados:"
echo "-------------------------------"

# Leer el archivo /etc/group línea por línea
while IFS=: read -r group_name password gid user_list; do
    # Comprobar si el campo de usuarios no está vacío
    if [ -n "$user_list" ]; then
        echo "$group_name"
        group_count=$((group_count + 1))
    fi
done < /etc/group

# Mostrar el número total de grupos con usuarios asignados
echo "-------------------------------"
echo "Número de grupos con usuarios asignados: $group_count"
