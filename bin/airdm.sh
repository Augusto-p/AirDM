#!/bin/bash

# Mensaje de bienvenida
echo "=== Bienvenido al gestor de inicio de sesión en texto ==="

# Solicitar nombre de usuario
read -p "Usuario: " usuario

# Intentos de autenticación
intentos=3

for ((i=1; i<=intentos; i++)); do
    # Solicitar contraseña de manera segura
    read -sp "Contraseña: " password
    echo

    # Intentar autenticar al usuario
    if echo "$password" | su -c true "$usuario" 2>/dev/null; then
        echo "Autenticación exitosa. Iniciando sesión gráfica..."

        # Iniciar una sesión gráfica en X11 con Awesome
        su - "$usuario" -c 'startx /usr/bin/awesome'
        exit 0
    else
        echo "Credenciales incorrectas. Intento $i de $intentos."
    fi
done

# Mensaje de salida después de tres intentos fallidos
echo "Número máximo de intentos alcanzado. Abortando."
exit 1
