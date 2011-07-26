# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    concept_check
    config
    conversion
    detail
    graph
    iterator
    mpi
    mpl
    optional
    property_map
    serialization
    static_assert
    type_traits
    unordered
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

math(EXPR BOOST_VERSION
  "${Boost_VERSION_MAJOR} * 100000 + ${Boost_VERSION_MINOR} * 100 + ${Boost_VERSION_PATCH}"
  )
string(REPLACE "." "_" BOOST_LIB_VERSION "${Boost_VERSION}")

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/include/boost/version.hpp.in
  ${CMAKE_CURRENT_BINARY_DIR}/include/boost/version.hpp
  )

# Header files have to be added individually, because the disjoint_sets library
# will put files in the same directories. The directories must mot be symlinked!

file(GLOB headers "include/boost/*.hpp")
boost_add_headers(
  ${headers}
  "${CMAKE_CURRENT_BINARY_DIR}/include/boost/version.hpp"
  )

file(GLOB headers "include/boost/pending/*.hpp")
boost_add_headers(${headers} LOCATION pending)

file(GLOB headers "include/boost/pending/detail/*.hpp")
boost_add_headers(${headers} LOCATION pending/detail)
