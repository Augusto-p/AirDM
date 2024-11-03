#!/bin/bash

# Configuración
BACKGROUND_IMAGE="/ruta/a/tu/fondo.jpg"  # Ruta al fondo de pantalla
FONT="monospace-12"                      # Cambia esto si prefieres otra fuente

# Configurar el fondo de pantalla
# feh --bg-scale "$BACKGROUND_IMAGE"

# Función para mostrar un mensaje en el centro de la pantalla
show_centered_text() {
    echo "$1" | dmenu -fn "$FONT" -p "Awesome Login" -nb "#000000" -nf "#FFFFFF" -sb "#444444" -sf "#FFFFFF"
}

# Solicitar nombre de usuario
USER=$(echo "" | dmenu -fn "$FONT" -p "Usuario: " -nb "#000000" -nf "#FFFFFF" -sb "#444444" -sf "#FFFFFF")

# Solicitar contraseña
PASS=$(echo "" | dmenu -fn "$FONT" -p "Contraseña: " -nb "#000000" -nf "#FFFFFF" -sb "#444444" -sf "#FFFFFF" -lines 0 -password)

# Autenticación
if [ "$(echo "$PASS" | sudo -S -u "$USER" echo authenticated 2>/dev/null)" = "authenticated" ]; then
    # Iniciar sesión con Awesome WM
    exec sudo -u "$USER" awesome
else
    # Mostrar error y reiniciar el script
    show_centered_text "Autenticación fallida. Intenta de nuevo."
    exec "$0"
fi
