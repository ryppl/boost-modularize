# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Units
  AUTHORS
    "Matthias Schabel <boost -at- schabel-family.org>"
    "Steven Watanabe <steven -at- providere-consulting.com>"
  DESCRIPTION
    "Zero-overhead dimensional analysis and unit/quantity manipulation and conversion."
  DEPENDS
    algorithm
    config
    core
    io
    lambda
    math
    mpl
    preprocessor
    serialization
    static_assert
    type_traits
    typeof
    utility
  TEST_DIRECTORIES
    test
  INCLUDE_DIRECTORIES
    include
  )
