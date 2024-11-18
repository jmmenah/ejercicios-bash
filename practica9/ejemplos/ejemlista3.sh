#!/bin/bash
# Autor: José Ramón Balsas Almagro
# Descripción: Ejemplo de uso de arrays con
# resultados de órdenes
# Muestra el archivo o directorio más reciente y más antigo
elementos=($(ls --sort=time))
# elementos=(`ls --sort=time`)
echo "el más reciente es ${elementos[0]}"
echo "el más antiguo es ${elementos[*]: -1}"
