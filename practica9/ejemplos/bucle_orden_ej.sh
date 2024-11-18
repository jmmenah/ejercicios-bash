#!/bin/bash
# Autor: Francisco de Asís Conde Rodríguez
# Descripción: Ejemplo de uso de arrays con
# resultados de órdenes
resultado=( $(ls) )
for archivo in "${resultado[@]}"
do
    echo "$archivo"
done