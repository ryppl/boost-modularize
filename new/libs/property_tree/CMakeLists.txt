# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    any
    config
    core
    exception
    iterator
    mpl
    multi_index
    optional
    serialization
    spirit
    static_assert
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project("Property Tree"
  DEPENDS
    any
    config
    core
    exception
    iterator
    mpl
    multi_index
    optional
    serialization
    spirit
    static_assert
    type_traits
    utility
  )

boost_add_headers(
  include/boost/property_tree
  )

