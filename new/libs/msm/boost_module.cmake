# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(MSM
  DEPENDS
    bind
    circular_buffer
    config
    function
    fusion
    mpl
    parameter
    phoenix
    preprocessor
    proto
    serialization
    smart_ptr
    tuple
    type_traits
    typeof
    utility
  INCLUDE_DIRECTORIES
    include
  )
