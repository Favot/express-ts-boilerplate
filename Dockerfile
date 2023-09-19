FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

# Install Prisma CLI globally
RUN npm install -g prisma

# Copy Prisma schema
COPY prisma ./prisma

# Generate Prisma client
RUN npx prisma generate

COPY tsconfig.json ./
COPY src ./src

RUN npx tsc

EXPOSE 3000

CMD [ "node", "dist/index.js" ]
