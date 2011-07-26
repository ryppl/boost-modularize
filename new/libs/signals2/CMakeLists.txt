# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    any
    bind
    config
    core
    detail
    exception
    function
    iterator
    mpl
    multi_index
    optional
    parameter
    preprocessor
    smart_ptr
    type_traits
    utility
    variant
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_add_headers(
  include/boost/signals2
  include/boost/signals2.hpp
  )
