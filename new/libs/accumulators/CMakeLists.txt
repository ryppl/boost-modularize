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

boost_project(Accumulators
  AUTHORS
    "Eric Niebler <eric -at- boost-consulting.com>"
  DESCRIPTION
    "A framework for incremental calculation, and a collection of statistical accumulators."
  DEPENDS
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
  DEB_DEPENDS
    DEV ghostscript
  )

boost_add_headers(LOCATION accumulators
  include/framework
  include/numeric
  include/statistics
  include/accumulators.hpp
  include/accumulators_fwd.hpp
  include/statistics.hpp
  include/statistics_fwd.hpp
  )

add_subdirectory(doc)
add_subdirectory(test)
