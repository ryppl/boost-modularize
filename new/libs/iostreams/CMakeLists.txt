# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    bind
    config
    core
    detail
    exception
    function
    integer
    mpl
    preprocessor
    random
    range
    regex
    smart_ptr
    static_assert
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Iostreams
  AUTHORS
    "Jonathan Turkanis <turkanis -at- coderage.com>"
  DESCRIPTION
    "Framework for defining streams, stream buffers and i/o filters"
  DEPENDS
    range
    random
  DEB_DEPENDS
    DEV libbz2-dev zlib1g-dev
    LIB libbz2-1.0 zlib1g
  )

add_definitions(-DBOOST_IOSTREAMS_USE_DEPRECATED)

if(MSVC)
  add_definitions(
    /wd4005 # 'BOOST_IOSTREAMS_SOURCE': macro redefinition
    /wd4244 # conversion from 'boost::iostreams::stream_offset' to 'size_t'
    /wd4251 # class needs to have dll-interface to be used by clients
    /wd4800 # forcing value to bool 'true' or 'false'
    )
endif(MSVC)

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

set(sources src/file_descriptor.cpp src/mapped_file.cpp)
set(link_libraries)

find_package(ZLIB)
if(ZLIB_FOUND)
  include_directories(${ZLIB_INCLUDE_DIRS})
  list(APPEND sources src/zlib.cpp src/gzip.cpp)
  list(APPEND link_libraries ${ZLIB_LIBRARIES})
endif(ZLIB_FOUND)

find_package(BZip2)
if(BZIP2_FOUND)
  include_directories(${BZIP2_INCLUDE_DIR})
  list(APPEND sources src/bzip2.cpp)
  list(APPEND link_libraries ${BZIP2_LIBRARIES})
endif(BZIP2_FOUND)

boost_add_library(iostreams NO_SYMBOL
  SOURCES
    ${sources}
  LINK_LIBRARIES
    ${link_libraries}
  )
