# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS config core detail static_assert test NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project("Dynamic Bitset"
  AUTHORS
    "Jeremy Siek <jeremy.siek -at- gmail.com>"
    "Chuck Allison"
  DESCRIPTION
    "A runtime-sized version of std::bitset"
  DEPENDS
    detail
    static_assert
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/include/*.?pp)
boost_add_headers_this_function_is_deprecated(${headers} PREFIX "!include/boost!boost!")

