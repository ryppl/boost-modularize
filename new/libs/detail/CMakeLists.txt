# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    array
    config
    core
    functional
    integer
    mpl
    preprocessor
    range
    smart_ptr
    static_assert
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Detail
  DEPENDS
    integer
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/include/*.?pp)
boost_add_headers(${headers} PREFIX "!include/boost!boost!")

