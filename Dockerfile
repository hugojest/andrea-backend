FROM node:18-alpine

# 1. Instalamos herramientas de compilación para que SQLite se pueda armar
RUN apk add --no-cache python3 make g++ gcc docker-cli

WORKDIR /app

COPY package*.json ./

# 2. CRÍTICO: Quitamos el --ignore-scripts para que se compile el binario
RUN npm install --omit=dev

COPY . .

EXPOSE 80

# 3. Comando de inicio
CMD ["node", "backend.js", "server"]
