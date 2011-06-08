# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    detail
    function_types
    mpl
    preprocessor
    smart_ptr
    static_assert
    tuple
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Fusion
  AUTHORS
    "Joel de Guzman <joel -at- boost-consulting.com>"
    "Dan Marsden <danmarsden -at- yahoo.co.uk>"
    "Tobias Schwinger <tschwinger -at- isonews2.com>"
  DESCRIPTION
    "Library for working with tuples, including various containers, algorithms, etc."
  DEPENDS
    function_types
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers_this_function_is_deprecated(${headers} PREFIX "!include!!")

