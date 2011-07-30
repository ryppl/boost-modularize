# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Statechart
  AUTHORS
    "Andreas Huber <ahd6974-boostorg -at- yahoo.com>"
  DESCRIPTION
    "Arbitrarily complex finite state machines can be implemented in easily readable and maintainable C++ code."
  DEPENDS
    bind
    config
    conversion
    detail
    function
    mpl
    smart_ptr
    static_assert
    thread
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
