# Creaci�n de USB booteable para instalaci�n Linux.

Hay dos formas para generar una memoria USB booteable con Centos o Fedora. Las cuales son por medio de la terminal de Linux o usando alg�n programa de software libre, como puede ser tuxboot (http://tuxboot.org). En este caso lo haremos por medio de la terminal.

**Terminal**
Una vez selecionada y descargada la distribuci�n en formato iso, se procede a crear la USB booteable por medio del comando ***dd***. Dicho comando se encuentra en todas las distribuciones por lo que ser� m�s f�cil de copiar la imagen a una memoria. La s�ntaxis del comando es el siguiente:

dd if=/directorio/imagen/iso bs=512 of=/dev/memoria

El par�metro if, sirve para indicar el archivo a copiar.
El par�metro bs, indica el n�mero de bytes a leer o escribir.
El par�metro of, sirve para indicar el destino en donde se va a copiar el archivo.

En el siguiente ejemplo se va hacer booteable la memoria /dev/sdb1 en la que tendr� la imagen de CentOS.

Ejemplo:

dd if=/home/usuario/CentOS-7-x86_64-DVD-1804.iso bs=512 of=/dev/sdb1

Una vez ejecutado el comando se espera a que termine de realizar la copia de la imagen a la memoria USB. Luego se procede a reiniciar la computadora con el BIOS configurado para iniciar con la memoria USB.

[**<-Anterior**](descarga_centos.md) | [**Inicio**](indice.md) | [**Siguiente->**](planeacion_red.md)
