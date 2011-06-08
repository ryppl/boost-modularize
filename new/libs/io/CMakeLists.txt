# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS detail NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Io
  DEPENDS
    detail
  )

boost_add_headers(
  include/boost/io
  include/boost/io_fwd.hpp
  )
