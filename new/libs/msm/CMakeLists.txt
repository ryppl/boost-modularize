# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    any
    bind
    circular_buffer
    config
    function
    fusion
    mpl
    parameter
    phoenix
    preprocessor
    proto
    serialization
    smart_ptr
    statechart
    timer
    tuple
    type_traits
    typeof
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")
