# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS config core integer NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(CRC
  AUTHORS
    "Daryle Walker <darylew -at- hotmail.com>"
  DESCRIPTION
    "The Boost CRC Library provides two implementations of CRC (cyclic"
    "redundancy code) computation objects and two implementations of CRC"
    "computation functions. The implementations are template-based."
  DEPENDS
    config
    integer
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/include/*.?pp)
boost_add_headers(${headers} PREFIX "!include/boost!boost!")

