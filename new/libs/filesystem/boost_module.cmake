# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Filesystem
  AUTHORS
    "Beman Dawes <bdawes -at- acm.org>"
  DESCRIPTION
    "Provides portable facilities to query and manipulate paths, files, and directories."
  DEPENDS
    config
    detail
    integer
    io
    iterator
    smart_ptr
    static_assert
    system
    type_traits
    utility
  TEST_DIRECTORIES
    test
  INCLUDE_DIRECTORIES
    include
  )
