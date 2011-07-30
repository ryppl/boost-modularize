# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS config detail exception utility NO_MODULE)
include("${Boost_DEV_FILE}")

boost_documentation(doc/array.xml)

boost_add_test(array0 test/array0.cpp)
boost_add_test(array1 test/array1.cpp)
boost_add_test(array2 test/array2.cpp)
boost_add_test(array3 test/array3.cpp)
boost_add_test(array4 test/array4.cpp)
boost_add_test(array5 test/array5.cpp)
