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
    sudo apt-get update && sudo apt-get install jq
fi

# Ask the user for the new project name
read -p "Enter the name for your new project: " projectName

# Clone the repository into a new directory with the project name
git clone https://github.com/your-username/your-repo.git $projectName

# Change to the newly created project directory
cd $projectName

# Check if package.json exists in the current directory
if [ ! -f package.json ]; then
    echo "Error: package.json not found!"
    exit 1
fi

# Get user input for project details
read -p "Enter the author's name: " authorName
read -p "Enter the license type: " licenseType

# Update package.json with user input
jq --arg name "$projectName" \
   --arg author "$authorName" \
   --arg license "$licenseType" \
   '.name = $name | .author = $author | .license = $license' package.json > temp.json && mv temp.json package.json

# Removing the existing git history
rm -rf .git

# Initializing a new git repository
git init

echo "The project $projectName has been created and package.json has been updated!"
