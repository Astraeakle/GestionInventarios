# ================================
# Stephany.Dockerfile (Frontend Vue)
# Node LTS con pnpm
# ================================
FROM node:lts

WORKDIR /app

# Copiar primero los archivos de dependencias
COPY package.json pnpm-lock.yaml* ./

# Copiar todo el código (incluye src/plugins/iconify/build-icons.js)
COPY . .

# Instalar pnpm global
RUN npm install -g pnpm

# Ahora sí instalar dependencias
RUN pnpm install

# Puerto de Vite
EXPOSE 5173

# Comando por defecto
CMD ["pnpm", "run", "dev", "--host", "0.0.0.0"]

