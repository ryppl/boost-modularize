# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    algorithm
    array
    assign
    bind
    concept_check
    config
    conversion
    core
    detail
    exception
    foreach
    format
    function
    function_types
    fusion
    integer
    io
    iostreams
    iterator
    math
    mpl
    optional
    phoenix
    pool
    preprocessor
    proto
    range
    regex
    serialization
    smart_ptr
    static_assert
    thread
    timer
    type_traits
    typeof
    unordered
    utility
    variant
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_add_headers(
  include/boost/spirit
  include/boost/spirit.hpp
  )
