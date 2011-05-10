# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Spirit
  AUTHORS
    "Joel de Guzman <joel -at- boost-consulting.com>"
    "Hartmut Kaiser <hartmut.kaiser -at- gmail.com>"
    "Dan Nuffer"
  DESCRIPTION
    "LL parser framework represents parsers directly as EBNF grammars in inlined C++."
  DEPENDS
    xpressive
    optional
    foreach
    array
    unordered
    pool
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/boost/*.?pp)
boost_add_headers(${headers})
