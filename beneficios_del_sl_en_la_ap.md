# **Software Libre y Administración Pública**
**Gobierno Digital:** Sociedades y Gobiernos en Red. Ciudades Digitales
**Richard M. Stallman** y **Federico Heinz**

Con la informatización, las administraciones públicas de todo el mundo se vuelven cada vez más dependientes del software que utilizan para llevar a cabo su trabajo. Así, el software no libre es incompatible con las exigencias de un estado republicano. 

Los gobiernos del mundo están adoptando tecnologías de informática y comunicaciones a un ritmo desenfrenado. Cada vez más procesos y documentos tradicionalmente basados en papel son convertidos en mecanismos y formatos digitales. Los objetivos que el Estado persigue con esta digitalización son los familiares: mejorar la eficiencia de los procesos, reducir costos de almacenamiento, introducir herramientas de control y medición de gestión, entre otros. Estas ventajas cuantitativas suelen encontrar oídos receptivos en administraciones públicas que se encuentran bajo presión para mejorar su eficiencia, y que a menudo se ven expuestas a desfavorables, e injustas, comparaciones con los estándares del sector privado. 

Si bien los parámetros de medida de desempeño de la administración pública pueden ser muy similares a los usados en las empresas, no debemos olvidar que la misión de la administración pública es muy distinta de la de cualquier empresa, de modo que los indicadores con los que debemos medir su eficacia son completamente distintos. La digitalización de los documentos y procesos de la administración pública, puesta en el contexto de la misión del Estado, tiene consecuencias importantes para su eficacia. 

Dado que la eficacia es más importante que la eficiencia (de nada sirve hacer eficientemente algo que no se debe hacer), es importante analizar estas consecuencias en el momento de tomar la decisión de digitalizar o no, y de elegir la manera de hacerlo en el caso positivo. Teniendo en cuenta que el procesamiento, almacenamiento y transmisión de datos en formato digital son controlados por software, y que éste es distribuido bajo licencias que controlan lo que la administración pública puede hacer con estos programas, las condiciones de dichas licencias pueden marcar la diferencia entre el cumplimiento y el incumplimiento de la misión del Estado.  


## Software libre
La única característica que distingue a los programas libres de los no libres es que son  distribuidos con distintas condiciones de uso, que son fijadas en la licencia del programa. No se trata de diferencias técnicas (por ejemplo, hay Unixes libres y no libres), ni de lenguaje de programación (hay programas libres escritos en casi cualquier lenguaje), ni de modelo de desarrollo (cualquier metodología es adecuada para desarrollar programas libres), ni de interfaz al usuario (el navegador de WWW es un ejemplo de una interfaz que está implementada tanto en programas libres como en privativos). 

De hecho, cualquier programa no libre  puede pasar a ser libre, de la noche a la mañana y sin cambiar un solo byte de su código, con el único trámite de que el titular de sus derechos de autor decida distribuirlo bajo una licencia libre. 

Las licencias libres son aquellas que respetan las libertades fundamentales del usuario de software. Estas son:

* ejecutar el programa con cualquier propósito 
* estudiar el código fuente del  programa, y adaptarlo a sus necesidades 
* distribuir copias del programa 
* mejorar el programa, y distribuir copias del programa mejorado

Por cierto, además de ser distribuido bajo una licencia que respete estas libertades, el código fuente completo del programa debe estar a disposición del usuario, ya que sin él sería impracticable ejercer las libertades de estudiarlo, adaptarlo y mejorarlo. 

Las licencias no libres, o privativas, son aquellas que restringen al usuario en el ejercicio de  cualquiera de estas libertades. Cuando analizamos las consecuencias de que la administración pública se vea privada de alguna de ellas, vemos que son imprescindibles para que el Estado pueda cumplir su misión a conciencia. 

## Los datos de los ciudadanos

