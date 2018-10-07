# Creación de USB booteable para instalación Linux.

Hay dos formas para generar una memoria USB booteable con Centos o Fedora. Las cuales son por medio de la terminal de Linux o usando algún programa de software libre, como puede ser tuxboot (http://tuxboot.org). En este caso lo haremos por medio de la terminal.

**Terminal**
Una vez selecionada y descargada la distribución en formato iso, se procede a crear la USB booteable por medio del comando ***dd***. Dicho comando se encuentra en todas las distribuciones por lo que será más fácil de copiar la imagen a una memoria. La síntaxis del comando es el siguiente:

dd if=/directorio/imagen/iso bs=512 of=/dev/memoria

El parámetro if, sirve para indicar el archivo a copiar.
El parámetro bs, indica el número de bytes a leer o escribir.
El parámetro of, sirve para indicar el destino en donde se va a copiar el archivo.

En el siguiente ejemplo se va hacer booteable la memoria /dev/sdb1 en la que tendrá la imagen de CentOS.

Ejemplo:

dd if=/home/usuario/CentOS-7-x86_64-DVD-1804.iso bs=512 of=/dev/sdb1

Una vez ejecutado el comando se espera a que termine de realizar la copia de la imagen a la memoria USB. Luego se procede a reiniciar la computadora con el BIOS configurado para iniciar con la memoria USB.

[**<-Anterior**](descarga_centos.md) | [**Inicio**](indice.md) | [**Siguiente->**](planeacion_red.md)
