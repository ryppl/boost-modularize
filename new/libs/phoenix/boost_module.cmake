# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Phoenix
  DEPENDS
    bind
    config
    core
    detail
    fusion
    mpl
    preprocessor
    proto
    range
    smart_ptr
    spirit
    type_traits
    utility
  TEST_DIRECTORIES
    test
  INCLUDE_DIRECTORIES
    include
  )
