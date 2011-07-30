# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module("Concept Check"
  AUTHORS
    "Jeremy Siek <jeremy.siek -at- gmail.com>"
  DESCRIPTION
    "Tools for generic programming."
  DEPENDS
    config
    detail
    iterator
    mpl
    parameter
    preprocessor
    type_traits
  INCLUDE_DIRECTORIES
    include
  )
