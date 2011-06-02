# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    bind
    config
    detail
    exception
    integer
    lambda
    mpl
    preprocessor
    static_assert
    test
    type_traits
    typeof
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Function
  DEPENDS
    detail
    preprocessor
    utility
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

boost_documentation(doc/function.xml)
