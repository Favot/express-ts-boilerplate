#!/bin/bash


# Check if git is installed
if ! command -v git &> /dev/null
then
    echo "git could not be found, please install it to proceed."
    exit
fi

# Check if jq is installed
if ! command -v jq &> /dev/null
then
    echo "jq could not be found, installing it now."
    
    # Detect the operating system
    OS=$(uname)
    case $OS in
        'Linux')
            sudo apt-get update && sudo apt-get install jq
            ;;
        'Darwin') # macOS
            brew install jq
            ;;
        *)
            echo "Unsupported OS, please install jq manually."
            exit 1
            ;;
    esac
fi


# Ask the user for the new project name
read -p "Enter the name for your new project: " projectName

# Clone the repository into a new directory with the project name
git clone https://github.com/Favot/express-ts-boilerplate.git $projectName

# Change to the newly created project directory
cd $projectName

# Check if package.json exists in the current directory
if [ ! -f package.json ]; then
    echo "Error: package.json not found!"
    exit 1
fi

# Get user input for project details
read -p "Enter the author's name: " authorName

echo "Select the license type for your project: "
PS3="Please enter your choice: "
select licenseType in "MIT" "Apache-2.0" "GPL-3.0" "Cancel"
do
    case $licenseType in
        "MIT"|"Apache-2.0"|"GPL-3.0")
            break
            ;;
        "Cancel")
            echo "Script canceled by user."
            exit 1
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done


# Update package.json with user input
jq --arg name "$projectName" \
   --arg author "$authorName" \
   --arg license "$licenseType" \
   '.name = $name | .author = $author | .license = $license' package.json > temp.json && mv temp.json package.json

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


# Removing the existing git history
rm -rf .git

# Initializing a new git repository
git init

echo "The project $projectName has been created and package.json has been updated!"
