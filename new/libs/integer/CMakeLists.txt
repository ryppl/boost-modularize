# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS config core NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Integer
  AUTHORS
    "Beman Dawes <bdawes -at- acm.org>"
    "Daryle Walker <darylew -at- hotmail.com>"
  DESCRIPTION
    "The organization of boost integer headers and classes is designed to"
    "take advantage of <stdint.h> types from the 1999 C standard without"
    "resorting to undefined behavior in terms of the 1998 C++ standard."
    "The header <boost/cstdint.hpp> makes the standard integer types safely"
    "available in namespace boost without placing any names in namespace std."
  DEPENDS
    utility
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

