# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module("Ptr Container"
  AUTHORS
    "Thorsten Ottosen <nesotto -at- cs.auc.dk>"
  DESCRIPTION
    "Containers for storing heap-allocated polymorphic objects to ease OO-programming."
  DEPENDS
    array
    circular_buffer
    config
    iterator
    mpl
    range
    serialization
    smart_ptr
    static_assert
    type_traits
    unordered
    utility
  )
