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

## 📌 Notas adicionales

- 🔁 Asegúrese de **ejecutar los scripts en el orden indicado** para evitar errores de dependencia.
- ✅ Verifique que la base de datos `USER_MANAGER` esté seleccionada antes de ejecutar los scripts de tablas y procedimientos.
- 🧪 Los procedimientos almacenados incluyen validaciones básicas para garantizar la **integridad de los datos**.

---

Este proceso dejará completamente configurada la base de datos para el sistema de gestión de usuarios.

---
