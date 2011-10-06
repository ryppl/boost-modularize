# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS chrono config core integer utility NO_MODULE)
include("${Boost_DEV_FILE}")

boost_add_library(timer NO_SYMBOL
  SOURCES
    src/auto_timers.cpp
    src/auto_timers_construction.cpp
    src/cpu_timer.cpp
  LINK_BOOST_LIBRARIES
    chrono
  )
