# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Chrono
  DEPENDS
    config
    core
    detail
    exception
    integer
    interprocess
    io
    math
    mpl
    ratio
    static_assert
    system
    type_traits
    typeof
    utility
  INCLUDE_DIRECTORIES
    include
  )
