# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    algorithm
    any
    array
    bind
    concept_check
    config
    conversion
    core
    detail
    disjoint_sets
    dynamic_bitset
    exception
    filesystem
    foreach
    function
    functional
    integer
    iterator
    math
    mpi
    mpl
    multi_index
    optional
    parameter
    property_map
    property_tree
    random
    range
    regex
    serialization
    smart_ptr
    spirit
    static_assert
    test
    tuple
    type_traits
    typeof
    unordered
    utility
    variant
    xpressive
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Graph
  AUTHORS
    "Jeremy Siek <jeremy.siek -at- gmail.com>"
    "Lie-Quan Lee"
    "Andrew Lumsdaine"
    "Douglas Gregor <doug.gregor -at- gmail.com>"
  DESCRIPTION
    "The BGL graph interface and graph components are generic,"
    "in the same sense as the the Standard Template Library (STL)."
  DEPENDS
    algorithm
    any
    array
    bind
    concept_check
    config
    conversion
    core
    detail
    disjoint_sets
    dynamic_bitset
    exception
    filesystem
    foreach
    function
    functional
    integer
    iterator
    math
    mpi
    mpl
    multi_index
    optional
    parameter
    property_map
    property_tree
    random
    range
    serialization
    smart_ptr
    spirit
    static_assert
    test
    tuple
    type_traits
    typeof
    unordered
    utility
    variant
    xpressive
  )

boost_add_headers(
  include/boost/graph
  )

boost_add_library(graph NO_SYMBOL
  SOURCES
    src/read_graphviz_new.cpp
    src/graphml.cpp
  LINK_BOOST_LIBRARIES
    regex
  )
