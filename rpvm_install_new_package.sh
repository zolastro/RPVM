#!/bin/bash
set -e
OPTIND=1         # Reset in case getopts has been used previously in the shell.

pkg_name=$1
pkg_version=""
pkg_repos=""

while getopts ":v:r:" opt; do
    case "$opt" in
    \?)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    v)  pkg_version=$OPTARG
        ;;
    r)  pkg_repos=$OPTARG
        ;;
    esac
done


if python3 add_package_to_dependencies.py $pkg_name $pkg_version $pkg_repos; then
    printf "Script created! Running script...\n"
else
    printf "There was an error parsing r-package.json.\nIs it correctly formatted?\n"
fi
