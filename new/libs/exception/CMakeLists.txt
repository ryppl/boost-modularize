# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    detail
    smart_ptr
    tuple
    units
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_add_headers(
  include/boost/exception
  include/boost/exception.hpp
  include/boost/exception_ptr.hpp
  include/boost/throw_exception.hpp
  )
