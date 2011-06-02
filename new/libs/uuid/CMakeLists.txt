# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    conversion
    detail
    exception
    functional
    integer
    io
    iterator
    random
    serialization
    smart_ptr
    static_assert
    test
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(UUID
  AUTHORS
    "Andy Tompkins"
  DESCRIPTION
    "The header uuid.hpp provides an implementation of Universally Unique Identifiers."
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

