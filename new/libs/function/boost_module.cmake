# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Function
  DEPENDS
    bind
    config
    detail
    exception
    integer
    mpl
    preprocessor
    type_traits
    typeof
    utility
  TEST_DIRECTORIES
    test
  INCLUDE_DIRECTORIES
    include
  )
