#!/bin/bash
# Autor: Francisco de Asís Conde Rodríguez
# Descripción: Cambia formato de tiempo.
seg_en_dia=86400
seg_en_hora=3600
min_en_hora=60
seg_en_minuto=60
dias=$(( ${1} / ${seg_en_dia} ))
seg_restantes=$(( ${1} % ${seg_en_dia} ))
horas=$(( ${seg_restantes} / ${seg_en_hora} ))
seg_restantes=$(( ${seg_restantes} % ${seg_en_hora} ))
minutos=$(( ${seg_restantes} / ${seg_en_minuto} ))
seg_restantes=$(( ${seg_restantes} % ${seg_en_minuto} ))
echo ${dias} ${horas} ${minutos} ${seg_restantes}