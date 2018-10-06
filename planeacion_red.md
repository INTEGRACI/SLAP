# Planeación de la red.

La protección de los datos almacenados en los sistemas de cómputo en una entidad de gobierno se requiere que sean protegidos de personas o programas no autorizadas para que la información pública sea confidencial, integra y disponible. Lo anterior es conocido como la triada de la seguridad informática y alcanzarlo se requiere de lo siguiente:

1. Requisitos de la red.
2. Requisitos de la red física.
3. Servicios de red.
4. Escritorio de trabajo para los usuarios.
5. Herramientas y aplicaciones de los usuarios.

Los anteriores puntos permitirán instalar los servicios y aplicaciones necesarias para la administración pública, así como bridar una seguridad en la información pública que se este manejando.

<H2>Requisitos de la red.</H2>
Antes de iniciar la instalación del sistema operativo junto con sus servicios y apliciones; se debe de seleccionar de considerar el dominio y segmento de red que se vaya a utilizar. Lo anterior es de suma importancia para tener una red organizada y estructurada para facilitar al administrador de sistemas realizar actualizaciones, detectar y corregir fallos que se puedan presentar en la red de la organización pública.

<H3> Segmento de red</H3>
Antes de seleccionar un segmento de red privada de clase A, B o C se debe de considerar el número de dispositivos conectados a la red (equipo de cómputo, impresoras de red, cámaras IPs, teléfonos IPs y servidores) y áreas que contará la organización. Lo anterior permitirá que las áreas u oficinas de trabajo esten separadas para disminuir que puedan usuarios de otras áreas puedan ver contenidos compartidos de un área en específico, así como también a tener mejor estructurada la organización. Para seleccionar el tipo de clase de red privada se debe de responder lo siguiente:
1. Número de áreas, para un mejor entendimiento se puede basar en el organigrama de la organización.
2. Número de equipos de cómputo, impresoras, cámaras IPs, inalámbricos y servidores por área.

Tienen los números de dispositivos de red y área se puede escoger un segmento de red de clase C cuyo segmento es 192.168.1.0/24, la cual nos permite tener hasta 253 direccions IPs. Clase B, cuyo segmento es 172.16.0.0/16 y se tiene un rango de direcciones IP's de 172.16.1.1 hasta 172.16.15.255 direcciones IPs y por último clase A cuyo segmento de red es 10.0.0.0/8 con lo cual, se tiene un rango de direcciones desde 10.1.1.1 hasta 10.1.1.254.

Ejemplo:
En la organización se cuenta con las siguientes áreas sistemas, administración, invitados, cajas, contabilidad y finanzas. Cada área cuenta con la siguiente cantidad de equipos de cómputo.

- Sistemas.
 - Servidores: 5
 - Estaciones de trabajo: 3
 - Inalámbricos: 3
 - Cámaras IPs: 10

- Administración.
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

- Telefonía:
 - Telefonos: 40
 
Sumar todos los dispositivos y áreas para seleccionar el tipo de red privada.

Total de áreas: 7
Total de equipo de cómputo: 141

Una vez que se conoce el número de hosts, se puede emplear una red privada de clase C (192.168.1.0/24) con subnetting para cada área en específico y sobran direcciones para el crecimiento a futuro de la organización pública. Con base al ejemplo anterior se

<H2>Requisitos de la red física.</H2>
Una vez que se cuenta con el diseño de la red lógica se procede a realizar el diseño de la red física que permitirá ubicar físicamente los dispositivos intermedios y finales; así como también los espacios en donde pasarán los cables y los lugares en donde se instalarán los dispositivos  para su intercomunicación entre ellos y salida a Internet.

La instalación de un sistema de cableado estructurado es la base para la buena interconexión de los dispositivos. Con base a lo anterior se tiene que realizar las siguientes actividades.
1. Visita en sitio, esto permite conocer las áreas en donde se instalará los equipos de computó, lugares por donde pasarán los cables de red, los IDFs y MDF (Sites); así como también tomar la decisión de usar par trenzado, fibra óptica o inalámbrico para la transferencia de datos entre diferentes dispositos.
2. Detectar el dispositivo más alejado y cercano del punto de presencia (POP, por sus siglas en ingles) o del site (MDF) para poder situar los IDF's y seleccionar el tipo de cableado a utlizar (ethernet o fibra óptica).
3. Etiquetado, identificación y ubicacación del cableado, puesta tierra, ductos y documentación con base al estándar ANSI/TIA/EIA/606-A para el sistema de cableado estructurado.
4. En caso de implementar redes inalámbricas, se debe de identificar el número de usuarios simultaneos que puede soportar el punto de acceso, frecuencia a utilizar. En el caso de usar la banda 2.4 GHz se recomienda una separación de 3 canales por inalámbricos y con la misma polarización.
5. Realizar presupuesto que abarque material, mano de obra, instalación y configuración de los dispositivos.

