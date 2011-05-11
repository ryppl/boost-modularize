# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Iterator
  AUTHORS
    "David Abrahams <dave -at- boostpro.com>"
    "Jeremy Siek <jeremy.siek -at- gmail.com>"
    "Thomas Witt <witt - at - acm.org>"
  DESCRIPTION
    "A system of concepts which extend the C++ standard iterator requirements"
    "and a framework of components for building iterators based on these"
    "extended concepts and includes several useful iterator adaptors."
  DEPENDS
    mpl
    type_traits
    function
    concept_check
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

