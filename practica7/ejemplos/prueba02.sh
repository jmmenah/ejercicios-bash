#!/bin/bash
# Autora: Lina García-Cabrera
# Descripción: Escribe texto con y sin saltos de línea y con tabuladores

echo -n "Imprimiendo texto sin nueva línea"
echo "Imprimiendo texto con nueva línea"
echo -e "\nInterpretación \t Caracteres \t Tabulador\n"
echo "\nNO Interpretación \t Caracteres \t Tabulador\n"

# mostrar los parámetros de entrada con tabulador

echo -e "\nLos 3 parámetros de entrada son \t$1 \t$2 \t$3\n"