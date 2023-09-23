#!/bin/bash

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
