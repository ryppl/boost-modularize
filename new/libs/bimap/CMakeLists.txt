# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    concept_check
    config
    exception
    functional
    iterator
    lambda
    mpl
    multi_index
    preprocessor
    property_map
    serialization
    static_assert
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Bimap
  AUTHORS
    "Matias Capeletto <matias.capeletto -at- gmail.com>"
  DESCRIPTION
    "Bidirectional map containers"
  DEPENDS
    xpressive
    property_map
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/include/*.?pp)
boost_add_headers(${headers} PREFIX "!include/boost!boost!")

