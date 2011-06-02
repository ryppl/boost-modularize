# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    assign
    bind
    concept_check
    config
    exception
    foreach
    functional
    iterator
    lambda
    mpl
    multi_index
    optional
    preprocessor
    property_map
    range
    serialization
    static_assert
    test
    tokenizer
    type_traits
    typeof
    utility
    xpressive
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

