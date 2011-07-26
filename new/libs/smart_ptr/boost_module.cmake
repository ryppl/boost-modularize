# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module("Smart Ptr"
  AUTHORS
    "Darin Adler"
    "Greg Colvin"
    "Beman Dawes <bdawes -at- acm.org>"
    "Peter Dimov <pdimov -at- mmltd.net>"
  DESCRIPTION
    "Five smart pointer class templates."
  DEPENDS
    config
    core
    detail
    exception
    type_traits
    utility
  )
