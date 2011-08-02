# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS config core detail static_assert test NO_MODULE)
include("${Boost_DEV_FILE}")

boost_add_multiple_tests(
  RUN
    dyn_bitset_unit_tests1
    dyn_bitset_unit_tests2
    dyn_bitset_unit_tests3
    dyn_bitset_unit_tests4
  )
