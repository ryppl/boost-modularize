# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    core
    detail
    exception
    integer
    interprocess
    io
    math
    mpl
    ratio
    static_assert
    system
    type_traits
    typeof
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Chrono
  DEPENDS
    config
    core
    detail
    exception
    integer
    interprocess
    io
    math
    mpl
    ratio
    static_assert
    system
    type_traits
    typeof
    utility
  )

boost_add_headers(
  include/boost/chrono
  include/boost/chrono.hpp
  )
