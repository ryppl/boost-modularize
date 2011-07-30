# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Variant
  DEPENDS
    config
    core
    detail
    math
    mpl
    preprocessor
    static_assert
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
