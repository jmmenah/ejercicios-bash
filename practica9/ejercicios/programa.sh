#!/bin/bash
# Autor: Juan Manuel Mena Hernández
# Descripcion: Escribe un shell script que renombre todos los archivos ejecutables del directorio
# ~/bin, de forma que le añada los caracteres .sh. Así si, por ejemplo, en ~/bin
# existe un archivo ejecutable llamado programa, debería renombrarlo para que se
# llame programa.sh

orden=$( ls ~/bin )
for f in ${orden}
do
  if [ -f ~/bin/${f} ]
  then
      if [ -x ~/bin/${f} ]
      then
          mv ~/bin/${f} ~/bin/${f}.sh
      fi
  fi
done
