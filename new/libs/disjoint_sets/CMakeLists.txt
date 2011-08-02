# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS core graph test NO_MODULE)
include("${Boost_DEV_FILE}")

boost_add_multiple_tests(
  RUN
    disjoint_set_test
  )
