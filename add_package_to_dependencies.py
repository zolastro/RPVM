import json
import sys


jsonFile = open('r-packages.json', 'r') # Open the JSON file for reading
data = json.load(jsonFile) # Read the JSON into the buffer
jsonFile.close() # Close the JSON file

packages = data['packages']

pkg_name = sys.argv[1]
pkg_version = None
pkg_repos = None
if len(sys.argv) > 2:
    pkg_version = sys.argv[2]
if len(sys.argv) > 3:
    pkg_repos = sys.argv[3]


pkg_to_install = {}

if pkg_name is not None:
    pkg_to_install['name'] = pkg_name
if pkg_version is not None:
    pkg_to_install['version'] = pkg_version
if pkg_repos is not None:
    pkg_to_install['repos'] = pkg_repos

found = False;
for package in packages:
    if (package['name'] == pkg_name):
        package = pkg_to_install
        found = true
        break;

if not found:
    packages.append(pkg_to_install)

# Save JSON file
jsonFile = open('r-packages.json', 'w+')
jsonFile.write(json.dumps(data, indent=4))
jsonFile.close()