# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Exception
  AUTHORS
    "Emil Dotchevski <emil -at- revergestudios.com>"
  DESCRIPTION
    "A library for transporting of arbitrary data in exception objects, and"
    "transporting of exceptions between threads."
  DEPENDS
    smart_ptr
    detail
    utility
    tuple
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/boost/*.?pp)
boost_add_headers(${headers})
