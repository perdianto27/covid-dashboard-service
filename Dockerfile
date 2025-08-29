FROM node:16.16.0

# Set workdir
WORKDIR /app

# Salin dan install dependencies
COPY package*.json ./
RUN npm install

# Salin seluruh project (termasuk .env jika tidak pakai env_file)
COPY . .

# Jalankan di port 9000
EXPOSE 9000

# Start aplikasi
CMD ["npm", "run", "dev"]