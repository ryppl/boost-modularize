# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    array
    bind
    config
    core
    date_time
    detail
    exception
    function
    integer
    iterator
    preprocessor
    regex
    smart_ptr
    system
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Asio
  AUTHORS
    "Chris Kohlhoff <chris -at- kohlhoff.com>"
  DESCRIPTION
    "Portable networking, including sockets, timers, hostname resolution and socket iostreams."
  DEPENDS
    array
    bind
    config
    core
    date_time
    detail
    exception
    function
    integer
    iterator
    preprocessor
    regex
    smart_ptr
    system
    type_traits
    utility
  )

boost_add_headers(
  include/boost/asio
  include/boost/asio.hpp
  )

add_subdirectory(doc)
