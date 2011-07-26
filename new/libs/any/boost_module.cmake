# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Any
  AUTHORS
    "Kevlin Henney"
  MAINTAINERS
    "Alexander Nasonov <alexander.nasonov -at- gmail.com>"
  DESCRIPTION
    "Safe, generic container for single values of different value types."
  DEPENDS
    config
    exception
    static_assert
    type_traits
  )
