# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Units
  AUTHORS
    "Matthias Schabel <boost -at- schabel-family.org>"
    "Steven Watanabe <steven -at- providere-consulting.com>"
  DESCRIPTION
    "Zero-overhead dimensional analysis and unit/quantity manipulation and conversion."
  DEPENDS
    math
    serialization
    lambda
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

