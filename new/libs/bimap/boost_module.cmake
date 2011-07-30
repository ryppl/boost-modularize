# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Bimap
  AUTHORS
    "Matias Capeletto <matias.capeletto -at- gmail.com>"
  DESCRIPTION
    "Bidirectional map containers"
  DEPENDS
    concept_check
    config
    exception
    functional
    iterator
    lambda
    mpl
    multi_index
    preprocessor
    property_map
    serialization
    static_assert
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
