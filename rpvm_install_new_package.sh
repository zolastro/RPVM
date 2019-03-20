#!/bin/bash
set -e
OPTIND=1         # Reset in case getopts has been used previously in the shell.

pkg_name=""
pkg_version=""
pkg_repos=""

while getopts ":n:v:r:" opt; do
    case "$opt" in
    n)
        pkg_name=$OPTARG
	echo "Package $pkg_name"
	;;
    v)  pkg_version=$OPTARG
	echo "Version: $pkg_version"
        ;;
    r)  pkg_repos=$OPTARG
        echo "Repos: $pkg_repos"
	;;
    *)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    esac
done

if [ -z $pkg_name ]; then
    echo "No package name provided"
    exit -1
fi

echo "Adding library $pkg_name"
if python3 add_package_to_dependencies.py $pkg_name $pkg_version $pkg_repos; then
    printf "Script created! Running script...\n"
else
    printf "There was an error parsing r-package.json.\nIs it correctly formatted?\n"
fi
