# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Thread
  DEPENDS
    bind
    config
    date_time
    detail
    exception
    function
    integer
    mpl
    optional
    smart_ptr
    static_assert
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
