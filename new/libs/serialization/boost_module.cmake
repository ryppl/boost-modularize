# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Serialization
  AUTHORS
    "<ramey -at- rrsd.com>"
  DESCRIPTION
    "Serialization for persistence and marshalling."
  DEPENDS
    array
    config
    core
    detail
    integer
    io
    iterator
    mpl
    optional
    preprocessor
    smart_ptr
    spirit
    static_assert
    type_traits
    utility
    variant
  )
