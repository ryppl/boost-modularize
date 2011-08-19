# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS config exception static_assert type_traits NO_MODULE)
include("${Boost_DEV_FILE}")

boost_documentation(doc/any.xml)

boost_add_multiple_tests(
  RUN
    any_test.cpp
  COMPILE_FAIL
    test/any_cast_cv_failed.cpp
  )
