#!/bin/bash
# Autor: Juan Manuel Mena Hernandez
# Verifica que se pasen exactamente 2 argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <directorio> <número>"
    exit 1
fi

# Asigna los argumentos a variables para mayor claridad
directorio=$1
numero=$2

# Verifica que el primer argumento sea un directorio válido
if [ ! -d "$directorio" ]; then
    echo "Error: $directorio no es un directorio válido."
    exit 1
fi

# Verifica que el segundo argumento sea un número positivo
if ! [[ "$numero" =~ ^[0-9]+$ ]]; then
    echo "Error: $numero no es un número válido."
    exit 1
fi

# Lista el contenido del directorio con detalles, omite la primera línea (encabezado),
# ordena por la cantidad de enlaces y muestra los n primeros resultados
ls -l "$directorio" | tail -n +2 | sort -k2 -n -r | head -n "$numero"
