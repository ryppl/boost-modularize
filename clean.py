#!/usr/bin/env python

import os, re, ConfigParser

find_boost = re.compile(r'find_package\(Boost\s+[^)]*\)')
find_package = 'find_package(Boost NO_MODULE)'

# Parse the manifest
manifest = ConfigParser.ConfigParser()
manifest.optionxform = str # preserve case in key names
manifest.read('manifest.txt')

for mod in manifest.sections():
    if mod == '<ignore>':
        continue

    list_file = os.path.join('new', mod, 'CMakeLists.txt')
    content = open(list_file).read()
    open(list_file, 'w').write(find_boost.sub(find_package, content))
