# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    conversion
    core
    detail
    foreach
    format
    integer
    math
    mpl
    multi_index
    range
    regex
    smart_ptr
    static_assert
    test
    timer
    tuple
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Random
  AUTHORS
    "Jens Maurer <Jens.Maurer -at- gmx.net>"
  DESCRIPTION
    "A complete system for random number generation."
  DEPENDS
    detail
    integer
    type_traits
    static_assert
  )

if(MSVC)
  add_definitions(/wd4005) # 'BOOST_RANDOM_SOURCE': macro redefinition
endif(MSVC)

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers_this_function_is_deprecated(${headers} PREFIX "!include!!")

boost_add_library(random NO_SYMBOL src/random_device.cpp)
