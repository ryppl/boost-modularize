# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Array
  AUTHORS
    "Nicolai Josuttis"
  DESCRIPTION
    "STL compliant container wrapper for arrays of constant size."
  DEPENDS
    config
    detail
    exception
    utility
  INCLUDE_DIRECTORIES
    include
  )
