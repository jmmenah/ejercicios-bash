#!/bin/bash
# Autor: Juan Manuel Mena Hernández
# Descripcion: Escribe un shell script que reciba como argumentos una lista de nombres de usuario,
# y que compruebe si existen, indicando por pantalla si el usuario existe o no.

usuarios=${*}
for f in ${usuarios}
do
  busqueda=$( grep -i ${f} /etc/passwd )
  cuenta=$( echo ${busqueda} | wc -w )
  if [ ${cuenta} -eq 0 ]
  then
      echo "El usuario "${f}" no existe"
  else
      echo "El usuario "${f}" existe"
  fi
done
