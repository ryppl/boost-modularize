#!/usr/bin/env python

import os, sys, re, pickle, ConfigParser, shutil, time, subprocess, string
import posixpath, fnmatch
from distutils import dir_util
from argparse import ArgumentParser

# This are global constants. Do not change.
is_win32 = (sys.platform == 'win32')

repo_ro = 'git://github.com/boost-lib/%s.git'
#repo_rw = 'git@github.com:boost-lib/%s.git'

# hardcoded github.com IP address. Temp fix for DNS issues.
repo_rw = 'git@207.97.227.239:boost-lib/%s.git'

# These are controlled by command-line parameters
args = []
verbose = False
#debug = False
#src_repo_dir = None
#dst_repo_dir = None
#dst_module_dir = None
#regenerate_cache = False
#start_at = None
#stop_at = None

def run(*args, **kwargs):
    if verbose: print "[INFO] ", string.join(args, ' ')
    return subprocess.check_call(args, shell=is_win32, **kwargs)

def popen(*args, **kwargs):
    if verbose: print "[INFO] ", string.join(args, ' ')
    return subprocess.Popen(args, stdout=subprocess.PIPE, shell=is_win32,
        **kwargs).communicate()[0]

# Look up the specified file in the src2mod map
# and return the module to which it belongs.
# Throws if it can't find a module which claims
# ownership of this file.
def file2mod(include, src2mod):
    if src2mod.has_key(include):
        return src2mod[include]
    include = os.path.split(include)[0] + '/'
    while not include == '/':
        if src2mod.has_key(include):
            return src2mod[include]
        include = os.path.split(include[:-1])[0] + '/'
    return None

class Manifest(ConfigParser.ConfigParser):

    def __init__(self, sections, start_at, stop_at):
        ConfigParser.ConfigParser.__init__(self)
        self.optionxform = str # preserve case in key names
        self.read('manifest.txt')

        # Sort the section names so we can iterate them in order.
        # We do this so that if anything fails mid-way, the user
        # can specify the --start-at option to pick up where the
        # script last left off.
        if sections is not None:
            for section in sections:
                if section not in self.sections():
                    print >>sys.stderr, '%s is not a section in manifest.txt' % section
                    sys.exit(2)
        else:
            sections = [section for section in self.sections()
                if section != '<ignore>']
        sections.sort()

        # validate start_at and stop_at params
        if start_at is not None and start_at not in sections:
            print >>sys.stderr, start_at, 'is not a valid section'
            sys.exit(2)
        if stop_at is not None and stop_at not in sections:
            print >>sys.stderr, stop_at, 'is not a valid section'
            sys.exit(2)

        # If the user has asked to restart at a given section, skip all until
        # we get to that one.
        if start_at is not None and stop_at is not None:
            self.modules = [section for section in sections
                if section >= start_at and section <= stop_at]
        elif start_at:
            self.modules = [section for section in sections
                if section >= start_at]
        elif stop_at:
            self.modules = [section for section in sections
                if section <= stop_at]
        else:
            self.modules = sections

    # validate the manifest against the live repo. We had
    # better know how to relocate /every/ file before we do anything
    # else. This will abort the program if validation fails.
    def validate(self):
        pass

