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

boost_add_headers(
  include/boost/crc.hpp
  )
