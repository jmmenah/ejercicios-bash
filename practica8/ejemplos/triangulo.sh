#!/bin/bash
# Autor/a: Lina García Cabrera
# Descripción: Tipo de triángulo:
# EQUILÁTERO, ISÓSCELES o ESCALENO.
# Se le pasan 3 números, los lados del triángulo y
# dice el tipo de triángulo
# Comprobar el número de argumentos
if [ $# != 3 ]
then
    echo "No has pasado 3 argumentos."
    echo "Sintaxis: ${0} lado1 lado2 lado3"
else
    # Comprobar que los argumentos son números
    if [[ "$1" =~ ^[0-9]+$ ]] && [[ "$2" =~ ^[0-9]+$ ]] && [[
    "$3" =~ ^[0-9]+$ ]]
    then
        # Todos los lados son iguales
        if [ $1 -eq $2 ] && [ $2 -eq $3 ] && [ $1 -eq $3 ]
        then
            echo "El triángulo es EQUILÁTERO"
        # 2 lados son iguales
        elif [ $1 -eq $2 ] || [ $2 -eq $3 ] || [ $1 -eq $3 ]
        then
            echo "El triángulo es ISÓSCELES"
        else
        echo "El triángulo es ESCALENO"
        fi
    else
    echo "Alguno de los argumentos no es un número"
    echo "Sintaxis: ${0} lado1 lado2 lado3"
    fi
fi
