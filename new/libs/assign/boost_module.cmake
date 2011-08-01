# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Assign
  AUTHORS
    "Thorsten Ottosen <nesotto -at- cs.auc.dk>"
  DESCRIPTION
    "Filling containers with constant or generated data has never been easier."
  DEPENDS
    array
    config
    detail
    mpl
    preprocessor
    ptr_container
    range
    static_assert
    tuple
    type_traits
  TEST_DIRECTORIES
    test
  INCLUDE_DIRECTORIES
    include
  )
