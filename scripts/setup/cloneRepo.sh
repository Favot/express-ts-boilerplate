#!/bin/bash

# Ask the user for the new project name
read -p "Enter the name for your new project: " projectName

# Export projectName for later scripts
export projectName

# Clone the repository into a new directory with the project name
git clone https://github.com/Favot/express-ts-boilerplate.git $projectName

# Change to the newly created project directory
cd $projectName
