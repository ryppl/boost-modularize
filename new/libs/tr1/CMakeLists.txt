# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    array
    bind
    concept_check
    config
    detail
    function
    functional
    fusion
    integer
    iterator
    math
    mpl
    program_options
    random
    regex
    smart_ptr
    static_assert
    test
    tuple
    type_traits
    unordered
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(TR1
  AUTHORS
    "John Maddock <john -at- johnmaddock.co.uk>"
  DESCRIPTION
    "An implementation of the C++ Technical Report on Standard Library Extensions."
    "This library does not itself implement the TR1 components, rather it's a thin"
    "wrapper that will include your standard library's TR1 implementation (if it"
    "has one), otherwise it will include the Boost Library equivalents, and import"
    "them into namespace std::tr1."
  DEPENDS
    fusion
    random
    math
    functional
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

