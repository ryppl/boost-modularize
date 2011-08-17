# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Signals
  AUTHORS
    "Douglas Gregor <doug.gregor -at- gmail.com>"
  DESCRIPTION
    "Managed signals & slots callback implementation."
  DEPENDS
    any
    config
    core
    function
    iterator
    mpl
    optional
    smart_ptr
    type_traits
    utility
  TEST_DIRECTORIES
    test
  INCLUDE_DIRECTORIES
    include
  )
