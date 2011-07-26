# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    bind
    config
    core
    detail
    integer
    io
    iterator
    smart_ptr
    static_assert
    system
    test
    timer
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_add_headers(
  include/boost/filesystem
  include/boost/filesystem.hpp
  )

boost_add_library(filesystem NO_SYMBOL
  SOURCES
    v2/src/v2_operations
    v2/src/v2_path
    v2/src/v2_portability
    v3/src/operations
    v3/src/path
    v3/src/portability
    v3/src/utf8_codecvt_facet
    v3/src/codecvt_error_category
    v3/src/path_traits
    v3/src/unique_path
    v3/src/windows_file_codecvt
  LINK_BOOST_LIBRARIES
    system
  )
