# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module("Property Tree"
  DEPENDS
    any
    config
    core
    exception
    iterator
    mpl
    multi_index
    optional
    serialization
    spirit
    static_assert
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
