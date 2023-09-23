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
