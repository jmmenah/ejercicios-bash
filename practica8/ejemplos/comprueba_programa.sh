#!/bin/bash
# Autor: Francisco de Asís Conde Rodríguez
# Descripción: Comprueba si un nombre que se pasa como
# argumento corresponde a un programa
# ejecutable situado en el directorio ~/bin
if [ ${#} -ne 1 ]
then
    echo "Error. Se debe pasar un argumento"
    exit
fi
if [ ! -e ${HOME}/bin/${1} ]
then
    echo No existe el script: ${1}
else
    if [ ! -x ${HOME}/bin/${1} ]
    then
        echo ${1} no es un ejecutable
    fi
fi

