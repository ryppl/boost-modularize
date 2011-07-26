# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    conversion
    core
    detail
    integer
    iterator
    mpl
    preprocessor
    random
    smart_ptr
    static_assert
    test
    tuple
    type_traits
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_add_headers(
  include/boost/assert.hpp
  include/boost/call_traits.hpp
  include/boost/checked_delete.hpp
  include/boost/compressed_pair.hpp
  include/boost/current_function.hpp
  include/boost/generator_iterator.hpp
  include/boost/next_prior.hpp
  include/boost/noncopyable.hpp
  include/boost/operators.hpp
  include/boost/ref.hpp
  include/boost/swap.hpp
  include/boost/utility
  include/boost/utility.hpp
  )

