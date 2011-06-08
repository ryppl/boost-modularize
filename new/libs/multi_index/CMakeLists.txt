# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    bind
    config
    core
    detail
    exception
    functional
    iterator
    math
    mpl
    preprocessor
    serialization
    static_assert
    tuple
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project("Multi Index"
  DEPENDS
    serialization
    functional
    math
  )

boost_add_headers(
  include/boost/multi_index
  include/boost/multi_index_container.hpp
  include/boost/multi_index_container_fwd.hpp
  )
