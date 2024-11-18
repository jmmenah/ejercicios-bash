#!/bin/bash
# Autor: Juan Manuel Mena Hernandez
#Verifica si se han proporcionado los argumentos necesarios
if [ "$#" -ne 2 ]
then
    echo "Uso: $0 <nombre_fichero> \"<palabra_o_frase>\""
    exit 1
fi

# Argumentos
fichero=$1
palabra_o_frase=$2

# Verifica si el fichero existe
if [ ! -f "$fichero" ]
then
    echo "Error: El fichero '$fichero' no existe."
    exit 1
fi

# Cuenta las veces de la palabra o frase
veces=$(grep -o -i -- "$palabra_o_frase" "$fichero" | wc -l)

# Muestra el resultado
echo "La palabra o frase '$palabra_o_frase' aparece $veces veces en el fichero '$fichero'."