# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    core
    date_time
    detail
    integer
    intrusive
    math
    move
    mpl
    preprocessor
    smart_ptr
    static_assert
    type_traits
    unordered
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Interprocess
  AUTHORS
    "Ion Gaztanaga <igaztanaga -at- gmail.com>"
  DESCRIPTION
    "Shared memory, memory mapped files, process-shared mutexes, condition"
    "variables, containers and allocators."
  DEPENDS
    date_time
    intrusive
    math
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers_this_function_is_deprecated(${headers} PREFIX "!include!!")

