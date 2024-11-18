#!/bin/bash
# Autor: Juan Manuel Mena Hernández
# Descripción: Cuenta el número de veces que una palabra o frase aparece en un fichero de texto.

# Comprobación de número de argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <nombre_del_fichero> \"<palabra_o_frase>\""
    exit 1
fi

# Asigna los argumentos a variables para mayor claridad
fichero=$1
texto=$2

# Verifica que el primer argumento sea un fichero válido
if [ ! -f "$fichero" ]; then
    echo "Error: '$fichero' no es un fichero válido."
    exit 1
fi

# Verifica que el segundo argumento no esté vacío
if [ -z "$texto" ]; then
    echo "Error: El segundo argumento (palabra o frase) está vacío."
    exit 1
fi

# Cuenta el número de veces que aparece la palabra o frase en el fichero
coincidencias=$(grep -o -F "$texto" "$fichero" | wc -l)

# Muestra el resultado
echo "La palabra o frase '$texto' aparece $coincidencias veces en el fichero '$fichero'."
