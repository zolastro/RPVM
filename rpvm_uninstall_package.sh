#!/bin/bash
set -e
OPTIND=1         # Reset in case getopts has been used previously in the shell.

pkg_name=$1

if python3 remove_package_from_dependencies.py $pkg_name; then
    printf "Package $pkg_name removed from dependencies\n"
else
    printf "There was an error parsing r-package.json.\nIs it correctly formatted?\n"
fi
