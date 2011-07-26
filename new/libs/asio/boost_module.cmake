# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Asio
  AUTHORS
    "Chris Kohlhoff <chris -at- kohlhoff.com>"
  DESCRIPTION
    "Portable networking, including sockets, timers, hostname resolution and socket iostreams."
  DEPENDS
    array
    bind
    config
    core
    date_time
    detail
    exception
    function
    integer
    iterator
    preprocessor
    regex
    smart_ptr
    system
    type_traits
    utility
  )
