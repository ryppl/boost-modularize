# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Signals2
  AUTHORS
    "Frank Mori Hess <fmhess -at- users.sourceforge.net>"
  DESCRIPTION
    "The Boost.Signals2 library is an implementation of a managed signals and slots system."
    "Signals represent callbacks with multiple targets, and are also called publishers or"
    "events in similar systems. Signals are connected to some set of slots, which are"
    "callback receivers (also called event targets or subscribers), which are called"
    "when the signal is 'emitted'."
  DEPENDS
    thread
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/boost/*.?pp)
boost_add_headers(${headers})
