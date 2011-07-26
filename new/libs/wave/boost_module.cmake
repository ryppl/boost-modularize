# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Wave
  AUTHORS
    "Hartmut Kaiser <hartmut.kaiser -at- gmail.com>"
  DESCRIPTION
    "A standards-conformant and highly-configurable implementation of the mandated"
    "C99/C++ preprocessor functionality packed behind an easy to use iterator interface."
  DEPENDS
    concept_check
    config
    core
    detail
    exception
    filesystem
    integer
    iterator
    mpl
    multi_index
    pool
    preprocessor
    serialization
    smart_ptr
    spirit
    static_assert
    type_traits
    utility
  )
