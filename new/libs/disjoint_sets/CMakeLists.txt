# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS core graph test NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project("Disjoint Sets"
  AUTHORS
    "Jeremy Siek <jeremy.siek -at- gmail.com>"
    "Lie-Quan Lee"
    "Andrew Lumsdaine"
  DESCRIPTION
    "Provides disjoint sets operations with union by rank and path compression."
  DEPENDS
    test
    graph
  )

# Header files have to be added individually, because the core component
# will put files in the same directories. The directories must mot be symlinked!

boost_add_headers(LOCATION pending
  include/boost/pending/disjoint_sets.hpp
  )
boost_add_headers(LOCATION pending/detail
  include/boost/pending/detail/disjoint_sets.hpp
  )
