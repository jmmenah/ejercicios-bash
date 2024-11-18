#!/bin/bash
echo "En un lugar de la mancha" > lista.txt
for i in $(cat lista.txt)
do
    echo "Palabra: $i"
done