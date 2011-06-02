# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    core
    detail
    exception
    integer
    mpl
    numeric
    static_assert
    test
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Conversion
  AUTHORS
    "David Abrahams <dave -at- boost-consulting.com>"
     "Kevlin Henney"
  DESCRIPTION
    "Polymorphic and lexical casts"
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/include/*.?pp)
boost_add_headers(${headers} PREFIX "!include/boost!boost!")

