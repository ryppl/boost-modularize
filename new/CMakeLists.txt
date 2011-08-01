##########################################################################
# Copyright (C) 2007-2009 Douglas Gregor <doug.gregor@gmail.com>         #
# Copyright (C) 2007-2009 Troy Straszheim <troy@resophonic.com>          #
# Copyright (C) 2010-2011 Daniel Pfeifer <daniel@pfeifer-mail.de>        #
#                                                                        #
# Distributed under the Boost Software License, Version 1.0.             #
# See accompanying file LICENSE_1_0.txt or copy at                       #
#   http://www.boost.org/LICENSE_1_0.txt                                 #
##########################################################################

cmake_minimum_required(VERSION 2.8.4 FATAL_ERROR)
project(Boost)

##########################################################################
# Config Information                                                     #
##########################################################################

configure_file(boost-config.cmake.in boost-config.cmake @ONLY)
configure_file(boost-config-version.cmake.in boost-config-version.cmake COPYONLY)

set(Boost_DIR "${Boost_BINARY_DIR}")
find_package(Boost NO_MODULE)
include("${Boost_USE_FILE}")
include(BoostProject)

option(BOOST_DEBIAN_PACKAGES "Create debian packages" OFF)

##########################################################################
# Building and Testing                                                   #
##########################################################################

# per default, build documentation in release build only
if(DEFINED CMAKE_BUILD_TYPE AND NOT CMAKE_BUILD_TYPE STREQUAL "Release")
  set(BOOST_ENABLED_DOCS "NONE" CACHE
    STRING "valid values are ALL, NONE, or a ; separated list of components"
    )
else()
  set(BOOST_ENABLED_DOCS "ALL" CACHE
    STRING "valid values are ALL, NONE, or a ; separated list of components"
    )
endif()

set(BOOST_ENABLED_TESTS "ALL" CACHE
  STRING "valid values are ALL, NONE, or a ; separated list of components"
  )
set(BOOST_ENABLED_EXAMPLES "NONE" CACHE
  STRING "valid values are ALL, NONE, or a ; separated list of components"
  )


# As long as CTest does not support incremental testing, we disable the
# builtin test target and create our own. This target should be "built"
# with the "keep going" option, eg: 'make test -k'.
add_custom_target(test)
#enable_testing()

# make visual studio look nice
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Put the libaries and binaries that get built into directories at the
# top of the build tree rather than in hard-to-find leaf
# directories. This simplifies manual testing and the use of the build
# tree rather than installed Boost libraries.
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)

##########################################################################
# Components                                                             #
##########################################################################

set(BOOST_PROJECTS_ALL)

set(BOOST_SUBDIRECTORIES
  @BOOST_SUBDIRECTORIES@
  )

foreach(dir ${BOOST_SUBDIRECTORIES})
  boost_precache(${dir})
endforeach(dir)

foreach(dir ${BOOST_SUBDIRECTORIES})
  add_subdirectory(${dir})
endforeach(dir)

##########################################################################
# Package Information                                                    #
##########################################################################

set(CPACK_PACKAGE_NAME "Boost")
set(CPACK_PACKAGE_VENDOR "http://www.boost.org")
set(CPACK_PACKAGE_CONTACT "Daniel Pfeifer <daniel@pfeifer-mail.de>")
set(CPACK_PACKAGE_VERSION "${Boost_VERSION}")
set(CPACK_PACKAGE_FILE_NAME "Boost-${Boost_VERSION}-${CMAKE_SYSTEM_NAME}-${BOOST_TOOLSET}")
set(CPACK_SOURCE_IGNORE_FILES "${Boost_BINARY_DIR}/;/\\\\.git")

include(BoostCPack)