<H2>Servicios de Red.</H2>
Toda organización pública o privada requieren compartir información, Internet, página web de la empresa, capacitación en línea, correo, conmutador telefónico, bloquear accesos no autorizados y filtrado de contenido; lo que permitirá mejorar y automatizar sus procesos tanto interno y externos, así como también mitigar las amenazas ciberneticas que pueden perjudiicar a los procesos de la organización.

**Samba.
Es un software libre que permite compartir datos e impresoras con equipoos Windows, Linux y Unix; así como también permite interactuar con directorios activos (LDAP o Kerberos) para controlar el acceso a directorios e impresoras a usuarios.

**iTOP
Es un sistema de base de datos de configuración de bienes tecnológicos (CMDB, por sus siglas en ingles), el cual permite tener identificado y relacionado los componentes de TI que contenga la organización.

**Joomla
Es un sistema de gestión de contenido que permite desarrollar sitios dinámicos e interactivos. Permite crear, modificar o eliminar contenido del sitio de manera sencilla a través de un panel de administración.

**Moodle.
Es un sistema de administración del aprendizaje(LMS, por sus siglas en ingles) que permite crear una plataforma de aprendizaje con base al elearning. Lo cual, el instructor/docente puede subir contenido, actividades y evaluaciones dinámicas de las diferentes materias que se imparten en las diferentes instituciones de nivel básico, media o superior.

**Qmail.
Es un sistema de correo electrónico que permite enviar correos e interactua con antivirus clamav para detectar y eliminar correos cuyo contenido contengan programas maliciosos. También tiene compatibilidad con spam assassin para eliminar correos basuras para evitar los usuarios tengan en su buzón correos publicitarios.

**Squid.
Es un proxy cache para web con soporte a los protocolos HTTP, HTTPS, FTP entre otros; por lo que permite almacenar en cache las páginas visitadas por los usuarios, permitiendo desminuir el consumo de ancho de banda y reduciir los tiempos de respuestas. También ayuda a controlar el contenido de las páginas web visitadas por el usuario y controlar el acceso a Internet.

**Asterisk.
Es un proyecto de telecomunicaciones que permite crear una central telefónica (PBX, por sus siglas en ingles) o pasarela PBX para comunicar teléfonos IP's, analógos o de software; a la red telefónica (PSTN por sus siglas en ingles) o realizar llamadas dentro de la organización. Dicho software cuenta con diferentes módulos como son: llamada en espera, autorespuesta, sigueme, respuesta de voz interactiva (IVR, por sus siglas en ingles), buzón de voz, redireccionamiento de llamada entre otros.

**FreeIPA
Es un programa que permite administrar identidades (cuenta de usuarios), politicas y auditoría cuyo objetivo es proveer una interfaz segura y sencilla para la administración de identidades, orientado principalmente a entornos basados en Red Hat y compatible con posix.

**Servidor de Nombre de dominio.
Servicio que permite admnistrar los dominios y traducirlos a direcciones ip's dentro de la organización.

**NTP.
Servicio que permite a servidores y estaciones de trabajo sincronizar la fecha y hora para registrar los eventos y sincronizar los equipos de cómputo con directorios activos.

**Ansible.
Es una plataforma que sirve para configurar y administrar equipos de cómputo y servidores. Lo que permite, disminuir los tiempos de instalación y de configuración de los equipos de cómputo.

<H2>Escritorios de trabajo para los usuarios.</H2>
En la actualidad existen diferentes distribuciones de Linux, así como también de entornos de escritorios pero se debe de seleccionar el que sea agradable, confortable y estable para el usuario y administrador. La distribución que más se apega a lo anterior es Fedora que es mantenido por la comunidad y Red Hat. Además la distribución cuenta con diferentes entornos gráficos como son: Gnome, XFC, KDE, MATE, LXDE, Cinnamon y SOAS que son amigable e intuitivo para el usuario final.

<H2>Herramientas y aplicaciones de los usuarios.</H2>
En la actualidad existen diferentes paqueterías y aplicaciones similares a las que se ejecutan en un entorno de Windows como son:
1. Libre office, es una suite similar a Office que contiene hojas de cálculo, editor de documentos, editor de presentaciones, base de datos, dibujo, entre otros. La suite es totalmente intuitiva para el usuario por lo que la curva de aprendizaje es menor.
2. Thunderbird, es una aplicación de cliente correo similar a outlook que permite conectarse con cualquier proveedor de correo electrónico y su interfaz es amigable e intuitiva.
3. FireFox, es un navegador que soporta la gran mayoría de los plugins que contienen las páginas web.
4. Evince, es un programa que permite visualizar documentos pdf.
5. Gimp, es una aplicación que permite manipular imagenes en cualquiera de los formatos existentes y es ideal para diseñadores.
6. Además de otros programas que permiten al usuario personalizar el escritorio, configuración de impresoras, reproductor de audio, etc.

[**<-Anterior**](creacion_usb_instalacion.md) | [**Inicio**(indice.md)] | [**Siguiente->**](Instalacion_estacion_trabajo_administrador.md)
