# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Algorithm
  AUTHORS
    "Pavol Droba <droba -at- topmail.sk>"
    "Herve Bronnimann <hbr -at- poly.edu>"
  DESCRIPTION
    "A library of various algorithms."
  DEPENDS
    concept_check
    config
    detail
    function
    iterator
    mpl
    range
    regex
    tuple
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
