#!/bin/bash

# Get user input for PostgreSQL details
read -p "Enter the PostgreSQL database name: " postgresDb
read -p "Enter the PostgreSQL user name: " postgresUser
read -sp "Enter the PostgreSQL password: " postgresPassword
echo ""

# Update docker-compose.yml with user input
sed -i.bak "s/PG_DB=node_live_db/PG_DB=$postgresDb/" docker-compose.yml
sed -i.bak "s/POSTGRES_DB=node_live_db/POSTGRES_DB=$postgresDb/" docker-compose.yml
sed -i.bak "s/PG_USER=favot/PG_USER=$postgresUser/" docker-compose.yml
sed -i.bak "s/POSTGRES_USER=favot/POSTGRES_USER=$postgresUser/" docker-compose.yml
sed -i.bak "s/PG_PASSWORD=12345/PG_PASSWORD=$postgresPassword/" docker-compose.yml
sed -i.bak "s/POSTGRES_PASSWORD=12345/POSTGRES_PASSWORD=$postgresPassword/" docker-compose.yml
rm docker-compose.yml.bak
