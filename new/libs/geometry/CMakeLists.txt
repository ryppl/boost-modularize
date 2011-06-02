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
    foreach
    function_types
    fusion
    graph
    integer
    iterator
    math
    mpl
    msm
    numeric
    optional
    polygon
    program_options
    proto
    random
    range
    smart_ptr
    static_assert
    test
    timer
    tokenizer
    tuple
    type_traits
    typeof
    units
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

