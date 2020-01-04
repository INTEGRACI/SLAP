#!/bin/bash
#==============================================================================
# Instalación de iTop 6.2 en CentOS 8
# 
# Uso:
#  # curl -sSL https://integraci.github.io/codigo/bash/itop6_2-CentOS_8.sh | bash
#
# Instalación en el navegador web en la IP o URL del DOMINIO.
#    https://localhost/itop  o el Directorio que defina en las Variables
#
# Después de instalar iTop en tu navegador web, deberás cambiar los permisos 
# del archivo de configuración, puedes hacerlo mediante el siguiente comando:
# 
#       # chmod u+w /var/www/html/itop/conf/production/config-itop.php
# 
# Licencia GNU/GPL Versión 2 o superior
#
# Autor: Jorge Antonio Díaz Lara - jorge@integraci.com.mx
#        Victor Mejía Lara - vmejialara@gmail.com
#        Odin Mojica - odinmojica@gmail.com
#        Ernesto Escobedo - eescobedo@gmail.com
#==============================================================================

#==============================================================================
# Variables - Modifica sólamente esta parte (y lo demás si sabes lo que haces).
#==============================================================================
DOMINIO="cmdb.integraci.com.mx"          # Nombre del dominio del Sitio
CORREO_ADMIN="contacto@${DOMINIO}"       # Correo electrónico del adminsitrador

IP_SEGMENTO_ADMINISTRACION="192.168.1"	 # Dos, tres o cuatro octetos de la IP
DIRECTORIO="itop"			 # Nombre del directorio de instalación

USUARIO_CRON_ITOP="usuario_cron"         # Usuario para cron de iTop
USUARIO_CRON_ITOP_PASSWORD="password"    # Contraseña de usuario para cron iTop

MARIADB_ROOT_PASSWORD="password"         # Contraseña usuario "root" de MariaDB
BASE_DATOS_ITOP="itopdb"                 # Nombre de la Base de Datos para iTop
USUARIO_BASE_DATOS="usritopdb"           # Nombre usuario de Base de Datos
USUARIO_BASE_DATOS_PASSWORD="password"   # Contraseña de usuario de Base Datos
#==============================================================================

#==============================================================================
# Sincronización de tiempo de equipo con la hora oficial de México
#==============================================================================
# Configuración de Zona Horaria
timedatectl set-timezone America/Mexico_City

# Instalación de Chrony
dnf -y install chrony

# Se sincronizará con un servidor de tiempo (NTP)
timedatectl set-ntp yes

# Configuración de servidor de tiempo a "cronos.cenam.mx"
sed -i "s/pool 2.centos.pool.ntp.org/server cronos.cenam.mx/g" /etc/chrony.conf

# Sincroniza el servidor de tiempo al iniciar el equipo
systemctl enable --now chronyd

# Reinicia el servicio de NTP
systemctl restart chronyd

# Muestra informacioń del tiempo actual de las fuentes o servidores de tiempo
chronyc sources

# Instala la herramienta ntpstat
dnf -y install ntpstat

# Muestra el estatus de sincronización del equipo con el servidor de tiempo.
ntpstat

#==============================================================================
# Instalación de repositorios
#==============================================================================
# Limpia metadatos
dnf clean all

# Extra Packages for Enterprise Linux (EPEL)
dnf -y install epel-release

# Remi's RPM repository - https://rpms.remirepo.net/wizard/
dnf -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm

# Actualiza paquetes 
dnf -y update

#==============================================================================
# Instalación de paquetes
#==============================================================================
dnf -y install dnf-utils net-tools policycoreutils-python-utils wget vim bash-completion unzip graphviz git expect
dnf -y install httpd mod_ssl 

dnf module reset php
dnf -y module install php:remi-7.2
dnf -y update

dnf -y install php php-mysql php-xml php-cli php-soap php-ldap php-gd php-zip php-json php-intl php-mcrypt php-mbstring 
#==============================================================================
# Instalación de "PHP: Hypertext Preprocessor"
#==============================================================================
sed -i "s/post_max_size = 8M/post_max_size = 182M/g" /etc/php.ini
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 180M/g" /etc/php.ini
sed -i "s/max_input_time = 60/max_input_time = -1/g" /etc/php.ini

#==============================================================================
# Descarga de iTop
#==============================================================================
git clone -b support/2.6.2 https://github.com/Combodo/iTop.git /var/www/html/$DIRECTORIO/
mkdir /var/www/html/$DIRECTORIO/{conf,env-production,env-production-build}

