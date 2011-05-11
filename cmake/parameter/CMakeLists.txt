# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Parameter
  AUTHORS
    "David Abrahams <dave -at- boostpro.com>"
    "Daniel Wallin <dalwan01 -at- student.umu.se>"
  DESCRIPTION
    "Write functions that accept arguments by name."
  DEPENDS
    python
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

