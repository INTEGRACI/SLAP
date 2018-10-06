# Planeaci�n de la red.

La protecci�n de los datos almacenados en los sistemas de c�mputo en una entidad de gobierno se requiere que sean protegidos de personas o programas no autorizadas para que la informaci�n p�blica sea confidencial, integra y disponible. Lo anterior es conocido como la triada de la seguridad inform�tica y alcanzarlo se requiere de lo siguiente:

1. Requisitos de la red.
2. Requisitos de la red f�sica.
3. Servicios de red.
4. Escritorio de trabajo para los usuarios.
5. Herramientas y aplicaciones de los usuarios.

Los anteriores puntos permitir�n instalar los servicios y aplicaciones necesarias para la administraci�n p�blica, as� como bridar una seguridad en la informaci�n p�blica que se este manejando.

<H2>Requisitos de la red.</H2>
Antes de iniciar la instalaci�n del sistema operativo junto con sus servicios y apliciones; se debe de seleccionar de considerar el dominio y segmento de red que se vaya a utilizar. Lo anterior es de suma importancia para tener una red organizada y estructurada para facilitar al administrador de sistemas realizar actualizaciones, detectar y corregir fallos que se puedan presentar en la red de la organizaci�n p�blica.

<H3> Segmento de red</H3>
Antes de seleccionar un segmento de red privada de clase A, B o C se debe de considerar el n�mero de dispositivos conectados a la red (equipo de c�mputo, impresoras de red, c�maras IPs, tel�fonos IPs y servidores) y �reas que contar� la organizaci�n. Lo anterior permitir� que las �reas u oficinas de trabajo esten separadas para disminuir que puedan usuarios de otras �reas puedan ver contenidos compartidos de un �rea en espec�fico, as� como tambi�n a tener mejor estructurada la organizaci�n. Para seleccionar el tipo de clase de red privada se debe de responder lo siguiente:
1. N�mero de �reas, para un mejor entendimiento se puede basar en el organigrama de la organizaci�n.
2. N�mero de equipos de c�mputo, impresoras, c�maras IPs, inal�mbricos y servidores por �rea.

Tienen los n�meros de dispositivos de red y �rea se puede escoger un segmento de red de clase C cuyo segmento es 192.168.1.0/24, la cual nos permite tener hasta 253 direccions IPs. Clase B, cuyo segmento es 172.16.0.0/16 y se tiene un rango de direcciones IP's de 172.16.1.1 hasta 172.16.15.255 direcciones IPs y por �ltimo clase A cuyo segmento de red es 10.0.0.0/8 con lo cual, se tiene un rango de direcciones desde 10.1.1.1 hasta 10.1.1.254.

Ejemplo:
En la organizaci�n se cuenta con las siguientes �reas sistemas, administraci�n, invitados, cajas, contabilidad y finanzas. Cada �rea cuenta con la siguiente cantidad de equipos de c�mputo.

- Sistemas.
 - Servidores: 5
 - Estaciones de trabajo: 3
 - Inal�mbricos: 3
 - C�maras IPs: 10

- Administraci�n.
 - Impresoras: 3
 - Estaciones de trabajo: 15

 - Invitados.
 - Estaciones de trabajo: 30

- Cajas.
 - Estaciones de trabajo: 5

- Contabilidad.
 - Estaciones de trabajo: 15
 - Impresoras: 3

- Finanzas.
 - Estaciones de trabajo: 12
 - Impresoras: 3

- Telefon�a:
 - Telefonos: 40
 
Sumar todos los dispositivos y �reas para seleccionar el tipo de red privada.

Total de �reas: 7
Total de equipo de c�mputo: 141

Una vez que se conoce el n�mero de hosts, se puede emplear una red privada de clase C (192.168.1.0/24) con subnetting para cada �rea en espec�fico y sobran direcciones para el crecimiento a futuro de la organizaci�n p�blica. Con base al ejemplo anterior se

<H2>Requisitos de la red f�sica.</H2>
Una vez que se cuenta con el dise�o de la red l�gica se procede a realizar el dise�o de la red f�sica que permitir� ubicar f�sicamente los dispositivos intermedios y finales; as� como tambi�n los espacios en donde pasar�n los cables y los lugares en donde se instalar�n los dispositivos  para su intercomunicaci�n entre ellos y salida a Internet.

La instalaci�n de un sistema de cableado estructurado es la base para la buena interconexi�n de los dispositivos. Con base a lo anterior se tiene que realizar las siguientes actividades.
1. Visita en sitio, esto permite conocer las �reas en donde se instalar� los equipos de comput�, lugares por donde pasar�n los cables de red, los IDFs y MDF (Sites); as� como tambi�n tomar la decisi�n de usar par trenzado, fibra �ptica o inal�mbrico para la transferencia de datos entre diferentes dispositos.
2. Detectar el dispositivo m�s alejado y cercano del punto de presencia (POP, por sus siglas en ingles) o del site (MDF) para poder situar los IDF's y seleccionar el tipo de cableado a utlizar (ethernet o fibra �ptica).
3. Etiquetado, identificaci�n y ubicacaci�n del cableado, puesta tierra, ductos y documentaci�n con base al est�ndar ANSI/TIA/EIA/606-A para el sistema de cableado estructurado.
4. En caso de implementar redes inal�mbricas, se debe de identificar el n�mero de usuarios simultaneos que puede soportar el punto de acceso, frecuencia a utilizar. En el caso de usar la banda 2.4 GHz se recomienda una separaci�n de 3 canales por inal�mbricos y con la misma polarizaci�n.
5. Realizar presupuesto que abarque material, mano de obra, instalaci�n y configuraci�n de los dispositivos.

