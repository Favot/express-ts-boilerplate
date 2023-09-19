FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

# Install Prisma CLI globally
RUN npm install -g prisma

# Install nodemon for development
RUN npm install -g nodemon

# Copy Prisma schema
COPY prisma ./prisma

# Generate Prisma client
RUN npx prisma generate

COPY . .

EXPOSE 3000

CMD [ "npm", "run", "docker:dev" ]
