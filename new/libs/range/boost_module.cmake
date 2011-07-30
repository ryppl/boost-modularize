# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Range
  AUTHORS
    "Thorsten Ottosen <nesotto -at- cs.auc.dk>"
  DESCRIPTION
    "A new infrastructure for generic algorithms that builds on top of the new iterator concepts."
  DEPENDS
    algorithm
    array
    concept_check
    config
    conversion
    detail
    iterator
    mpl
    preprocessor
    regex
    static_assert
    tuple
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
