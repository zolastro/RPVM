import json
import sys


jsonFile = open('r-packages.json', 'r') # Open the JSON file for reading
data = json.load(jsonFile) # Read the JSON into the buffer
jsonFile.close() # Close the JSON file

packages = data['packages']

pkg_name = sys.argv[1]

data['packages'] = list(filter(lambda package : package['name'] != pkg_name, packages))
# Save JSON file
jsonFile = open('r-packages.json', 'w+')
jsonFile.write(json.dumps(data, indent=4))
jsonFile.close()