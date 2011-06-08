# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    array
    concept_check
    config
    core
    functional
    iterator
    mpl
    static_assert
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project("Multi Array"
  DEPENDS
    array
    iterator
    detail
    concept_check
    mpl
    static_assert
    functional
  )

boost_add_headers(
  include/boost/multi_array
  include/boost/multi_array.hpp
  )

