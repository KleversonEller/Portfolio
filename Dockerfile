# Use uma imagem base com Node.js
FROM node:18-alpine

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o arquivo package.json e o arquivo package-lock.json (ou pnpm-lock.yaml)
COPY package.json pnpm-lock.yaml* ./ 

# Cria um vinculo com o container
VOLUME /app

# Instale as dependências com o PNPM
RUN npm install -g pnpm && pnpm config set store-dir /root/.local/share/pnpm/store/v3 --global && pnpm install

# Copie o restante dos arquivos do seu projeto
COPY . .

# Compile o código do React com o Vite
RUN pnpm run build

# Exponha a porta em que a aplicação estará rodando
EXPOSE 5173

# Comando para iniciar o servidor
CMD [ "pnpm", "run", "dev" ]
