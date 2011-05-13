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

set(BOOST_CONFIG_VERSION "1.46.1")

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

##########################################################################
# Building and Testing                                                   #
##########################################################################

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


set(BOOST_PROJECTS_ALL)

##########################################################################
@BOOST_MODULE_ADD_SUBDIRECTORIES@
##########################################################################

list(SORT BOOST_PROJECTS_ALL)
list(REMOVE_DUPLICATES BOOST_PROJECTS_ALL)

# function to set CPACK_COMPONENT_*
function(set_cpack_component name)
  string(TOUPPER "CPACK_COMPONENT_${name}" variable)
  set(${variable} ${ARGN} PARENT_SCOPE)
endfunction(set_cpack_component)

set(CPACK_COMPONENTS_ALL)

foreach(project ${BOOST_PROJECTS_ALL})
  set(is_tool     ${BOOST_PROJECT_${project}_TOOL})
  set(header_only ${BOOST_PROJECT_${project}_HEADER_ONLY})
  set(name        "${BOOST_PROJECT_${project}_NAME}")
  set(description "${BOOST_PROJECT_${project}_DESCRIPTION}")
  set(group       "boost_${project}")

  if(NOT is_tool)
    set(name "${name} Library")
  endif()

  set_cpack_component(GROUP_${group}_DISPLAY_NAME "${name}")
  set_cpack_component(GROUP_${group}_DESCRIPTION "${description}")

  set_cpack_component(${project}_DEVELOP_GROUP "${group}")
  set_cpack_component(${project}_RUNTIME_GROUP "${group}")
  set_cpack_component(${project}_MANUAL_GROUP  "${group}")
  set_cpack_component(${project}_DEBUG_GROUP   "${group}")

  set_cpack_component(${project}_DEVELOP_DISPLAY_NAME "${name} development files")
  set_cpack_component(${project}_RUNTIME_DISPLAY_NAME "${name}")
  set_cpack_component(${project}_MANUAL_DISPLAY_NAME  "${name} documentation")
  set_cpack_component(${project}_DEBUG_DISPLAY_NAME   "${name} debug symbols")

  set_cpack_component(${project}_DEVELOP_DESCRIPTION "${description}")
  set_cpack_component(${project}_RUNTIME_DESCRIPTION "${description}")
  set_cpack_component(${project}_MANUAL_DESCRIPTION  "${description}")
  set_cpack_component(${project}_DEBUG_DESCRIPTION   "${description}")

  # Debian
  string(REPLACE "_" "-" debian_name "${project}")
  if(is_tool)
    set(prefix "boost-")
  else()
    set(prefix "libboost-")
  endif()

  set_cpack_component(${project}_DEVELOP_DEB_PACKAGE "${prefix}${debian_name}-dev")
  set_cpack_component(${project}_RUNTIME_DEB_PACKAGE "${prefix}${debian_name}")
  set_cpack_component(${project}_MANUAL_DEB_PACKAGE  "${prefix}${debian_name}-doc")
  set_cpack_component(${project}_DEBUG_DEB_PACKAGE   "${prefix}${debian_name}-dbg")

  cmake_parse_arguments(DEB "" "" "DEV;LIB" ${BOOST_PROJECT_${project}_DEB_DEPENDS})
  list(APPEND CPACK_DEBIAN_BUILD_DEPENDS ${DEB_DEV} ${DEB_UNPARSED_ARGUMENTS})

  set_cpack_component(${project}_DEVELOP_DEBIAN_DEPENDS ${DEB_DEV})
  set_cpack_component(${project}_RUNTIME_DEBIAN_DEPENDS ${DEB_LIB} ${DEB_UNPARSED_ARGUMENTS})

  if(header_only)
    set_cpack_component(${project}_DEVELOP_BINARY_INDEP 1)
  endif(header_only)
  set_cpack_component(${project}_MANUAL_BINARY_INDEP 1)

  # dependencies
  set(develop_depends)
  set(runtime_depends)
  set(debug_depends)

  if(NOT header_only)
    list(APPEND develop_depends ${project}_runtime)
  endif(NOT header_only)

  foreach(dependancy ${BOOST_PROJECT_${project}_DEPENDS})
    if(NOT is_tool AND NOT BOOST_PROJECT_${dependancy}_TOOL)
      list(APPEND develop_depends ${dependancy}_develop)
    endif(NOT is_tool AND NOT BOOST_PROJECT_${dependancy}_TOOL)
    if(NOT header_only AND NOT BOOST_PROJECT_${dependancy}_HEADER_ONLY)
      list(APPEND runtime_depends ${dependancy}_runtime)
      list(APPEND debug_depends ${dependancy}_debug)
    endif(NOT header_only AND NOT BOOST_PROJECT_${dependancy}_HEADER_ONLY)
  endforeach(dependancy)

  set_cpack_component(${project}_DEVELOP_DEPENDS "${develop_depends}")
  set_cpack_component(${project}_RUNTIME_DEPENDS "${runtime_depends}")
  set_cpack_component(${project}_DEBUG_DEPENDS "${debug_depends}")

  if(is_tool)
    list(APPEND CPACK_COMPONENTS_ALL ${project}_runtime)
  else(is_tool)
    list(APPEND CPACK_COMPONENTS_ALL ${project}_develop)
  endif(is_tool)

  if(NOT header_only AND NOT is_tool)
    list(APPEND CPACK_COMPONENTS_ALL
      ${project}_runtime
      ${project}_debug
      )
  endif(NOT header_only AND NOT is_tool)

  list(APPEND CPACK_COMPONENTS_ALL ${project}_manual)
endforeach(project)

list(SORT CPACK_COMPONENTS_ALL)
list(REMOVE_DUPLICATES CPACK_COMPONENTS_ALL)

include("${Boost_SOURCE_DIR}/BoostCPack.cmake")
include(CPack)
