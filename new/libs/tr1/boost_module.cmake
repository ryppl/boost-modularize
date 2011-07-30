# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(TR1
  AUTHORS
    "John Maddock <john -at- johnmaddock.co.uk>"
  DESCRIPTION
    "An implementation of the C++ Technical Report on Standard Library Extensions."
    "This library does not itself implement the TR1 components, rather it's a thin"
    "wrapper that will include your standard library's TR1 implementation (if it"
    "has one), otherwise it will include the Boost Library equivalents, and import"
    "them into namespace std::tr1."
  DEPENDS
    array
    bind
    config
    detail
    function
    functional
    fusion
    iterator
    math
    mpl
    random
    regex
    smart_ptr
    static_assert
    tuple
    type_traits
    unordered
    utility
  INCLUDE_DIRECTORIES
    include
  )