Una de las tareas más importantes del gobierno es la custodia de los datos de los ciudadanos. Cada vez que una entidad estatal interactúa con un ciudadano, el resultado es un registro documental del desarrollo y el resultado de la interacción. Tomados en conjunto, los datos custodiados por los distintos organismos estatales representan nuestra memoria social oficial, la referencia legal definitiva cuando existen discrepancias entre los dichos de dos personas. Su contenido es relevante a la identidad, el patrimonio y la historia de cada ciudadano. Se trata de información altamente sensible: su filtración, alteración o pérdida puede tener gravísimas consecuencias para las personas afectadas. Es también información con una vida útil muy larga: a menudo debe ser accesible por cientos de años, y aún cuando ya no sea estrictamente necesaria desde un punto de vista legal, continúa teniendo un enorme valor histórico. 

Dado que esta función está íntimamente ligada a la gestión de información, suele ser una de las primeras candidatas a la digitalización, y con ella a la dependencia del software usado para procesar,  almacenar y transmitir los datos de los ciudadanos. Cuando el Estado utiliza software a los fines de su custodia, es imprescindible que lo haga de tal manera que la seguridad de la información, durante toda su vida útil, no dependa de factores externos a su voluntad. 

Los programas libres exitosos son tan seguros como sus equivalentes privativos, y  frecuentemente más. Hay quienes argumentan que los programas libres tienden a ser más seguros, pero no son perfectos; todos los programadores cometen errores, y cada programa que no sea trivial contiene errores. El mero hecho de ser libre no garantiza la ausencia de vulnerabilidades accidentales, aunque ofrece por lo menos la posibilidad de buscarlas y corregirlas.

Por contraste, el software libre sí ofrece una protección general contra las vulnerabilidades deliberadas, tales como puertas traseras, código espía, bombas lógicas y similares. Cuando el código fuente de un programa no está disponible, o el usuario no tiene permitido estudiar su funcionamiento, es fácil para sus programadores esconder funciones maliciosas dentro de él, sin mucho temor de ser descubiertos. Este riesgo no es meramente teórico: hay abundante documentación sobre instancias en las que aún las empresas más prestigiosas abusan de la confianza del usuario, incluyendo código malicioso en los programas que distribuyen. La única  manera de saber si un programa obedece a lo que la administración pública exige de él, o si en realidad está traicionándola, es ejercitando la libertad de estudiar el funcionamiento del programa, examinando su código fuente, compilándolo, realizando pruebas bajo un depurador, analizando minuciosamente su comportamiento.
 
Los desarrolladores de software privativo están expuestos a la tentación de introducir funciones maliciosas, porque se suponen en la posición de esconderlas o imponerlas. Algunos ceden a la
tentación, y otros no. Pero el desarrollador de un programa libre sabe que no puede imponerles nada a sus usuarios, ni esconder nada de ellos a largo plazo. La probabilidad de ser detectado y frustrado le ayuda a resistir la tentación. 

Otro aspecto en el cual los programas libres son potencialmente más seguros que los privativos, es en la corrección de vulnerabilidades: cuando descubrimos que un programa no cumple con la misión esperada, ya sea por error o por diseño, es necesario corregirlo. Si la licencia restringe la libertad del usuario de hacer la corrección, ya sea por sus propios medios o delegándolo a otros, entonces sólo queda el recurso de acudir al autor del programa, quien estará en condiciones de dictar unilateralmente los alcances, tiempos de entrega y precios de la corrección, e incluso de negarse a corregirlo. Alternativamente, se puede cambiar de programa, pero esto trae aparejado un alto costo, además de una eventual pérdida de datos por incompatibilidad con el sistema anterior.  Para colmo de males, si este nuevo programa tampoco respeta la libertad de realizar modificaciones, en realidad hemos resuelto el síntoma inmediato, pero no el problema de fondo. 

Cuando los distintos organismos estatales administran los datos que le han sido confiados por los ciudadanos, debe asegurarse la facultad de auditar el funcionamiento de todo el software que usa, y eventualmente de corregirlo. Para eso, es imprescindible que disfrute de la libertad de estudiar y adaptar el programa, de corregirlo y de distribuir copias del programa corregido. 

## Actos de gobierno

