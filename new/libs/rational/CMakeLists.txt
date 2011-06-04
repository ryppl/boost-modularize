# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS config detail math static_assert utility NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Rational
  DEPENDS
    config
    math
    static_assert
    utility
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

