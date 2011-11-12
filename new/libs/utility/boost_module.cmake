# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Utility
  AUTHORS
    "David Abrahams <dave -at- boostpro.com>"
    "Brad King"
    "Douglas Gregor <doug.gregor -at- gmail.com>"
  DESCRIPTION
    "Various small utilities for C++ programming."
  DEPENDS
    config
    core
    detail
    iterator
    mpl
    preprocessor
    static_assert
    type_traits
  TEST_DIRECTORIES
    test
  INCLUDE_DIRECTORIES
    include
  )
