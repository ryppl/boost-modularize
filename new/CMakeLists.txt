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

set(BOOST_CONFIG_VERSION "1.47")

file(WRITE "${PROJECT_BINARY_DIR}/boost-config-version.cmake"
  "set(PACKAGE_VERSION \"${BOOST_CONFIG_VERSION}\")\n"
  "set(PACKAGE_VERSION_EXACT TRUE)\n"
  )

file(WRITE "${Boost_BINARY_DIR}/boost-config.cmake"
  "set(Boost_FOUND TRUE)\n"
  "set(Boost_INCLUDE_DIRS \"${Boost_BINARY_DIR}/include\")\n"
  "set(Boost_LIBRARY_DIRS \"${Boost_BINARY_DIR}/lib\")\n"
  "set(Boost_RESOURCE_PATH \"${Boost_SOURCE_DIR}/tools/cmake/resources\")\n"
  "set(BOOSTBOOK_CATALOG \"${Boost_BINARY_DIR}/tools/boostbook/catalog.xml\")\n"
  "set(BOOSTBOOK_XSL_DIR \"${Boost_SOURCE_DIR}/tools/boostbook/xsl\")\n"
  "set(Boost_USE_FILE \"${Boost_SOURCE_DIR}/tools/cmake/modules/UseBoost.cmake\")\n"
  "set(Boost_DEV_FILE \"${Boost_SOURCE_DIR}/tools/cmake/modules/UseBoostDev.cmake\")\n"
  )

set(Boost_DIR "${Boost_BINARY_DIR}")
find_package(Boost NO_MODULE)
include("${Boost_DEV_FILE}")

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
@BOOST_MODULE_ADD_SUBDIRECTORIES@
add_subdirectory(tools/cmake)

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
