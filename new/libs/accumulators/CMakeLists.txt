# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    array
    bind
    circular_buffer
    concept_check
    config
    core
    exception
    foreach
    fusion
    iterator
    mpl
    numeric
    parameter
    preprocessor
    random
    range
    test
    tuple
    type_traits
    typeof
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Accumulators
  AUTHORS
    "Eric Niebler <eric -at- boost-consulting.com>"
  DESCRIPTION
    "A framework for incremental calculation, and a collection of statistical accumulators."
  DEPENDS
    parameter
    typeof
    foreach
  DEB_DEPENDS
    DEV ghostscript
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/include/*.?pp)
boost_add_headers(${headers} PREFIX "!include!boost/accumulators!")

add_subdirectory(doc)
add_subdirectory(test)
