# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module("Circular Buffer"
  AUTHORS
    "Jan Gaspar <jano_gaspar -at- yahoo.com>"
  DESCRIPTION
    "STL compliant container also known as ring or cyclic buffer."
  DEPENDS
    concept_check
    config
    core
    detail
    exception
    iterator
    static_assert
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
