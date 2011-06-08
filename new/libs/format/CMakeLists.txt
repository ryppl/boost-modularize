# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    core
    detail
    exception
    optional
    smart_ptr
    timer
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Format
  DEPENDS
    config
    core
    detail
    exception
    optional
    smart_ptr
    utility
  )

boost_add_headers(
  include/boost/format
  include/boost/format.hpp
  )
