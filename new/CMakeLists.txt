##########################################################################
# Copyright (C) 2007-2009 Douglas Gregor <doug.gregor@gmail.com>         #
# Copyright (C) 2007-2009 Troy Straszheim <troy@resophonic.com>          #
# Copyright (C) 2010-2011 Daniel Pfeifer <daniel@pfeifer-mail.de>        #
#                                                                        #
# Distributed under the Boost Software License, Version 1.0.             #
# See accompanying file LICENSE_1_0.txt or copy at                       #
#   http://www.boost.org/LICENSE_1_0.txt                                 #
##########################################################################

cmake_minimum_required(VERSION 2.8.5 FATAL_ERROR)
project(Boost)

##########################################################################
# Config Information                                                     #
##########################################################################

set(Boost_DIR "${Boost_SOURCE_DIR}")

if(BOOST_INITIAL_PASS)
  set(Boost_MODULE_PATH "${Boost_SOURCE_DIR}/tools/cmake/modules")
  set(Boost_RESOURCE_PATH "${Boost_SOURCE_DIR}/tools/cmake/resources")
endif(BOOST_INITIAL_PASS)

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

# make visual studio look nice
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

##########################################################################
# Components                                                             #
##########################################################################

@BOOST_SUBDIRECTORIES@

##########################################################################
#                                                                        #
##########################################################################

if(BOOST_INITIAL_PASS)
  # report an error in order to inhibit the generation step (save time).
  message(SEND_ERROR
    "Initial pass successfully completed, now run CMake again!"
    )
  unset(BOOST_INITIAL_PASS CACHE)
endif(BOOST_INITIAL_PASS)

