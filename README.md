# 🗄️ User Manager – Database Setup

## 📄 Descripción

Este documento proporciona las instrucciones para configurar la base de datos `USER_MANAGER`, incluyendo la creación de sus tablas, carga de datos iniciales y procedimientos almacenados necesarios para el sistema de gestión de usuarios.

---

## ✅ Requisitos previos

- 🛠️ **SQL Server** (recomendado: versión 2012 o superior)
- 🔐 **Permisos suficientes** para crear bases de datos, tablas y procedimientos almacenados

---

## ⚙️ Proceso de instalación

### 1️⃣ Ejecución del DDL (estructura de la base de datos)

Ejecutar los scripts de creación para:

- Base de datos `USER_MANAGER`
- Esquema `UMA`
- Tablas:
  - `GENDER`
  - `USERS`

---

### 2️⃣ Ejecución del DML (datos iniciales)

Cargar los datos de prueba/iniciales en las siguientes tablas:

- `GENDER` (ej.: Masculino, Femenino)
- `USERS` (usuarios de prueba si es necesario)

---

### 3️⃣ Ejecución de los procedimientos almacenados (Stored Procedures)

Ejecutar los scripts de creación de los siguientes SP:

| Procedimiento         | Descripción                                           |
|-----------------------|-------------------------------------------------------|
| `SP_GET_USERS`        | Obtiene todos los usuarios registrados.               |
| `SP_GET_USER_BY_ID`   | Obtiene un usuario específico por su ID.              |
| `SP_INSERT_USER`      | Inserta un nuevo usuario con validaciones.            |
| `SP_UPDATE_USER`      | Actualiza los datos de un usuario existente.          |
| `SP_DELETE_USER`      | Elimina un usuario de la base de datos.               |

---

## 🧭 Orden recomendado de ejecución

1. 🧱 **DDL** – Creación de estructura (base de datos, tablas y esquema)
2. 🧾 **DML** – Inserción de datos iniciales
3. ⚙️ **SP** – Procedimientos almacenados

---

## 📦 Cómo utilizar este repositorio

### 🔁 Opción 1: Clonar el repositorio

Clona el proyecto desde GitHub usando el siguiente comando:

git clone https://github.com/halcondorado123/UserManagerApp_DB

Luego, abre los archivos .sql en SQL Server Management Studio (SSMS) o Azure Data Studio y ejecútalos en el orden recomendado:

01_create_database.sql

02_create_tables.sql

03_insert_initial_data.sql

04_create_stored_procedures.sql

### 📝 Opción 2: Copiar y pegar los scripts

También puedes navegar por el repositorio, abrir cada archivo .sql, copiar su contenido y pegarlo directamente en tu entorno SQL Server para ejecutarlo manualmente.

📌 Notas adicionales

✅ Asegúrate de tener seleccionada la base de datos USER_MANAGER antes de ejecutar los scripts de tablas o procedimientos.

🛡️ Los procedimientos almacenados incluyen validaciones para mantener la integridad de los datos.

🔐 Es recomendable ejecutar los scripts como administrador para evitar errores de permisos.

🧰 Este proceso dejará completamente configurada la base de datos necesaria para el sistema de gestión de usuarios.


---

Este proceso dejará completamente configurada la base de datos para el sistema de gestión de usuarios.

---
