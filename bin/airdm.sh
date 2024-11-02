#!/bin/bash

# Función para iniciar una sesión X
start_x_session() {
    exec startx
}

# Función para mostrar el menú de inicio de sesión
show_login_screen() {
    clear
    echo "Bienvenido a Mi Gestor de Pantalla"
    echo "Ingrese su nombre de usuario: "
    read USERNAME

    echo "Ingrese su contraseña: "
    read -s PASSWORD

    # Aquí podrías implementar la verificación de contraseña

    # Iniciar sesión
    start_x_session
}

# Llamar a la función para mostrar la pantalla de inicio de sesión
show_login_screen
