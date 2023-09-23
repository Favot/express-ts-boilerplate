#!/bin/bash

# Removing the existing git history
rm -rf .git

# Initializing a new git repository
git init

echo "The project $projectName has been created and package.json has been updated!"