<H2>Servicios de Red.</H2>
Toda organizaci�n p�blica o privada requieren compartir informaci�n, Internet, p�gina web de la empresa, capacitaci�n en l�nea, correo, conmutador telef�nico, bloquear accesos no autorizados y filtrado de contenido; lo que permitir� mejorar y automatizar sus procesos tanto interno y externos, as� como tambi�n mitigar las amenazas ciberneticas que pueden perjudiicar a los procesos de la organizaci�n.

**Samba.
Es un software libre que permite compartir datos e impresoras con equipoos Windows, Linux y Unix; as� como tambi�n permite interactuar con directorios activos (LDAP o Kerberos) para controlar el acceso a directorios e impresoras a usuarios.

**iTOP
Es un sistema de base de datos de configuraci�n de bienes tecnol�gicos (CMDB, por sus siglas en ingles), el cual permite tener identificado y relacionado los componentes de TI que contenga la organizaci�n.

**Joomla
Es un sistema de gesti�n de contenido que permite desarrollar sitios din�micos e interactivos. Permite crear, modificar o eliminar contenido del sitio de manera sencilla a trav�s de un panel de administraci�n.

**Moodle.
Es un sistema de administraci�n del aprendizaje(LMS, por sus siglas en ingles) que permite crear una plataforma de aprendizaje con base al elearning. Lo cual, el instructor/docente puede subir contenido, actividades y evaluaciones din�micas de las diferentes materias que se imparten en las diferentes instituciones de nivel b�sico, media o superior.

**Qmail.
Es un sistema de correo electr�nico que permite enviar correos e interactua con antivirus clamav para detectar y eliminar correos cuyo contenido contengan programas maliciosos. Tambi�n tiene compatibilidad con spam assassin para eliminar correos basuras para evitar los usuarios tengan en su buz�n correos publicitarios.

**Squid.
Es un proxy cache para web con soporte a los protocolos HTTP, HTTPS, FTP entre otros; por lo que permite almacenar en cache las p�ginas visitadas por los usuarios, permitiendo desminuir el consumo de ancho de banda y reduciir los tiempos de respuestas. Tambi�n ayuda a controlar el contenido de las p�ginas web visitadas por el usuario y controlar el acceso a Internet.

**Asterisk.
Es un proyecto de telecomunicaciones que permite crear una central telef�nica (PBX, por sus siglas en ingles) o pasarela PBX para comunicar tel�fonos IP's, anal�gos o de software; a la red telef�nica (PSTN por sus siglas en ingles) o realizar llamadas dentro de la organizaci�n. Dicho software cuenta con diferentes m�dulos como son: llamada en espera, autorespuesta, sigueme, respuesta de voz interactiva (IVR, por sus siglas en ingles), buz�n de voz, redireccionamiento de llamada entre otros.

**FreeIPA
Es un programa que permite administrar identidades (cuenta de usuarios), politicas y auditor�a cuyo objetivo es proveer una interfaz segura y sencilla para la administraci�n de identidades, orientado principalmente a entornos basados en Red Hat y compatible con posix.

**Servidor de Nombre de dominio.
Servicio que permite admnistrar los dominios y traducirlos a direcciones ip's dentro de la organizaci�n.

**NTP.
Servicio que permite a servidores y estaciones de trabajo sincronizar la fecha y hora para registrar los eventos y sincronizar los equipos de c�mputo con directorios activos.

**Ansible.
Es una plataforma que sirve para configurar y administrar equipos de c�mputo y servidores. Lo que permite, disminuir los tiempos de instalaci�n y de configuraci�n de los equipos de c�mputo.

<H2>Escritorios de trabajo para los usuarios.</H2>
En la actualidad existen diferentes distribuciones de Linux, as� como tambi�n de entornos de escritorios pero se debe de seleccionar el que sea agradable, confortable y estable para el usuario y administrador. La distribuci�n que m�s se apega a lo anterior es Fedora que es mantenido por la comunidad y Red Hat. Adem�s la distribuci�n cuenta con diferentes entornos gr�ficos como son: Gnome, XFC, KDE, MATE, LXDE, Cinnamon y SOAS que son amigable e intuitivo para el usuario final.

<H2>Herramientas y aplicaciones de los usuarios.</H2>
En la actualidad existen diferentes paqueter�as y aplicaciones similares a las que se ejecutan en un entorno de Windows como son:
1. Libre office, es una suite similar a Office que contiene hojas de c�lculo, editor de documentos, editor de presentaciones, base de datos, dibujo, entre otros. La suite es totalmente intuitiva para el usuario por lo que la curva de aprendizaje es menor.
2. Thunderbird, es una aplicaci�n de cliente correo similar a outlook que permite conectarse con cualquier proveedor de correo electr�nico y su interfaz es amigable e intuitiva.
3. FireFox, es un navegador que soporta la gran mayor�a de los plugins que contienen las p�ginas web.
4. Evince, es un programa que permite visualizar documentos pdf.
5. Gimp, es una aplicaci�n que permite manipular imagenes en cualquiera de los formatos existentes y es ideal para dise�adores.
6. Adem�s de otros programas que permiten al usuario personalizar el escritorio, configuraci�n de impresoras, reproductor de audio, etc.

[**<-Anterior**](creacion_usb_instalacion.md) | [**Inicio**(indice.md)] | [**Siguiente->**](Instalacion_estacion_trabajo_administrador.md)
