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

if [ $1 = 'install' ]; then
    if [ $# -gt 1 ]; then
        ./rpvm_install_new_package.sh "${@:2}"
    else
        ./rpvm_install_all_dependencies.sh
    fi
fi

if [ $1 = 'uninstall' ]; then
    if ! [ $# -gt 1 ]; then
        printf "No package to uninstall given.\nUsage: rvpm uninstall package_name\n"
        exit 4
    fi
    ./rpvm_uninstall_package.sh $2
fi