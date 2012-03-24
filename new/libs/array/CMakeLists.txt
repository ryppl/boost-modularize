# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)
project(BoostArray)

find_package(Boost COMPONENTS cmake NO_MODULE)
include(${Boost_USE_FILE})
#include(BoostDocumentation)
include(BoostExport)

#boost_documentation(doc/array.xml)

boost_export(
  BOOST_DEPENDS
    config
    exception
    utility
  INCLUDE_DIRECTORIES
    include
  )

#boost_add_test(array0 test/array0.cpp)
#boost_add_test(array1 test/array1.cpp)
#boost_add_test(array2 test/array2.cpp)
#boost_add_test(array3 test/array3.cpp)
#boost_add_test(array4 test/array4.cpp)
#boost_add_test(array5 test/array5.cpp)