class Module:

    def __init__(self, section, src_dir, dst_dir):
        print 'Processing module:', section
        sys.stdout.flush()
        self.section = section
        self.src_dir = src_dir
        self.dstroot = dst_dir
        self.dst_dir = os.path.normpath(os.path.join(dst_dir, section))
        self.new_dir = os.path.join('cmakelists', os.path.basename(section))

    # uses git
    def update(self):
        base = os.path.basename(self.dst_dir)
        if os.path.isdir(self.dst_dir):
            if '  master' in popen('git', 'branch', cwd=self.dst_dir):
                run('git', 'checkout', 'master', cwd=self.dst_dir)
            run('git', 'rm', '--quiet', '--ignore-unmatch', '-r', '.', cwd=self.dst_dir)
            run('git', 'remote', 'set-url', 'origin', repo_rw % base, cwd=self.dst_dir)
        else:
            os.makedirs(self.dst_dir)
            run('git', 'init', cwd=self.dst_dir)
            run('git', 'remote', 'add', 'origin', repo_rw % base, cwd=self.dst_dir)
            run('git', 'config', 'branch.master.remote', 'origin', cwd=self.dst_dir)
            run('git', 'config', 'branch.master.merge', 'refs/heads/master', cwd=self.dst_dir)
            run('git', 'submodule', 'add', repo_ro % base, self.section, cwd=self.dstroot)
            run('git', 'status', cwd=self.dstroot)

    # remove everything (leaving behind the top-level .git directory)
    def clean(self):
        if not os.path.exists(self.dst_dir):
            return
        for i in range(10):
            try:
                files = [os.path.normpath(os.path.join(self.dst_dir, f))
                    for f in os.listdir(self.dst_dir) if not f.startswith('.git')]
                for file in files:
                    if os.path.isdir(file):
                        shutil.rmtree(file)
                    else:
                        os.remove(file)
                return
            except:
                print '[WARNING] Retrying to clean directory', self.dst_dir
                time.sleep(.5)
        print '[ERROR] Cannot clean directory', self.dst_dir
        sys.exit(1)

    # Copy over the files that are new to the modularized boost
    def copy_cmake(self):
        if os.path.exists(self.new_dir):
            dir_util.copy_tree(self.new_dir, self.dst_dir)
        else:
            print '[WARNING] "%s" does not exist' % self.new_dir

    def modularize(self, src, dst, src2mod):
        if src[0] == '<':
            return # We'll handle these special keys later
        if dst == '<ignore>':
            return # These are files we're specifically not copying

        src_path = os.path.normpath(os.path.join(self.src_dir, src))
        dst_path = os.path.normpath(os.path.join(self.dst_dir, dst))

        if verbose:
            print '[INFO] About to copy...'
            print '[INFO]     from :', src_path
            print '[INFO]     to   :', dst_path

        # copy the files from src to target
        if os.path.isdir(src_path):
            dir_util.copy_tree(src_path, dst_path)
        else:
            if not os.path.isdir(os.path.dirname(dst_path)):
                if verbose:
                    print '[INFO] Making directory:', os.path.dirname(dst_path)
                os.makedirs(os.path.dirname(dst_path))
            shutil.copy2(src_path, dst_path)

        if verbose:
            print '[INFO] Copied'

    # uses git
    def commit(self):
        if verbose:
            print '[INFO] Committing changes to module at:', self.dst_dir

        # Add all the remaining files
        run('git', 'add', '.', cwd=self.dst_dir)

        # commit locally
        o = popen('git', 'status', '--porcelain', '--untracked-files=no', cwd=self.dst_dir)
        lines = [l for l in o.split('\n') if not l == '']
        if len(lines):
            run('git', 'commit', '-m', 'latest from svn', cwd=self.dst_dir)

