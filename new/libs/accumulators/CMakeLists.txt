# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    array
    circular_buffer
    concept_check
    config
    core
    exception
    fusion
    iterator
    mpl
    numeric
    parameter
    preprocessor
    range
    tuple
    type_traits
    typeof
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")
