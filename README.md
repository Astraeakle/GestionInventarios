# 📦 Proyecto Inventario

Este repositorio contiene un sistema completo de gestión de inventario, compuesto por:

* **Backend** → Laravel (PHP 8.2)
* **Base de datos** → PostgreSQL 16
* **Frontend** → Vue 3 + Vite + pnpm

El proyecto está completamente **dockerizado** para facilitar la instalación y ejecución en cualquier máquina sin configuraciones complicadas.

---

## 📂 Estructura del proyecto

* `/api` → Código fuente del **backend** (Laravel)
* `/admin` → Código fuente del **frontend** (Vue 3 + Vite)
* `docker-compose.yml` → Configuración principal de Docker Compose
* `inventario_backup.sql` → Backup que inicializa la base de datos automáticamente al primer arranque

---

## ✅ Requisitos previos

* [Docker Desktop]([https://www.docker.com/products/docker-desktop/](https://www.docker.com)) (con **Docker Compose v2**)
* (Opcional) [pnpm](https://pnpm.io/) para desarrollo local del frontend

---

## 🚀 Cómo levantar el proyecto con Docker

1. **Clonar el repositorio**

   ```bash
   git clone https://github.com/Astraeakle/GestionInventarios.git
   cd GestionInventarios
   ```

2. **Levantar la aplicación con Docker**

   ```bash
   docker compose up -d --build
   ```

   🔹 Esto construirá las imágenes, levantará los 3 servicios y restaurará automáticamente el backup de la base de datos (`inventario_backup.sql`).

3. **Acceder a la aplicación**

   * **Frontend (Vue)** → [http://localhost:5173](http://localhost:5173)
   * **Backend API (Laravel)** → [http://localhost:8000](http://localhost:8000)
   * **Base de datos (Postgres)** → `localhost:5432` (usuario: `postgres`, pass: `0000`)

---

## 🛠️ Comandos útiles

* **Ver logs de un servicio**

  ```bash
  docker logs inventario_backend   # Laravel
  docker logs inventario_frontend  # Vue
  docker logs inventario_db        # PostgreSQL
  ```

* **Entrar al contenedor backend (Laravel)**

  ```bash
  docker exec -it inventario_backend bash
  ```

* **Ejecutar migraciones manualmente (si hicieras cambios futuros)**

  ```bash
  php artisan migrate
  ```

* **Reiniciar todo desde cero (incluyendo la BD)**

  ```bash
  docker compose down -v
  docker compose up -d --build
  ```

  ---

## ♨️ Iniciar

* **Frontend**

  ```bash
  cd admin
  pnpm run dev
  ```

* **Backend**

  ```bash
  cd api
  php artisan serve
  ```

