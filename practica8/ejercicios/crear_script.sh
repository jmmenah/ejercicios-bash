#!/bin/bash
# Autor: Juan Manuel Mena Hernández	
# Descripción: Crea un nuevo shell script, comprueba si el nombre ya existe, le da permisos de ejecución y lo copia a ~/bin.

# Verifica que se pase exactamente un argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <nombre_del_script>"
    exit 1
fi

# Asigna el nombre del script pasado como argumento a una variable
nombre_script=$1

# Comprueba si el nombre ya está en uso (como comando o script existente)
type "$nombre_script" &>/dev/null
if [ "$?" -eq 0 ]; then
    echo "Error: Ya existe un comando o script con el nombre '$nombre_script'."
    exit 1
fi

# Crea el directorio ~/bin si no existe
if [ ! -d "$HOME/bin" ]; then
    mkdir -p "$HOME/bin"
    echo "Se creó el directorio ~/bin."
fi

# Define la ruta completa del nuevo script
ruta_script="$HOME/bin/$nombre_script"

# Comprueba si ya existe un archivo con ese nombre en ~/bin
if [ -f "$ruta_script" ]; then
    echo "Error: Ya existe un archivo llamado '$nombre_script' en ~/bin."
    exit 1
fi

# Crea un nuevo script con un contenido básico
cat << 'EOF' > "$ruta_script"
#!/bin/bash
# Descripción: [Añade aquí la descripción del script]
EOF

# Le da permisos de ejecución
chmod +x "$ruta_script"

# Informa al usuario del éxito
echo "El script '$nombre_script' se ha creado exitosamente en ~/bin y tiene permisos de ejecución."
echo "Puedes editarlo con tu editor de texto favorito, por ejemplo: nano $ruta_script."
