#!/bin/bash
# Autor: José Ramón Balsas Almagro
# Descripción: Recibe como mínimo dos argumentos. El último es un
# nombre de directorio. Copia los primeros argumentos
# (archivos o directorios) en el directorio dado.
if [ ${#} -lt 2 ]
then
    echo "Error. Se deben dar mínimo dos argumentos."
    exit 1
fi
if [ ! -d ${!#} ] # 1
then
    echo "Error. El último debe ser directorio."
    exit 2
fi
i=1
while [ ${i} -le $(( ${#}-1 )) ] # 2
do
    if [ -e ${!i} ] # 3
    then
        cp -r ${!i} ${!#} # 4
    fi
    i=$(( ${i} + 1 )) # 5
done
