#!/bin/bash
# Autor: Francisco
# Descripción: Muestra las diferencias entre los
# parámetros especiales * y @
echo "Dólar asterisco.........:"${*}
echo "Dólar asterisco comillas:${*}"
echo "Dólar arroba............:"${@}
echo "Dólar arroba comillas...:${@}"
echo "Bucle sobre dólar asterisco"
for i in ${*}
do
    echo "Parámetro: ${i}"
done
echo "Bucle sobre dólar asterisco comillas"
for i in "${*}"
do
    echo "Parámetro: ${i}"
done
echo "Bucle sobre dólar arroba"
for i in ${@}
do
    echo "Parámetro: ${i}"
done
echo "Bucle sobre dólar arroba comillas"
for i in "${@}"
do
    echo "Parámetro: ${i}"
done