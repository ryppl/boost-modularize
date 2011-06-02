# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS core graph test NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project("Disjoint Sets"
  AUTHORS
    "Jeremy Siek <jeremy.siek -at- gmail.com>"
    "Lie-Quan Lee"
    "Andrew Lumsdaine"
  DESCRIPTION
    "Provides disjoint sets operations with union by rank and path compression."
  DEPENDS
    test
    graph
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/include/*.?pp)
boost_add_headers(${headers} PREFIX "!include/boost!boost!")

