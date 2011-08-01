# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Conversion
  AUTHORS
    "David Abrahams <dave -at- boost-consulting.com>"
     "Kevlin Henney"
  DESCRIPTION
    "Polymorphic and lexical casts"
  DEPENDS
    config
    core
    detail
    exception
    mpl
    numeric
    static_assert
    type_traits
    utility
  TEST_DIRECTORIES
    test
  INCLUDE_DIRECTORIES
    include
  )
