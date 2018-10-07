# Trabajando con SSH.
SSH (Secure SHell) es una de las mejores herraminetas con las que se cuentan para poder acceder y administrar equipos en forma remota y segura; en este artículo veremos desde la instalaciÃn hasta algunos tips de utilidad para llevar a cabo las tareas de administración básicas.

## Instalación de OpenSSH.
Aunque en la mayoría de las distribuciones se tiene instalado. Se presenta la instalaciÃn del servidor ssh en Fedora, ejecutando el siguiente comando:

>su -c "dnf -y install openssh-server"

Para iniciar el servicio, ingresamos el siguiente comando.

>su -c "systemctl start sshd.service"

Para iniciar el servicio al momento que se arranque el sistema operativo, se ejecuta lo siguiente:

>su -c "systemctl enable sshd.service"

## Autenticación sin contraseña.
En ocasiones se realizarán actividades con equipos remotos en forma automatizada como es el caso de Ansible. Para evitar que sea solicitada la contraseña cada vez que se conecta por SSH podemos generar una llave y enviarla al equipo, así este reconocerá que las instrucciones provienen de un dispositivo de confianza y se ejecutará, en caso de modificarse las llaves, estas deberán de actualizarse. Para generar la llave SSH se realiza los siguientes comandos.

Con el usuario que se vaya a trabajar, se debe de acceder a su directorio principal.
>cd ~/

Crear el directorio donde se almacenará las llaves SSH.
>mkdir ~/.ssh

Cambiar permisos al directorio para que solamente el propietario tenga acceso total.
>chmod 700 ~/.ssh

Generar llave.
>ssh-keygen -t rsa

Copiar la llave al equipo remoto que se desea administrar sin necesidad de la contraseña.
>ssh-copy-id -i ~/.ssh/id_rsa.pub usuario@equipo.

Donde usuario es la cuenta de computadora/servidor remoto y equipo puede ser una dirección ip o dominio.

En caso de que se cuente con las llaves pero se cambia de equipo y se desea usar las llaves generadas. Se hace lo siguiente.
>mkdir ~/.ssh

Copiar los archivos id_rsa e id_rsa.pub en el directorio ~/.ssh
>copy rsa_pub* ~/.ssh

Añadir la identidad de las llaves.
>ssh-add ~/.ssh/id_rsa

Con lo anterior, permitirá que se pueda acceder a los equipos remotos que anteriormente se accedian con el equipo anterior.

[**<-Anterior**](scripts_bash.md) | [**Inicio**](indice.md) | [**Siguiente->**](Introducción a Ansible)
