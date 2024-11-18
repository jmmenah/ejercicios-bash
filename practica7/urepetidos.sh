#!/bin/bash

#Autor:	Juan Manuel Mena
#Descripcion: Escribe los UID repetidos

cat /etc/passwd | awk -F: '{print $3}' | uniq -d