# Check the manifest against the live boost mirror to ensure that we
# know where everything goes. Try reading the list of existing boost
# files from a cache so we don't have to enumerate it. Generate the
# cache if necessary.
def validate_manifest(manifest, src_dir):

    if not os.path.isdir(os.path.normpath(os.path.join(src_dir, '.git'))):
        print 'Error: ', src_dir, ' is not a valid git repository'
        sys.exit(2)

    # Read the files in the boost directory and put them in a list
    o = popen('git', 'ls-files', 'boost', cwd=src_dir)
    files = o.split('\n')

    # Read the files in the libs directory and put them in a list
    o = popen('git', 'ls-files', 'libs', cwd=src_dir)
    files.extend(o.split('\n'))

    # Read the files in the tools directory and put them in a list
    o = popen('git', 'ls-files', 'tools', cwd=src_dir)
    files.extend(o.split('\n'))

    existing_files = [f for f in files if f != '']
    existing_files.sort()

    if verbose:
        print '[DEBUG] Existing boost files:'
        print '[DEBUG]     ' + '\n[DEBUG]     '.join(existing_files)
        print '[DEBUG]\n'

    # The list of files found in the manifest
    manifest_files = []

    # For every source file that has a mapping, add it to the
    # manifest_files list
    for section in manifest.sections():
        for item in manifest.items(section):
            # items beginning with '<' are special
            if not item[0][0] == '<':
                manifest_files.append(item[0])
    manifest_files.sort()

    if verbose:
        print '[DEBUG] Modularized boost manifest_files:'
        print '[DEBUG]     ' + '\n[DEBUG]     '.join(manifest_files)
        print '[DEBUG]\n'

    # Make "manifest_files" and "existing_files" essentially a map of paths to counts.
    # Use lists instead of dictionaries to keep ordering intact, and
    # use nested lists instead of tuples so we can modify the count
    # in-place.
    manifest_files = [[f,0] for f in manifest_files]
    existing_files = [[f,0] for f in existing_files]

    mfi = manifest_files.__iter__()
    exi = existing_files.__iter__()

    # Iterate over the manifest and the existing_files files in lock step
    # advancing one or the other or both as necessary and keeping
    # track in the counts which paths appear in both lists and which
    # don't.
    try:
        f = mfi.next()
        e = exi.next()
        while 1:
            # If the paths are the same, (e.g. they're both 'foo/bar.hpp')
            # then inc the count for each and advance both iterators
            if f[0] == e[0]:
                f[1] += 1
                e[1] += 1
                f = mfi.next()
                e = exi.next()
            # If the path as listed in the manifest_files sorts after the
            # current path in the repo, advance the repo's iterator
            # so it catches up.
            elif f[0] > e[0]:
                e = exi.next()
            # If the manifest_files path is a directory and the repo path
            # represents a file in that directory, inc the count for
            # both, but only advance the repo iterator. There may
            # yet be more files in this directory to count.
            elif f[0][-1] == '/' and e[0].startswith(f[0]):
                f[1] += 1
                e[1] += 1
                e = exi.next()
            # Otherwise, the manifest_files path sorts before the repo path
            # and is not a parent directory of the repo path, so advance
            # the manifest_files iterator so it catches up.
            else:
                f = mfi.next()
    except StopIteration:
        pass

    # keep track of the number of errors encountered so far
    errors = 0

    # Display the files that are in the repo that are
    # not accounted for in the manifest_files.
    if verbose:
        print '[INFO] Checking existing files against manifest ...'
    for e in existing_files:
        if 0 == e[1]:
            errors += 1
            print '[ERROR] No destination for existing file:', e[0]

    # Display the files and directories in the manifest_files that
    # have no correspondence with files or directories in the
    # repo.
    if verbose:
        print '[INFO] Checking manifest against existing files ...'
    for f in manifest_files:
        if 0 == f[1]:
            errors += 1
            print '[ERROR] No source found corresponding to:', f[0]

    # If we encountered any errors, bail
    if not errors == 0:
        print '[ERROR] Unaccounded for files. Please fix the manifest and re-run.'
        sys.exit(1)

def setup_metarepo(dst_dir):
    if os.path.exists(dst_dir):
        run('git', 'reset', '--hard', cwd=dst_dir)
        run('git', 'pull', repo_rw % 'boost', 'master', cwd=dst_dir)
    else:
        os.makedirs(dst_dir)
        run('git', 'clone', repo_rw % 'boost', dst_dir)

    run('git', 'submodule', 'foreach', 'git', 'checkout', 'master', '--force', cwd=dst_dir)
    run('git', 'submodule', 'foreach', 'git', 'pull', cwd=dst_dir)
    run('git', 'submodule', 'update', '--init', cwd=dst_dir)


