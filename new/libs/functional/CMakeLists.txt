# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    core
    detail
    integer
    iterator
    mpl
    optional
    preprocessor
    smart_ptr
    static_assert
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Functional
  DEPENDS
    integer
  )

boost_add_headers(
  include/boost/functional
  include/boost/functional.hpp
  )
