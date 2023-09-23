#!/bin/bash

# Navigate to the scripts setup directory
cd scripts/setup

# Execute each script in sequence
bash checkDependencies.sh
source cloneRepo.sh
bash updatePackageJson.sh
source updateDockerCompose.sh
bash createEnvFile.sh
bash initGit.sh

# Navigate to the newly created project directory
cd ../..
cd $projectName

echo "Setup completed successfully! Now you are in the $projectName directory."
