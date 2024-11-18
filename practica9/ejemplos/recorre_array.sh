#!/bin/bash
# Definir un array
frutas=("manzana" "naranja" "plátano")
# Recorrer el array usando @
for fruta in "${frutas[@]}";
do
    echo "Fruta: $fruta"
done