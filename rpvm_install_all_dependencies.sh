#!/bin/bash
set -e
#Create a file to store version
if [ ! -d packages ]; then
    mkdir packages
fi

printf "Creating R script...\n"

if python3 parser.py; then
    printf "Script created! Running script...\n"
else
    printf "There was an error parsing r-package.json.\nIs it correctly formatted?\n"
fi

sed -i".bak" '/libPaths/d'  .Rprofile

if Rscript install_dependencies.R; then
    printf "Script executed succesfully!\n"
else
    printf "There was an error installing the dependencies. Please, check the console output\n"
    exit 5
fi

if [ ! -f .Rprofile ]; then
    touch .Rprofile
fi

echo ".libPaths('./packages/')" >> .Rprofile 
