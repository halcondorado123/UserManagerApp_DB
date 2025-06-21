README - User Manager Database Setup
Descripción
Este documento proporciona las instrucciones para configurar la base de datos USER_MANAGER con sus tablas, datos iniciales y procedimientos almacenados necesarios para el sistema de gestión de usuarios.

Requisitos previos
SQL Server (versión 2012 o superior recomendada)

Permisos suficientes para crear bases de datos, tablas y procedimientos almacenados

Proceso de instalación
1. Ejecución del DDL (Estructura de la base de datos)
Ejecutar los scripts de creación de la base de datos, esquema y tablas (GENDER y USERS).

2. Ejecución del DML (Datos iniciales)
Ejecutar los scripts de inserción de datos en las tablas GENDER y USERS para cargar registros iniciales.

3. Ejecución de los Procedimientos Almacenados (SP)
Ejecutar los scripts de creación de los siguientes procedimientos almacenados:

SP_GET_USERS: Obtiene todos los usuarios registrados.

SP_GET_USER_BY_ID: Obtiene un usuario específico por su ID.

SP_INSERT_USER: Inserta un nuevo usuario con validaciones.

SP_UPDATE_USER: Actualiza los datos de un usuario existente.

SP_DELETE_USER: Elimina un usuario de la base de datos.

Orden recomendado de ejecución
DDL (Creación de estructura)

DML (Inserción de datos iniciales)

SP (Procedimientos almacenados)

Notas adicionales
Asegúrese de ejecutar los scripts en el orden indicado para evitar errores de dependencia.

Verifique que la base de datos USER_MANAGER esté seleccionada antes de ejecutar los scripts de tablas y procedimientos.

Los procedimientos almacenados incluyen validaciones para garantizar la integridad de los datos.

Este proceso configurará completamente la base de datos necesaria para el sistema de gestión de usuarios.