def update_modules(src_dir, dst_dir, manifest):

    # This is a map of header files and directories to target modules.
    src2mod = dict([(src, mod) for mod in manifest.sections() if not mod == '<ignore>'
        for src, dst in manifest.items(mod) if src.startswith('boost/')])

    # validate the manifest against the live repo. We had
    # better know how to relocate /every/ file before we do anything
    # else. This will abort the program if validation fails.
    validate_manifest(manifest, src_dir)

    # Iterate over the sections, which represent submodules. For each
    # submodule, make sure we're on the branch 'master', remove all the
    # files, copy all the files from their source locations into their
    # destinations, add all the files that were copied, unstage the
    # removal of files marked as <new>, apply any patches and commit.
    for section in manifest.modules:
        # Construct with the directory in which this module lives.
        module = Module(section, src_dir, dst_dir)

        # TODO: skip in offline mode
        module.update()

        # Make sure we've really removed everything
        module.clean()

        # Copy over CMakeLists.txt
        module.copy_cmake()

        # Copy over the files from the unmodularized boost
        for src, dst in manifest.items(section):
            module.modularize(src, dst, src2mod)

        # commit locally, TODO: skip in offline mode
        module.commit()

    # clean the superproject
    for entry in popen('git', 'ls-files', cwd=dst_dir).split('\n'):
        if entry and not entry.startswith('.git') and not manifest.has_section(entry):
            run('git', 'rm', '--quiet', entry, cwd=dst_dir)

    # copy directories 'doc', 'more', and 'status'
    for dir in ['doc', 'more', 'status']:
        dir_util.copy_tree(os.path.join(src_dir, dir), os.path.join(dst_dir, dir))

    # copy files from the top level directory
    for file in os.listdir(src_dir):
        file = os.path.join(src_dir, file)
        if os.path.isfile(file):
             shutil.copy(file, dst_dir)

    # copy files from 'libs' and 'tools' that are not modularized
    for entry, ignore in manifest.items('<ignore>'):
        src_path = os.path.join(src_dir, entry)
        dst_path = os.path.join(dst_dir, entry)
        if os.path.isdir(src_path):
            dir_util.copy_tree(src_path, dst_path)
        else:
            if not os.path.isdir(os.path.dirname(dst_path)):
                if verbose:
                    print '[INFO] Making directory:', os.path.dirname(dst_path)
                os.makedirs(os.path.dirname(dst_path))
            shutil.copy2(src_path, dst_path)

    # HACK: Insert forward_headers.cmake at Beman's request
    open(os.path.join(dst_dir, 'forward_headers.cmake'), 'w').write(
        open(os.path.join(os.path.dirname(__file__), 'forward_headers.cmake')).read())

    # Add all the remaining files
    run('git', 'add', '.', cwd=dst_dir)

def push_modules(dst_dir):
    # Is there something to push?
    if "" == popen('git', 'status', '-s', cwd=dst_dir):
        return

    # We now want to 'git add' all the modified submodules to the supermodule,
    # commit them and push the new boost supermodule.
    print 'Pushing all modified submodues...'

    # Push the changes in each submodule to the remote repo
    run('git', 'submodule', 'foreach', 'git', 'push', 'origin', 'master',
        cwd=dst_dir)

    print 'Committing the boost supermodule...'
    run('git', 'commit', '-am' 'latest from svn', cwd=dst_dir)

    print 'Pushing the boost supermodule...'
    run('git', 'push', repo_rw % 'boost', 'master', cwd=dst_dir)

if __name__ == "__main__":
    parser = ArgumentParser(description='Modularize Boost.')
    parser.add_argument('-v', '--verbose', action='store_true',
        help='verbose output')
    parser.add_argument('--src', metavar='DIR', required=True,
        help='local path to the unmodularized boost')
    parser.add_argument('--dst', metavar='DIR', required=True,
        help='local path to the modularized boost')
    parser.add_argument('--start-at', metavar='SECTION',
        help='section in the manifest at which to start the copy')
    parser.add_argument('--stop-at',  metavar='SECTION',
        help='section in the manifest at which to stop the copy')
    parser.add_argument('--sections',
        help='comma-separated list of section in the manifest to copy')
    parser.add_argument('command', nargs='*', default=['update'])

    args = parser.parse_args()
    verbose = args.verbose

    if 'cleansetup' in args.command:
        shutil.rmtree(args.dst)
        setup_metarepo(args.dst)

    if 'setup' in args.command:
        setup_metarepo(args.dst)

    if 'update' in args.command:
        manifest = Manifest(
            args.sections and args.sections.split(','), args.start_at, args.stop_at)
        manifest.validate()
        update_modules(args.src, args.dst, manifest)

    if 'push' in args.command:
        push_modules(args.dst)

    print 'Done'
