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

boost_project(Core)

math(EXPR BOOST_VERSION
  "${Boost_VERSION_MAJOR} * 100000 + ${Boost_VERSION_MINOR} * 100 + ${Boost_VERSION_PATCH}"
  )
string(REPLACE "." "_" BOOST_LIB_VERSION "${Boost_VERSION}")

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/include/boost/version.hpp.in
  ${CMAKE_CURRENT_BINARY_DIR}/include/boost/version.hpp
  )

boost_add_headers(
  include/boost/blank.hpp
  include/boost/blank_fwd.hpp
  include/boost/cstdlib.hpp
  include/boost/indirect_reference.hpp
  include/boost/limits.hpp
  include/boost/memory_order.hpp
  include/boost/non_type.hpp
  include/boost/pending
  include/boost/type.hpp
  ${CMAKE_CURRENT_BINARY_DIR}/include/boost/version.hpp
  include/boost/visit_each.hpp
  )
