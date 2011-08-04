# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    function
    integer
    iterator
    smart_ptr
    thread
    unordered
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

find_package(ICU)
find_package(Iconv)

message(STATUS "TODO: Boost.Locale needs CMake-ification")
