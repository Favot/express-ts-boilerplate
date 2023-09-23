#!/bin/bash

# Construct the DATABASE_URL and write to .env file
echo "DATABASE_URL=\"postgresql://${postgresUser}:${postgresPassword}@node_express_db:5432/${postgresDb}?schema=public\"" > .env

# Inform the user that the .env file has been created
echo ".env file has been created with the provided database credentials."
