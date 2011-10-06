# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    core
    detail
    exception
    format
    integer
    interprocess
    math
    mpl
    ratio
    static_assert
    system
    type_traits
    typeof
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

if(CMAKE_SYSTEM STREQUAL "Linux")
  find_library(RT_LIBRARY rt)
endif(CMAKE_SYSTEM STREQUAL "Linux") 

boost_add_library(chrono NO_SYMBOL
  SOURCES
    src/chrono.cpp
    src/thread_clock.cpp
    src/process_cpu_clocks.cpp
  LINK_BOOST_LIBRARIES
    system
  LINK_LIBRARIES
    ${RT_LIBRARY}
  )
