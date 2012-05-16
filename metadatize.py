import os, sys, getopt, re, ConfigParser, posixpath, fnmatch, string

include_directive = re.compile(r'^\s*#\s*include\s+["<](boost[/\\][^">]*)[">]')

class ModuleNotFound:
    pass

# create CamelCase project name
def project_name(module):
    if module == 'libs/mpl':
        return 'BoostMPL'
    l = os.path.basename(module)
    return "Boost" + "".join(
        ["" if c == "_" else c.upper() if prev == "_" else c
            for prev, c in zip("_" + l, l)])

# Look up the specified file in the src2mod map
# and return the module to which it belongs.
# Throws if it can't find a module which claims
# ownership of this file.
def file2mod(include, src2mod):
    if include == 'boost/version.hpp': # This file does not exist.
        return 'libs/core'             # It is generated by Boost.Core.
    orig = include
    if src2mod.has_key(include):
        return src2mod[include]
    include = os.path.split(include)[0] + '/'
    while not include == '/':
        if src2mod.has_key(include):
            return src2mod[include]
        include = os.path.split(include[:-1])[0] + '/'
    raise ModuleNotFound()

# For the specified file, read looking for #include <boost/...> statements,
# infer the module to which boost/... belongs and add that module as a
# dependency in moddeps
def visit_file(file, mod, src2mod, moddeps):
    if '.svn' in file:
        return
    deps = moddeps[mod]
    with open(file) as xpp:
        for line in xpp:
            match = include_directive.match(line)
            if match is None:
                continue
            include = posixpath.normpath(match.group(1))
            try:
                incmod = file2mod(include, src2mod)
                if not incmod == mod:
                    deps.add(incmod)
            except:
                print >>sys.stderr, '[ERROR] Cannot file module for :', include, 'found in', file

def main():
    # Parse the manifest
    manifest = ConfigParser.ConfigParser()
    manifest.optionxform = str # preserve case in key names
    manifest.read('manifest.txt')

    # First, build a map of source header files and directories to target module
    src2mod = dict([(src, mod) for mod in manifest.sections() if not mod == '<ignore>'
        for src, dst in manifest.items(mod) if src.startswith('boost/')])

    # This is a map from module names to modules on which this module
    # directly depends.
    moddeps = dict([(k,set()) for k in manifest.sections() if not k == '<ignore>'])

    modules = moddeps.keys()
    modules.sort()

    # Iterate over the source files and find the files on which they depend
    #for mod, deps in moddeps.items():
    for mod in modules:
        for src, dst in manifest.items(mod):
            if not src.startswith('boost'):
                continue
            if src[-1] == '/': # directory
                src = os.path.normpath(src)
                for root, dirs, files in os.walk(src):
                    for f in files:
                        f = os.path.normpath(os.path.join(root, f))
                        visit_file(f, mod, src2mod, moddeps)
            else:
                visit_file(src, mod, src2mod, moddeps)

    # Now, moddeps contains a mapping from each module to the modules
    # on which it depends. Use it to generate ryppl metadata files for
    # each module.
    for mod, deps in sorted(moddeps.items()):
        print os.path.basename(mod)
        for dep in sorted(deps):
            print '   ', project_name(dep)

if __name__ == "__main__":
    main()