No basta con que la administración pública tenga el derecho de auditar los programas. Recordemos que el Poder Ejecutivo está obligado a la publicidad de sus actos de gobierno. Esto implica que los ciudadanos tienen derecho a verificar que los procedimientos que su administración instrumenta para implementar las leyes efectivamente son acordes a éstas. El hecho de que un acto de gobierno ocurra parcialmente en el interior de una computadora, como parte  del procesamiento realizado por un programa, no es razón suficiente para esa porción del procedimiento sea sustraída del escrutinio público. Así, es imprescindible que todo el código del software usado por la administración pública esté a disposición de todos los ciudadanos, para que pueda ser revisado por cualquier persona con vocación de hacerlo. De lo contrario, partes cruciales de la acción del gobierno podrían quedar ocultas a la sociedad, lo que es claramente inaceptable. Para que el código pueda ser público, la licencia bajo la que el Estado lo obtiene debe permitir la distribución de copias a cualquiera que las solicite, bajo condiciones tales que sea posible realizar pruebas arbitrarias en condiciones de producción. 

Los ciudadanos delegan autoridad en el gobierno con la idea de que éste actúe como entidad soberana e independiente, con el fin de mejorar el bienestar general de la población. Así, el Estado debe asegurarse la facultad de procesar los datos bajo su custodia de cualquier manera que juzgue necesario, y para los fines que considere oportunos. Es inaceptable que un tercero esté en condiciones de limitar lo que la administración pública puede hacer con la información, simplemente por ser quien distribuye los programas con los que se la procesa. 

## La libertad como valor

La administración pública es un actor social muy influyente: muchas de sus acciones  determinan la manera en la que los ciudadanos deben desempeñar ciertas tareas, y el hecho de ser la única institución con la que todos los ciudadanos deben interactuar la pone en situación de imponer comportamientos y herramientas. Cuando el Estado utiliza software no libre en sus sistemas, software que no puede compartir con sus ciudadanos, está implícitamente señalando a éstos que la conveniencia de utilizar determinado programa es más  importante que la preservación de valores como la solidaridad, la libertad, y la igualdad de las personas.

Como consecuencia de la digitalización de los documentos y procedimientos del Estado, los vínculos digitales pasan a ocupar un lugar de preferencia a la hora de comunicarse con la Administración Pública: a fines de mejorar su eficiencia interna, muchos organismos estatales comienzan a permitir, y en ocasiones incluso a exigir la presentación de documentos en formatos digitales. Con mucha frecuencia, el Estado suele utilizar como la popularidad en el mercado como criterio de selección de formatos y protocolos para estas comunicaciones. Si bien se puede argumentar a favor de la eficiencia de este modo de selección, presenta el problema de dar tratamiento preferencial a los clientes de ciertas empresas, en detrimento de aquellos que no lo son. Esto es completamente inaceptable por parte de Estado, que debe tratar a todos los ciudadanos por igual. La única manera de garantizar esta igualdad en el trato es eligiendo siempre protocolos y formatos estándar, completamente documentados y que puedan ser implementados por cualquier persona u organización en igualdad de condiciones. 

Si el Estado decide usar herramientas informáticas, debe también agotar los recursos para que la mayor cantidad posible de ciudadanos puedan sacar provecho de sus avances. Además de asegurarse de que los canales digitales de comunicación con el Estado estén abiertos a todos, debe buscar maneras de facilitar a la población el acceso a todos los programas que usa. Los programas libres ofrecen al Estado la oportunidad de distribuir libremente copias del programa entre los ciudadanos, y a éstos la facultad de adaptarlos a sus necesidades de modo de ser  útiles en el entorno de procesamiento de datos de su elección. Las licencias privativas obligan al Estado a privilegiar los intereses privados de los autores de los programas por encima del bienestar general de la población.

 ## Conclusiones

 El uso juicioso de las herramientas informáticas tiene un gran potencial de mejorar tanto la  eficiencia como la eficacia de las tareas desarrolladas por la administración pública. Un elemento ineludible del juicio a aplicar es asegurarse de que las condiciones de licenciamiento de los programas no restrinjan la libertad de uso, estudio, modificación y redistribución de los programas. Renunciar a estas libertades es socavar la capacidad del Estado para cumplir debidamente con su misión. 

**GOBIERNO DIGITAL, 2005**  


<br />  


[**<- Anterior**](software_libre.md) | [**Inicio**](README.md) | [**Siguiente ->**](laboratorio.md) 
