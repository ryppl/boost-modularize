# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(MPL
  AUTHORS
    "David Abrahams <dave -at- boostpro.com>"
    "Aleksey Gurtovoy <agurtovoy -at- meta-comm.com>"
  DESCRIPTION
    "A general-purpose, high-level C++ template metaprogramming framework of"
    "compile-time algorithms, sequences and metafunctions. It provides a"
    "conceptual foundation and an extensive set of powerful and coherent"
    "tools that make doing explict metaprogramming in C++ as easy and"
    "enjoyable as possible within the current language."
  DEPENDS
    preprocessor
    config
    detail
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

