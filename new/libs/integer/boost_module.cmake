# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Integer
  AUTHORS
    "Beman Dawes <bdawes -at- acm.org>"
    "Daryle Walker <darylew -at- hotmail.com>"
  DESCRIPTION
    "The organization of boost integer headers and classes is designed to"
    "take advantage of <stdint.h> types from the 1999 C standard without"
    "resorting to undefined behavior in terms of the 1998 C++ standard."
    "The header <boost/cstdint.hpp> makes the standard integer types safely"
    "available in namespace boost without placing any names in namespace std."
  DEPENDS
    config
    core
  INCLUDE_DIRECTORIES
    include
  )
