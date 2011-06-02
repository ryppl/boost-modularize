# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    any
    asio
    assign
    bind
    config
    core
    detail
    function
    fusion
    lambda
    mpl
    preprocessor
    proto
    range
    smart_ptr
    spirit
    static_assert
    test
    thread
    type_traits
    typeof
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

