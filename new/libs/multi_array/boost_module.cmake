# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module("Multi Array"
  DEPENDS
    array
    concept_check
    config
    core
    functional
    iterator
    mpl
    static_assert
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
