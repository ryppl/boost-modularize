# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Accumulators
  AUTHORS
    "Eric Niebler <eric -at- boost-consulting.com>"
  DESCRIPTION
    "A framework for incremental calculation, and a collection of statistical accumulators."
  DEPENDS
    array
    circular_buffer
    concept_check
    config
    core
    exception
    fusion
    iterator
    mpl
    numeric
    parameter
    preprocessor
    range
    tuple
    type_traits
    typeof
    utility
  DEB_DEPENDS
    DEV ghostscript
  )
