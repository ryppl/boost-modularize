# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module("Multi Index"
  DEPENDS
    bind
    config
    core
    detail
    exception
    functional
    iterator
    math
    mpl
    preprocessor
    serialization
    static_assert
    tuple
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