#==============================================================================
# Descarga Extensión - Monedas Adicionales para Contratos
#==============================================================================
git clone https://github.com/INTEGRACI/monedas-adicionales-contratos-itop.git /var/www/html/$DIRECTORIO/extensions/monedas-adicionales-contratos

#==============================================================================
# Descarga de extensión IPA (TeemIP)
#==============================================================================
cd ~/
wget https://sourceforge.net/projects/teemip/files/teemip%20-%20an%20iTop%20module/2.5.1/teemip-core-ip-mgmt-2.5.1-503.zip/download
mv download teemip-core-ip-mgmt-2.5.1-503.zip
unzip teemip-core-ip-mgmt-2.5.1-503.zip -d /var/www/html/$DIRECTORIO/extensions/

#==============================================================================
# Elimina diccionarios de otros lenguajes - Excepto Español Castellano e Inglés
# Basado en el script de "Jeffrey Bostoen"
#==============================================================================
removeLang=("cs" "da" "de" "fr" "hu" "it" "ja" "nl" "pt_br" "ru" "sk" "tr" "zh" "zh_cn")

for i in "${removeLang[@]}"
do
   find /var/www/html/$DIRECTORIO/ -type f -name "$i.dict.*" -delete
   find /var/www/html/$DIRECTORIO/ -type f -name "$i.dictionary.*" -delete
done

#==============================================================================
# Cron de iTop
#==============================================================================
mkdir /etc/$DIRECTORIO
mv /var/www/html/$DIRECTORIO/webservices/cron.distrib /etc/$DIRECTORIO/
sed -i "s/auth_user=admin/auth_user=${USUARIO_CRON_ITOP}/g" /etc/$DIRECTORIO/cron.distrib
sed -i "s/auth_pwd=admin/auth_pwd=${USUARIO_CRON_ITOP_PASSWORD}/g" /etc/$DIRECTORIO/cron.distrib
echo "* * * * * /usr/bin/php /var/www/html/$DIRECTORIO/webservices/cron.php --param_file=/etc/$DIRECTORIO/cron.distrib >>/var/log/${DIRECTORIO}-cron.log 2>&1" | crontab

#==============================================================================
# Configuración de Virtualhost
#==============================================================================
cat << EOF > /etc/httpd/conf.d/00-$DIRECTORIO.conf
<VirtualHost *:80>
 ServerName ${DOMINIO}:80
 ServerAdmin $CORREO_ADMIN
 DocumentRoot "/var/www/html/$DIRECTORIO"
 DirectoryIndex index.php index.html
 CustomLog '|/usr/sbin/rotatelogs "/var/log/httpd/access_${DIRECTORIO}_log" 604800 -360' "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\""
 ErrorLog '|/usr/sbin/rotatelogs "/var/log/httpd/error_${DIRECTORIO}_log" 604800 -360'
 ExpiresActive On
 ExpiresByType image/jpg "access plus 1 month"
 ExpiresByType image/png "access plus 1 month"
 ExpiresByType image/gif "access plus 1 month"
 ExpiresByType image/jpeg "access plus 1 month"
 ExpiresByType text/css "access plus 1 month"
 ExpiresByType image/x-icon "access plus 1 month"
 ExpiresByType application/pdf "access plus 1 month"
 ExpiresByType audio/x-wav "access plus 1 month"
 ExpiresByType audio/mpeg "access plus 1 month"
 ExpiresByType video/mpeg "access plus 1 month"
 ExpiresByType video/mp4 "access plus 1 month"
 ExpiresByType video/quicktime "access plus 1 month"
 ExpiresByType video/x-ms-wmv "access plus 1 month"
 ExpiresByType application/x-shockwave-flash "access 1 month"
 ExpiresByType text/javascript "access plus 2 month"
 ExpiresByType application/x-javascript "access plus 1 month"
 ExpiresByType application/javascript "access plus 1 month"
 <Directory "/var/www/html/$DIRECTORIO">
 AllowOverride all
 Options All -Includes -ExecCGI -Indexes +MultiViews
 Require all granted
 </Directory>
 <Directory "/var/www/html/$DIRECTORIO/setup">
 AllowOverride all
 Options All -Includes -ExecCGI -Indexes +MultiViews
 Require ip $IP_SEGMENTO_ADMINISTRACION
 ErrorDocument 403 http://${DOMINIO}/
 </Directory>
 LogLevel warn
 TimeOut 300
 ProxyTimeout 300
</VirtualHost>
EOF

#==============================================================================
# Configuración de archivo /etc/hosts
#==============================================================================
echo -ne "127.0.0.1\t$DOMINIO" >> /etc/hosts

