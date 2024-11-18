#!/bin/bash
# Autor: Juan Manuel Mena Hernandez
# Descripción: Comprueba si al script se le han pasado
# entre dos y cuatro argumentos.
if [ "$#" -lt 2 ] || [ "$#" -gt 4 ]; then
    echo "Error, se han pasado $# argumento(s)"
fi