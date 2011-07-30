# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module("Property Map"
  DEPENDS
    any
    bind
    concept_check
    config
    conversion
    core
    detail
    exception
    function
    graph
    iterator
    mpl
    multi_index
    optional
    serialization
    smart_ptr
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
