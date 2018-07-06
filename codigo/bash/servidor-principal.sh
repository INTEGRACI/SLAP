#!/bin/bash
###############################################################################
# Instalación del servidor principal
# Se ejecuta desde la máquina del Administrador
###############################################################################

# Limpiamos pantalla
clear

# Detección de usuario, se debe ejecutar como usuario root (Usuario "0") de lo contrario
# termina la ejecución.
if [[ $EUID -ne 0 ]]; then
    echo -ne "\nPor favor ejecuta el script como usuario \"root\".\n"
    exit 1
fi

echo "[servidor-principal]" > /etc/ansible/hosts
echo "sf01 ansible_host=192.168.10.1" >> /etc/ansible/hosts

ansible-playbook /home/$1/SLAP/codigo/ansible/instala_servidor_SLAP.yml
