# Implementación de iTop

El propósito de este documento es describir, paso a paso, qué objetos deben crearse para implementar iTop en su organización. Por ejemplo, para crear un ticket de Solicitud de usuario, debe asegurarse de que la persona que llama para esta solicitud exista, que haya al menos un contrato documentado para este cliente que defina los servicios prestados a este cliente, etc. Este documento explica el orden a seguir para crear los objetos en iTop.


Para crear un entorno de producción limpio, es mejor comenzar desde una instancia de iTop instalada sin los datos de muestra. Sin embargo, también puede instalar otra instancia de iTop con los datos de muestra para echar un vistazo rápido a los datos básicos necesarios para producir una instancia completamente funcional.


El siguiente esquema resume el proceso de incorporación:

Administración de la Configuración
==================================
1. Organizaciones
2. Localidades
3. Bienes Tecnológicos


Adminstración de Servicios
==========================
1. Catálogo de servicios
2. Contratos
3. Modelos de entrega
3. Niveles de servicio

Este documento no describe en detalle cómo usar todas las funciones de iTop. Para obtener más detalles sobre el uso de iTop, consulte el "Manual del usuario de iTop".


Modelo de Entrega
=================
El modelo de entrega es el objeto que define qué equipo trabaja para qué cliente. Puede usar un objeto Modelo de entrega para agrupar a todos los "equipos de soporte" para un conjunto determinado de Servicios, o los Equipos de soporte dedicados a un cliente en particular. A cada Organización cliente se le debe asignar uno, y solo uno, Modelo de entrega.

En el modelo de datos estándar iTop 2.0, no existe un vínculo entre los equipos y los servicios. La única limitación al asignar un boleto a un Equipo es que el Equipo debe ser parte del Modelo de Entrega asignado a la Organización que es el cliente del boleto.

Por ejemplo si tienes los siguientes equipos:
- **Equipo de asistencia técnica o mesa de ayuda:** un equipo que procesa todas las solicitudes / llamadas de asistencia técnica.
- **Equipo de soporte de MS Office:** un equipo que procesa todas las solicitudes de soporte sobre MS Office.
- **Equipo de soporte de hardware:** un equipo que maneja llamadas de hardware (reemplazos, nuevos pedidos de hardware)
- **Equipo de soporte de red:** un equipo que maneja problemas relacionados con la red
- **Equipo de servicio de atención al cliente B:** un equipo de servicio de asistencia dedicado al cliente B
- **Equipo de hardware del cliente B:** un equipo que maneja llamadas de hardware para el cliente B

Luego puede construir dos modelos de entrega diferentes:
**"Modelo de entrega 1"** compuesto por:
- Equipo de servicio de asistencia
- Equipo de soporte de MS Office
- Equipo de soporte de red


**"Modelo de entrega 2"** compuesto por:
- Equipo de atención al cliente B
- Cliente B Equipo de hardware
- Equipo de MS Office

El "Modelo de entrega 1" será utilizado por las Organizaciones "Cliente A", "Cliente A1", "Cliente A2" y "Cliente C"; mientras que el "Cliente B" utilizará el "Modelo de entrega 2".

