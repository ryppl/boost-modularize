# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    concept_check
    config
    core
    detail
    integer
    io
    logic
    mpl
    preprocessor
    rational
    serialization
    smart_ptr
    static_assert
    test
    timer
    type_traits
    typeof
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Numeric
  DEPENDS
    concept_check
    config
    core
    detail
    logic
    mpl
    serialization
    smart_ptr
    static_assert
    type_traits
    typeof
    utility
  )

boost_add_headers(
  include/boost/numeric
  )
