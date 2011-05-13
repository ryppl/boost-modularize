# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(GIL
  AUTHORS
    "Lubomir Bourdev <lbourdev -at- adobe.com>"
    "Hailin Jin <hljin -at- adobe.com>"
  DESCRIPTION
    "Generic Image Library"
  DEPENDS
    type_traits
    mpl
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

