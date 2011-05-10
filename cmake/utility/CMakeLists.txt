# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Utility
  AUTHORS
    "David Abrahams <dave -at- boostpro.com>"
    "Brad King"
    "Douglas Gregor <doug.gregor -at- gmail.com>"
  DESCRIPTION
    "Various small utilities for C++ programming."
  DEPENDS
    iterator
    exception
    detail
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/boost/*.?pp)
boost_add_headers(${headers})
