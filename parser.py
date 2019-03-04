import json
import os

with open('r-packages.json') as r_packages:
    data = json.load(r_packages)

packages = data['packages']

print('require(devtools)', file=open('install_dependencies.R', 'w+'))
print('require(withr)', file=open('install_dependencies.R', 'a'))
for package in packages:
    print('with_libpaths("' + os.getcwd() + '/packages", ', end="", file=open('install_dependencies.R', 'a'))
    print('install_version("' + package['name'] + '"', end="", file=open('install_dependencies.R', 'a'))
    if 'version' in package:
        print(', version="' + package['version'] + '"', end="", file=open('install_dependencies.R', 'a'))
    if 'repos' in package:
        print(', repos="' + package['repos'] + '"', end="", file=open('install_dependencies.R', 'a'))
    print(')', end="", file=open('install_dependencies.R', 'a'))
    print(')', file=open('install_dependencies.R', 'a'))
        
