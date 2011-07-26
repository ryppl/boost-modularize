# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Graph
  AUTHORS
    "Jeremy Siek <jeremy.siek -at- gmail.com>"
    "Lie-Quan Lee"
    "Andrew Lumsdaine"
    "Douglas Gregor <doug.gregor -at- gmail.com>"
  DESCRIPTION
    "The BGL graph interface and graph components are generic,"
    "in the same sense as the the Standard Template Library (STL)."
  DEPENDS
    algorithm
    any
    array
    bind
    concept_check
    config
    conversion
    core
    detail
    disjoint_sets
    dynamic_bitset
    exception
    filesystem
    foreach
    function
    functional
    integer
    iterator
    math
    mpi
    mpl
    multi_index
    optional
    parameter
    property_map
    property_tree
    random
    range
    serialization
    smart_ptr
    spirit
    static_assert
    test
    tuple
    type_traits
    typeof
    unordered
    utility
    variant
    xpressive
  )
