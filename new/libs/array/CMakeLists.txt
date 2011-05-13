# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Array
  AUTHORS
    "Nicolai Josuttis"
  DESCRIPTION
    "STL compliant container wrapper for arrays of constant size."
  DEPENDS
    utility
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/include/*.?pp)
boost_add_headers(${headers} PREFIX "!include/boost!boost!")

boost_documentation(doc/array.xml)

boost_add_test(array0 test/array0.cpp)
boost_add_test(array1 test/array1.cpp)
boost_add_test(array2 test/array2.cpp)
boost_add_test(array3 test/array3.cpp)
boost_add_test(array4 test/array4.cpp)
boost_add_test(array5 test/array5.cpp)
