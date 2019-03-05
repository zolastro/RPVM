#!/bin/bash
set -e

if ! python3 --version >> /dev/null; then
    printf "Python 3 not found.\nPlease, install it and run the command again.\n"
    exit 1
fi

if [ ! -f *.Rproj ]; then
    printf "No R project file found.\nPlease, run again in an R project.\n"
    exit 2
fi
if [ ! -f r-packages.json ]; then
    printf "No r-packages.json file found.\nPlease, add an r-package.json file with your dependencies before running rpvm.\n"
    exit 3
fi

#Create a file to store version
if [ ! -d packages ]; then
    mkdir packages
fi

if [ ! -f .Rprofile ]; then
    touch .Rprofile
fi

sed -i".bak" '/libPaths/d'  .Rprofile
printf ".libPaths('./packages/')" >> .Rprofile 

printf "Creating R script...\n"

if python3 parser.py; then
    printf "Script created! Running script...\n"
else
    printf "There was an error parsing r-package.json.\nIs it correctly formatted?\n"
fi

if Rscript install_dependencies.R; then
    printf "Script executed succesfully!\n"
else
    printf "There was an error installing the dependencies. Please, check the console output\n"
    exit 5
fi
