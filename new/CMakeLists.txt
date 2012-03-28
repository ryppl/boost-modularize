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

set(Boost_DIR "${Boost_SOURCE_DIR}")

set(BOOST_INITIAL_PASS TRUE CACHE BOOL "")
if(BOOST_INITIAL_PASS)
  set(Boost_MODULE_PATH "${Boost_SOURCE_DIR}/tools/cmake/modules")
  set(Boost_RESOURCE_PATH "${Boost_SOURCE_DIR}/tools/cmake/resources")
endif(BOOST_INITIAL_PASS)

# make visual studio look nice
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

@BOOST_SUBDIRECTORIES@

if(BOOST_INITIAL_PASS)
  # report an error in order to inhibit the generation step (save time).
  message(SEND_ERROR
    "Initial pass successfully completed, now run CMake again!"
    )
  set(BOOST_INITIAL_PASS FALSE CACHE BOOL "" FORCE)
endif(BOOST_INITIAL_PASS)

