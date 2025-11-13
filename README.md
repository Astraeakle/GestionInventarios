# 📦 Proyecto Inventario

Este repositorio contiene un sistema completo de gestión de inventario, compuesto por:

* **Backend** → Laravel (PHP 8.2)
* **Base de datos** → PostgreSQL 16
* **Frontend** → Vue 3 + Vite + pnpm

---

## 📂 Estructura del proyecto

* `/api` → Código fuente del **backend** (Laravel)
* `/admin` → Código fuente del **frontend** (Vue 3 + Vite)
* `inventario_backup.sql` → Backup de base de datos usado para restauración inicial

---

## ✅ Requisitos previos

* PHP 8.2+
* Composer
* PostgreSQL 16
* Node.js + pnpm
* (Opcional) Docker Desktop si se usa contenedores

---

## 🔐 Configuración del archivo `.env`

Dentro de `api/` existe un archivo `.env.example` que sirve como plantilla.

### 1️⃣ Crear tu archivo `.env` desde el ejemplo

```bash
cd api
cp .env.example .env
```

### 2️⃣ Generar la APP_KEY requerida por Laravel

```bash
php artisan key:generate
```

Esto rellenará automáticamente el valor:

```
APP_KEY=base64:xxxxxxxxxx
```

### 3️⃣ Generar el JWT_SECRET

```bash
php artisan jwt:secret
```

Esto generará la clave:

```
JWT_SECRET=xxxxxxxxxx
```

### 4️⃣ Crear el enlace simbólico para almacenar imágenes

```bash
php artisan storage:link
```

---

## 🛠️ Comandos útiles

### Ver logs (solo si usas Docker)

```bash
docker logs inventario_backend
docker logs inventario_frontend
docker logs inventario_db
```

### Entrar al contenedor del backend

```bash
docker exec -it inventario_backend bash
```

### Ejecutar migraciones

```bash
php artisan migrate
```

### Reiniciar todo desde cero (Docker)

```bash
docker compose down -v
docker compose up -d --build
```

---

## ♨️ Iniciar el proyecto (Modo desarrollo)

### 🔹 Frontend

La primera vez debes instalar dependencias:

```bash
cd admin
pnpm install
pnpm run dev
```

### 🔹 Backend

Instalar dependencias:

```bash
cd api
composer install
```

Iniciar servidor:

```bash
php artisan serve
```

---