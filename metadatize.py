import os, sys, getopt, re, ConfigParser, posixpath, fnmatch, string

# This are global constants. Do not change.
existing_cache_pkl = 'existing.cache'
is_win32 = (sys.platform == 'win32')
include_directive = re.compile(r'^\s*#\s*include\s+["<](boost[/\\][^">]*)[">]')
find_boost = re.compile(r'find_package\(Boost\s+[^)]*\)')

# These are controlled by command-line parameters
src_repo_dir = None
dst_repo_dir = None

# Print the usage message (there's probably a nifty python way to do this)
def usage():
    print '''Usage: metadatize.py [-h] [--src=<dir>] [--dst=<dir>]
    -h              : help
    --src           : local path to the git repository storing the unmodularized boost
    --dst           : local path to the git repository storing the modularized boost'''

def parse_command_line():
    # Parse the command line arguments
    try:
        opts, args = getopt.getopt(sys.argv[1:], "h", ["help", "src=", "dst="])
    except getopt.GetoptError, err:
        print 'Error:', str(err)
        usage()
        sys.exit(2)

    global src_repo_dir, dst_repo_dir
    for o, a in opts:
        if o in ("-h", "--help"):
            usage()
            sys.exit()
        elif o == "--src":
            src_repo_dir = os.path.abspath(a)
        elif o == "--dst":
            dst_repo_dir = os.path.abspath(a)
        else:
            assert False, "unhandled option"
    
    if src_repo_dir is None or dst_repo_dir is None:
        print 'You must specify both the source and destination directories'
        usage()
        sys.exit(2)

class ModuleNotFound:
    pass

# Look up the specified file in the src2mod map
# and return the module to which it belongs.
# Throws if it can't find a module which claims
# ownership of this file.
def file2mod(include, src2mod):
    if include == 'boost/version.hpp':
        return 'libs/core'
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
    # Parse the command line arguments
    parse_command_line()

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
        print 'Processing module', mod, '...'
        for src, dst in manifest.items(mod):
            if src[-1] == '/': # directory
                src = os.path.normpath(src)
                for root, dirs, files in os.walk(os.path.join(src_repo_dir, src)):
                    for f in files:
                        # Only look in cpp, hpp or ipp files
                        if fnmatch.fnmatch(f, '*.?pp'):
                            f = os.path.normpath(os.path.join(root, f))
                            visit_file(f, mod, src2mod, moddeps)
            elif fnmatch.fnmatch(src, '*.?pp'):
                f = os.path.normpath(os.path.join(src_repo_dir, src))
                visit_file(f, mod, src2mod, moddeps)

    # Now, moddeps contains a mapping from each module to the modules
    # on which it depends. Use it to generate ryppl metadata files for
    # each module.
    for mod, deps in moddeps.items():
        find_package = 'find_package(Boost NO_MODULE)'
        if len(deps) > 5:
            find_package = 'find_package(Boost\n  COMPONENTS\n'
            for dep in sorted(deps):
                find_package += '    ' + os.path.split(dep)[1] + '\n'
            find_package += '  NO_MODULE\n  )'
        elif len(deps) > 0:
            find_package = 'find_package(Boost COMPONENTS '
            for dep in sorted(deps):
                find_package += os.path.split(dep)[1] + ' '
            find_package += 'NO_MODULE)'

        list_file = 'new/' + mod + '/CMakeLists.txt'
        content = open(list_file).read()
        open(list_file, 'w').write(find_boost.sub(find_package, content))

if __name__ == "__main__":
    main()
