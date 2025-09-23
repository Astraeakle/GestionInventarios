# Proyecto Inventario

Este repositorio contiene un proyecto completo con:

- Backend en Laravel (PHP 8.2)
- Base de datos PostgreSQL 16
- Frontend en Vue 3 + Vite + pnpm

El proyecto está dockerizado para facilitar la instalación y ejecución.

---

## Estructura del proyecto

- `/api` - Código fuente backend Laravel
- `/admin` - Código fuente frontend Vue
- `docker-compose.yml` - Configuración de Docker Compose
- `inventario_backup.sql` - Backup para cargar la base de datos inicial

---

## Requisitos previos

- Tener instalado Docker y Docker Compose (v2+)
- Tener instalado pnpm (opcional para desarrollo local frontend)

---

## Cómo levantar el proyecto con Docker

1. Clona este repositorio:

   ```bash
   git clone https://github.com/tu_usuario/tu_repositorio.git
   cd tu_repositorio

2. Levantar docker:
   
   ```bash
   docker compose up -d --build

4. Importar BD:
   
   ```bash
   docker exec -i inventario_db psql -U postgres -d inventario < inventario_backup.sql
