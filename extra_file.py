import os, sys, getopt, re, ConfigParser, posixpath, fnmatch, string

# This are global constants. Do not change.
boost_project = re.compile(r'\nboost_project\(.*?\)\n', re.S)

# Parse the manifest
manifest = ConfigParser.ConfigParser()
manifest.optionxform = str # preserve case in key names
manifest.read('manifest.txt')

# This is a map from module names to modules on which this module
# directly depends.
moddeps = dict([(k,set()) for k in manifest.sections() if not k == '<ignore>'])

modules = moddeps.keys()
modules.sort()

# Iterate over the source files and find the files on which they depend
#for mod, deps in moddeps.items():
for mod in modules:

    if mod == 'libs/locale':
        continue
    if mod == 'tools/build':
        continue
    if mod == 'tools/litre':
        continue

    print 'Processing module', mod, '...'
    list_file = 'new/' + mod + '/CMakeLists.txt'

    content = open(list_file).read()
    m = boost_project.search(content)
    s = m.string[m.start():m.end()]

    open('new/' + mod + '/boost_module.cmake', 'w').write(
        '# Distributed under the Boost Software License, Version 1.0.\n' +
        '# See http://www.boost.org/LICENSE_1_0.txt\n' + s
        )

    open(list_file, 'w').write(content[:m.start()] + content[m.end():])

