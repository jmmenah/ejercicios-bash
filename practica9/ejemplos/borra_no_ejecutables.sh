#!/bin/bash
# Autor: Francisco de Asís Conde Rodríguez
# Descripción: Borra aquellos archivos del directorio
# ~/bin que no sean ejecutables.
archivos=`ls ~/bin`
for a in ${archivos}
do
    if [ ! -d ~/bin/${a} ]
    then
        if [ ! -x ~/bin/${a} ]
        then
            rm ~/bin/${a}
        fi
    fi
done
