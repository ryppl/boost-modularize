# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    concept_check
    config
    conversion
    core
    detail
    function_types
    mpl
    smart_ptr
    static_assert
    tuple
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_add_headers(
  include/boost/function_output_iterator.hpp
  include/boost/iterator
  include/boost/iterator.hpp
  include/boost/iterator_adaptors.hpp
  include/boost/pointee.hpp
  include/boost/shared_container_iterator.hpp
  )
