# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
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

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/boost/*.?pp)
boost_add_headers(${headers})

boost_add_library(random NO_SYMBOL src/random_device.cpp)
