# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    array
    bind
    config
    detail
    function
    functional
    fusion
    iterator
    math
    mpl
    random
    regex
    smart_ptr
    static_assert
    tuple
    type_traits
    unordered
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_add_headers(
  include/boost/tr1
  )
