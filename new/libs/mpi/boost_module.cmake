# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(MPI
  DEPENDS
    config
    core
    exception
    function
    graph
    integer
    iterator
    mpl
    optional
    property_map
    python
    serialization
    smart_ptr
    static_assert
    type_traits
    utility
  DEB_DEPENDS
    DEV mpi-default-dev
    LIB mpi-default-bin
  )