#==============================================================================
# Seguridad por contexto - SELinux
#==============================================================================
setsebool -P httpd_can_network_connect_db on
setsebool -P httpd_can_connect_ldap on

chcon -u system_u /etc/$DIRECTORIO/cron.distrib
chcon -t etc_t /etc/$DIRECTORIO/cron.distrib
chcon -u system_u /etc/httpd/conf.d/00-$DIRECTORIO.conf
chcon -t httpd_config_t /etc/httpd/conf.d/00-$DIRECTORIO.conf
chcon -R -u system_u /var/www/html/*
chcon -R -t httpd_sys_content_t /var/www/html/$DIRECTORIO

semanage fcontext -a -t etc_t "/etc/$DIRECTORIO/cron.distrib"
semanage fcontext -a -t httpd_config_t "/etc/httpd/conf.d/00-${DIRECTORIO}.conf"
semanage fcontext -a -t httpd_sys_content_t "/var/www/html/$DIRECTORIO(/.*)?"
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/$DIRECTORIO/conf"
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/$DIRECTORIO/data"
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/$DIRECTORIO/env-production"
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/$DIRECTORIO/env-production-build"
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/$DIRECTORIO/log"
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/$DIRECTORIO/extensions"

restorecon -R -v "/var/www/html/$DIRECTORIO"
restorecon -v "/etc/httpd/conf.d/00-${DIRECTORIO}.conf"
restorecon -v "/var/www/html/$DIRECTORIO/conf"
restorecon -v "/var/www/html/$DIRECTORIO/data"
restorecon -v "/var/www/html/$DIRECTORIO/env-production"
restorecon -v "/var/www/html/$DIRECTORIO/env-production-build"
restorecon -v "/var/www/html/$DIRECTORIO/log"
restorecon -v "/var/www/html/$DIRECTORIO/extensions"

#==============================================================================
# Propietario y permisos de archivos
#==============================================================================
chown -R apache:apache /var/www/html/$DIRECTORIO
find /var/www/html/$DIRECTORIO -type d -exec chmod 755 {} \;
find /var/www/html/$DIRECTORIO -type f -exec chmod 644 {} \;

#==============================================================================
# Permitir tráfico HTTP y HTTPS (puertos 80 y 443)
#==============================================================================
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --reload

#==============================================================================
# Servidor HTTP - Apache
#==============================================================================
# Activar el servicio de base de datos MariaDB al iniciar el equipo
systemctl enable httpd.service

# Iniciar el servicio de base de datos MariaDB
systemctl start httpd.service

#==============================================================================
# Servidor de base de datos - MariaDB
#==============================================================================
# Instalación de servidor de base de datos MariaDB
dnf -y install mariadb mariadb-server

# Configuracón del máximo tamaño de paquetes permitido
sed -i "s/\[client-server\]/\[client-server\]\nmax_allowed_packet=183M/g" /etc/my.cnf

# Activar el servicio de base de datos MariaDB al iniciar el equipo
systemctl enable mariadb.service

# Iniciar el servicio de base de datos MariaDB
systemctl start mariadb.service

# Configuración de MariaDB mediante "mysql_secure_installation"
INSTALACION_SEGURA_MARIADB=$(expect -c "
   set timeout 10
   spawn mysql_secure_installation
   expect \"Enter current password for root (enter for none): \"
   send \"\r\"
   expect \"Set root password? \[Y/n\] \"
   send \"Y\r\"
   expect \"New password:\"
   send \"$MARIADB_ROOT_PASSWORD\r\"
   expect \"Re-enter new password:\"
   send \"$MARIADB_ROOT_PASSWORD\r\"
   expect \"Remove anonymous users? \[Y/n\] \"
   send \"Y\r\"
   expect \"Disallow root login remotely? \[Y/n\] \"
   send \"Y\r\"
   expect \"Remove test database and access to it? \[Y/n\] \"
   send \"Y\r\"
   expect \"Reload privilege tables now? \[Y/n\] \"
   send \"Y\r\"
   expect EOF
")
echo "$INSTALACION_SEGURA_MARIADB"

# Creación de base de datos para iTop
mysql -u root -p$MARIADB_ROOT_PASSWORD -e "CREATE DATABASE $BASE_DATOS_ITOP DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"

# Creación de usuario y permisos para iTop
mysql -u root -p$MARIADB_ROOT_PASSWORD -e "GRANT ALL ON $BASE_DATOS_ITOP.* TO '${USUARIO_BASE_DATOS}'@'localhost' identified by '${USUARIO_BASE_DATOS_PASSWORD}'"
