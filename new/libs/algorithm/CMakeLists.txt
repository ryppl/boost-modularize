# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    bind
    concept_check
    config
    detail
    function
    iterator
    mpl
    range
    regex
    test
    timer
    tuple
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")
