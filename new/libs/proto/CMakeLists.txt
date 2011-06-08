# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    core
    detail
    fusion
    mpl
    preprocessor
    smart_ptr
    spirit
    static_assert
    type_traits
    typeof
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Proto
  DEPENDS
    fusion
    typeof
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers_this_function_is_deprecated(${headers} PREFIX "!include!!")

