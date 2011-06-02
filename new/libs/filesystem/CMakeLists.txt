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

boost_project(Filesystem
  AUTHORS
    "Beman Dawes <bdawes -at- acm.org>"
  DESCRIPTION
    "Provides portable facilities to query and manipulate paths, files, and directories."
  DEPENDS
    system
    smart_ptr
  )

if(MSVC)
  add_definitions(/wd4005) # 'BOOST_FILESYSTEM_SOURCE': macro redefinition
endif(MSVC)

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

boost_forward_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/../detail/utf8_codecvt_facet.cpp
  ${CMAKE_CURRENT_BINARY_DIR}/include/libs/detail/utf8_codecvt_facet.cpp
  )
include_directories(${CMAKE_CURRENT_BINARY_DIR}/include)


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
