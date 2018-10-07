# Trabajando con SSH.
SSH (Secure SHell) es una de las mejores herraminetas con las que se cuentan para poder acceder y administrar equipos enforma remota y segura; en este art√culo veremos desde la instalaci√n hasta algunos tips de utilidad para llevar a cabo las tareas de administraci√n b√sicas.

## Instalaci√n de OpenSSH.
Aunque en la mayor√a de las distribuciones se tiene instalado. Se presenta la instalaci√n del servidor ssh en Fedora, ejecutando el siguiente comando:

>su -c "dnf -y install openssh-server"

Para iniciar el servicio, ingresamos el siguiente comando.

>su -c "systemctl start sshd.service"

Para iniciar el servicio al momento que se arranque el sistema operativo, se ejecuta lo siguiente:

>su -c "systemctl enable sshd.service"

## Autenticaci√n sin contrase√a.
En ocasiones se realizar√n actividades con equipos remotos en forma automatizada como es el caso de Ansible. Para evitar que sea solicitada la contrase√a cada vez que se conecta por SSH podemos generar una llave y enviarla al equipo, as√ este reconocer√ que las instrucciones provienen de un dispositivo de confianza y se ejecutar√, en caso de modificarse las llaves, estas deber√n de actualizarse. Para generar la llave SSH se realiza los siguientes comandos.

Con el usuario que se vaya a trabajar, se debe de acceder a su directorio principal.
>cd ~/

Crear el directorio donde se almacenar√ las llaves SSH.
>mkdir ~/.ssh

Cambiar permisos al directorio para que solamente el propietario tenga acceso total.
>chmod 700 ~/.ssh

Generar llave.
>ssh-keygen -t rsa

Copiar la llave al equipo remoto que se desea administrar sin necesidad de la contrase√a.
>ssh-copy-id -i ~/.ssh/id_rsa.pub usuario@equipo.

Donde usuario es la cuenta de computadora/servidor remoto y equipo puede ser una direcci√n ip o dominio.

En caso de que se cuente con las llaves pero se cambia de equipo y se desea usar las llaves generadas. Se hace lo siguiente.
>mkdir ~/.ssh

Copiar los archivos id_rsa e id_rsa.pub en el directorio ~/.ssh
>copy rsa_pub* ~/.ssh

A√adir la identidad de las llaves.
>ssh-add ~/.ssh/id_rsa

Con lo anterior, permitir√ que se pueda acceder a los equipos remotos que anteriormente se accedian con el equipo anterior.

[**<- Anterior **](scripts_bash.md) | [**Inicio**](indice.md) | [**Siguiente ->](Introducci√n a Ansible)
