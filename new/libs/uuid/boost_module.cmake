# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(UUID
  AUTHORS
    "Andy Tompkins"
  DESCRIPTION
    "The header uuid.hpp provides an implementation of Universally Unique Identifiers."
  DEPENDS
    config
    exception
    integer
    io
    iterator
    random
    serialization
    smart_ptr
    static_assert
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
