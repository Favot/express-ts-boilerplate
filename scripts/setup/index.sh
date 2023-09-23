#!/bin/bash

# Navigate to the scripts setup directory
cd scripts/setup

# Execute each script in sequence
bash checkDependencies.sh
bash cloneRepo.sh
bash updatePackageJson.sh
bash updateDockerCompose.sh
bash createEnvFile.sh
bash initGit.sh

echo "Setup completed successfully!"
