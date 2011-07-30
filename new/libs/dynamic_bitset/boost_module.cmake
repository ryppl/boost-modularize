# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module("Dynamic Bitset"
  AUTHORS
    "Jeremy Siek <jeremy.siek -at- gmail.com>"
    "Chuck Allison"
  DESCRIPTION
    "A runtime-sized version of std::bitset"
  DEPENDS
    config
    core
    detail
    static_assert
  INCLUDE_DIRECTORIES
    include
  )
