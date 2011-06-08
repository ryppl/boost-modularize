# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    detail
    iterator
    mpl
    parameter
    preprocessor
    type_traits
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project("Concept Check"
  AUTHORS
    "Jeremy Siek <jeremy.siek -at- gmail.com>"
  DESCRIPTION
    "Tools for generic programming."
  DEPENDS
    preprocessor
  )

boost_add_headers(
  include/boost/concept
  include/boost/concept_check
  include/boost/concept_archetype.hpp
  include/boost/concept_check.hpp
  )
