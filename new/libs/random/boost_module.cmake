# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Random
  AUTHORS
    "Jens Maurer <Jens.Maurer -at- gmx.net>"
  DESCRIPTION
    "A complete system for random number generation."
  DEPENDS
    config
    core
    detail
    integer
    math
    mpl
    range
    static_assert
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
