#!/bin/bash
# Autor: Juan Manuel Mena Hernandez
# Descripción: Comprueba si al script se le han pasado
# justamente cuatro argumentos.
if [ ! ${#} -eq 4 ]
then
    echo "Error, se han pasado ${#} argumento(s)"
fi