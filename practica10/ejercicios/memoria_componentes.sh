#!/bin/bash

# Función para convertir kilobytes a megabytes
kb_to_mb() {
    echo "scale=2; $1 / 1024" | bc
}

# Verificar si se puede acceder a /proc/meminfo
if [ ! -r /proc/meminfo ]; then
    echo "Error: No se puede leer /proc/meminfo. ¿Está el archivo disponible?"
    exit 1
fi

# Extraer valores directamente usando grep y cut
buffers_kb=$(grep "^Buffers:" /proc/meminfo | cut -d: -f2 | tr -d ' kB')
pagetables_kb=$(grep "^PageTables:" /proc/meminfo | cut -d: -f2 | tr -d ' kB')

# Convertir a MB
buffers_mb=$(kb_to_mb "$buffers_kb")
pagetables_mb=$(kb_to_mb "$pagetables_kb")

# Mostrar resultados
echo "Estado actual de la memoria:"
echo "----------------------------"
echo "Buffers: $buffers_mb MB"
echo "Tablas de páginas: $pagetables_mb MB"
