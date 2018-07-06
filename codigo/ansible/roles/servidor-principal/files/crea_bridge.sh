#!/bin/bash
###############################################################################
# Nombre: crea_bridge.sh
# Descripción: Script para la creación de puente de red 
#
# Autor: Jorge A. Díaz Lara - jorge@integraci.com / jorge.diaz@gmail.com
# Licencia: GPL Versión 2
###############################################################################

# Detección de usuario, se debe ejecutar como usuario root
if [[ $EUID -ne 0 ]]; then
    echo -ne "\nPor favor ejecuta el script como usuario \"root\".\n"
    exit 1
fi

# Creamos el archivo de configuración del puente de red
cat <<FIN> /etc/sysconfig/network-scripts/ifcfg-br0
DEVICE=br0
TYPE=Bridge
IPADDR=DIRECCION_IP
PREFIX=MASCARA_RED
GATEWAY=PUERTA_ENLACE
DNS1=DNS_1
BOOTPROTO=none
ONBOOT=yes
NM_CONTROLLED=no
DELAY=0
DEFROUTE=yes
NAME=br0
FIN

for ARCHIVO_TARJETA in `find /etc/sysconfig/network-scripts/ -name "ifcfg-e[[:alnum:]]*[[:digit:]]"`;do
  sed -i 's/\x0D$//' $ARCHIVO_TARJETA
  cp $ARCHIVO_TARJETA /etc/sysconfig/network-scripts/RESPALDO_TARJETA-$(date "+%Y%m%d-%H%M%S").bk
  source $ARCHIVO_TARJETA
  cat /dev/null > $ARCHIVO_TARJETA
  echo "DEVICE=${NAME}" >> $ARCHIVO_TARJETA
  echo "TYPE=Ethernet"  >> $ARCHIVO_TARJETA
  echo "BOOTPROTO=none"  >> $ARCHIVO_TARJETA
  echo "NAME=${NAME}" >> $ARCHIVO_TARJETA
  echo "UUIDE=${UUID}" >> $ARCHIVO_TARJETA
  echo "ONBOOT=yes" >> $ARCHIVO_TARJETA
  echo "NM_CONTROLLED=no" >> $ARCHIVO_TARJETA
  echo "BRIDGE=br0" >> $ARCHIVO_TARJETA
  sed -i "s/DIRECCION_IP/${IPADDR}/" /etc/sysconfig/network-scripts/ifcfg-br0
  sed -i "s/MASCARA_RED/${PREFIX}/" /etc/sysconfig/network-scripts/ifcfg-br0
  sed -i "s/PUERTA_ENLACE/${GATEWAY}/" /etc/sysconfig/network-scripts/ifcfg-br0
  sed -i "s/DNS_1/${DNS1}/" /etc/sysconfig/network-scripts/ifcfg-br0
done
