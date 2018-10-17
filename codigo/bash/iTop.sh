#################################################
# Programa: iTop.sh                             #
# Descripción: Instala y configura iTop y su    #
#    componente de TeemIP en entorno CentOS 7   #
# Autor: Victor Mejía Lara                      #
#        Jorge Díaz Lara                        #
# Licencia: GPLv3                               #
#################################################
#!/bin/bash
ITOP="iTop-2.5.0-3935.zip"
DIR_ITOP="/var/www/html/itop"
TEEMIP="teemip-core-ip-mgmt-2.3.0.zip"
USER="admin"
PASS="4dm1niT0p"
LOG="/var/log"
ERROR=0
error() {
	if [ $ERROR -ne 0 ]; then
		echo "Error en el proceso"
		exit 1
	fi
}

echo "Bienvenido a la Instalación de iTop"
echo ""
echo "Comandos necesarios para la instalación"
echo -ne "wget\t"
if [ -e "$(which wget)" ]; then
	echo "[ OK ]"
else
	echo "[ Error ]"
	exit 1
fi

echo -ne "unzip\t"
if [ -e "$(which unzip)" ]; then
	echo "[ OK ]"
else
	echo "[ Error ]"
	exit 1
fi

echo -ne "php\t"
if [ -e "$(which php)" ]; then
	echo "[ OK ]"
else
	echo "[ Error ]"
	exit 1
fi

echo -ne "Apache\t"
if [ -e "$(which httpd)" ]; then
	echo "[ OK ]"
else
	echo "[ Error ]"
	exit 1
fi

echo -ne "Mysql\t"
if [ -e "$(which mysql_secure_installation)" ]; then
	echo "[ Ok ]"
else
	echo "[ Error ]"
	exit 1
fi

echo -ne "SELinux\t"
if [ -e "$(which semanage)" ] && [ -e "$(which restorecon)" ]; then
	echo "[ Ok ]"
else
	echo "[ Error ]"
	exit 1
fi
echo ""
sleep 5

echo "Instalación de iTop-2.5.0"
echo "Descargado iTop 2.5.0"
cd ~/ && wget http://downloads.sourceforge.net/project/itop/itop/2.5.0/$ITOP
ERROR=$?
error
sleep 5

if [ ! -e $DIR_ITOP ]; then
	echo "Creando directorio $DIR_ITOP"
	cd ~/ && mkdir $DIR_ITOP
else
	echo "$DIR_ITOP existe"
fi

echo "Descomprimiendo $ITOP y copiadno directorio web a $DIR_ITOP"
cd ~/  && unzip ./$ITOP && mv ./web $DIR_ITOP
ERROR=$?
error
echo "$ITOP descomprimiedo e instalado correctamente"

echo "Creando directorios con, env, env-production y env-production-built"
mkdir $DIR_ITOP/web/{conf,env,env-production,env-production-build}
ERROR=$?
error

echo "Instalación de TeemIP"
echo "Descargando TeemIP"
cd ~/ && wget https://downloads.sourceforge.net/project/teemip/teemip%20-%20an%20iTop%20module/2.3.0/teemip-core-ip-mgmt-2.3.0.zip
sleep 3
ERROR=$?
error
cd ~/ && unzip teemip-core-ip-mgmt-2.3.0.zip && mv teemip-core-ip-mgmt $DIR_ITOP/web/extensions/
ERROR=$?
error

echo "Seguridad y SELinux"
echo -ne "Permisos en $DIR_ITOP "
ERROR=$?
error
chown -R apache:apache $DIR_ITOP
ERROR=$?
error
find $DIR_ITOP -type d -exec chmod 755 {} \;
ERROR=$?
error
find $DIR_ITOP -type f -exec chmod 644 {} \;
ERROR=$?
error
echo "[ OK ]"
sleep 5

echo -ne "Firewall para httpd"
firewall-cmd --zone=public --add-service=http --permanent
ERROR=$?
error
firewall-cmd --reload
ERROR=$?
error
echo "[ OK ]"
sleep 5

echo -ne "Cron iTop"
mkdir /etc/itop
ERROR=$?
error
mv $DIR_ITOP/web/webservices/cron.distrib /etc/itop
ERROR=$?
error
sed -i "s/auth_user=admin/auth_user=$USER/g" /etc/itop/cron.distrib
ERROR=$?
error
sed -i "s/auth_pwd=admin/auth_pwd=$PASS/g" /etc/itop/cron.distrib
ERROR=$?
error
echo "*/5 * * * * /bin/php $DIR_ITOP/web/webservices/cron.php --param_file=/etc/itop/cron.distrib >> $LOG/itop-log 2>&1" | crontab
ERROR=$?
error
echo "[ OK ]"
sleep 5

echo -ne "SELinux"
setsebool -P httpd_can_network_connect_db on
ERROR=$?
error
setsebool -P httpd_can_connect_ldap on
ERROR=$?
error
chcon -R -u system_u /var/www/html/*
ERROR=$?
error
chcon -R -t httpd_sys_content_t $DIR_ITOP
ERROR=$?
error
semanage fcontext -a -t etc_t '/etc/itop/cron.distrib'
ERROR=$?
error
semanage fcontext -a -t httpd_sys_content_t "/var/www/html/itop(/.*)?"
ERROR=$?
error
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/itop/web/conf' 
ERROR=$?
error
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/itop/web/data' 
ERROR=$?
error
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/itop/web/env-production' 
ERROR=$?
error
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/itop/web/env-production-build' 
ERROR=$?
error
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/itop/web/log' 
ERROR=$?
error
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/itop/web/extensions'
ERROR=$?
error
restorecon -R -v '/var/www/html/itop'
ERROR=$?
error
restorecon -v '/var/www/html/itop/web/conf' 
ERROR=$?
error
restorecon -v '/var/www/html/itop/web/data' 
ERROR=$?
error
restorecon -v '/var/www/html/itop/web/env-production'
ERROR=$?
error
restorecon -v '/var/www/html/itop/web/env-production-build'
ERROR=$?
error
restorecon -v '/var/www/html/itop/web/log'
ERROR=$?
error
restorecon -v '/var/www/html/itop/web/extensions'
ERROR=$?
error
echo "[ OK ]"
echo ""

echo "PHP y MariaDB"
echo -ne "Parámetros de php.ini\t\t\t "
sed -i "s/post_max_size=8M/post_max_size=32M/g" /etc/php.ini
ERROR=$?
error
sed -i "s/upload_max_filesize=2M/upload_max_filesize=30M/g" /etc/php.ini
ERROR=$?
error
sed -i "s/max_input_time=60/max_input_time=180/g" /etc/php.ini
ERROR=$?
error
echo "[ OK ]"
echo -ne "Parámetros de MariaDB "
sed -i "s/\[mysqld_safe\]/max_allowed_packet=33M\n\n\n\[mysqld_safe\]/g" /etc/my.cnf
ERROR=$?
error
echo "[ OK ]"
sleep 5
echo ""

echo "Apache"
echo -ne "Modificación de DocumentRoot "
sed -i "s/DocumentRoot \"\/var\/www\/html\"/DocumentRoot \"\/var\/www\/html\/itop\/web\"/g" /etc/httpd/conf/httpd.conf
ERROR=$?
error
echo "[ OK ]"
sleep 5
echo ""

echo "Iniciando Apache"
systemctl enable httpd.service
ERROR=$?
error
systemctl start httpd.service
ERROR=$?
error

echo "Iniciando MariaDB"
systemctl enable mariadb.service
ERROR=$?
error
systemctl start mariadb.service
ERROR=$?
error
