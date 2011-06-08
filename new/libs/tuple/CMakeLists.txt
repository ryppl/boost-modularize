# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS config detail static_assert type_traits utility NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Tuple
  AUTHORS
    "Jaakko Jarvi <jarvi -at- cs.tamu.edu>"
  DESCRIPTION
    "Ease definition of functions returning multiple values, and more."
  DEPENDS
    static_assert
  )

boost_add_headers(
  include/boost/tuple
  )
