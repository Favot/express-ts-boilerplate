## Express TypeScript Boilerplate with Prisma and Docker

This project setup offers a development environment for a Node.js Express application written in TypeScript, backed by a PostgreSQL database managed by Prisma, and containerized using Docker.

### Prerequisites:

- Docker and Docker Compose
- Node.js and npm

### Project Structure:

```
.
├── prisma                 # Contains Prisma schema and migrations
├── src                    # Application source code
│   ├── controllers        # Controller logic
│   └── ...                # Other directories and files
├── .env                   # Environment variables
├── docker-compose.yml     # Docker Compose configuration file
└── Dockerfile             # Dockerfile for building the app image
```

### Getting Started:

1. Clone the repository:

   ```
   git clone [repository-url] && cd [repository-directory]
   ```

2. Install project dependencies:

   ```
   npm install
   ```

3. Setup your database configuration by updating the `.env` file:

   ```dotenv
   DATABASE_URL="postgresql://[user]:[password]@[db-container-name]:5432/[db-name]?schema=public"
   ```

4. Build and start the Docker containers:

   ```
   docker-compose up --build
   ```

   This will start both the Node.js Express application and a PostgreSQL database.

5. Access the application:
   Open your browser and navigate to `http://localhost:3000`.

### Development:

#### Hot Reloading:

Thanks to `nodemon`, any changes made in the `src` directory will trigger a server restart in the Docker container. This allows for a smooth development experience without having to rebuild the Docker image after every change.

To start the development server with hot reloading, execute:

```
npm run docker:dev
```

#### Seeding the Database:

You can seed the database (e.g., populate it with initial data) by executing:

```
npm run seed
```

### Troubleshooting:

- If you encounter database connection issues, ensure that the `DATABASE_URL` in your `.env` file points to the correct container name and port, typically `5432` for PostgreSQL.
- Make sure you have adequate permissions for the database user and the database exists.
- Ensure that both the application and database containers are running and networked correctly.
