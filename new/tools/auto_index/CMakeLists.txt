# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost NO_MODULE)
include("${Boost_DEV_FILE}")

boost_add_executable(auto_index
  SOURCES
    src/auto_index.cpp 
    src/file_scanning.cpp 
    src/index_generator.cpp 
    src/tiny_xml.cpp 
  LINK_BOOST_LIBRARIES
    regex
    filesystem
    system
    program_options
  )
