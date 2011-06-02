# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    bind
    concept_check
    config
    core
    detail
    exception
    iterator
    static_assert
    test
    thread
    timer
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project("Circular Buffer"
  AUTHORS
    "Jan Gaspar <jano_gaspar -at- yahoo.com>"
  DESCRIPTION
    "STL compliant container also known as ring or cyclic buffer."
  DEPENDS
    config
    thread
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/include/*.?pp)
boost_add_headers(${headers} PREFIX "!include/boost!boost!")

