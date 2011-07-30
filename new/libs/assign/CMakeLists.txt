# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    array
    config
    detail
    mpl
    preprocessor
    ptr_container
    range
    static_assert
    tuple
    type_traits
  NO_MODULE
  )
include("${Boost_DEV_FILE}")
