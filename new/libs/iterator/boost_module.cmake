# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Iterator
  AUTHORS
    "David Abrahams <dave -at- boostpro.com>"
    "Jeremy Siek <jeremy.siek -at- gmail.com>"
    "Thomas Witt <witt - at - acm.org>"
  DESCRIPTION
    "A system of concepts which extend the C++ standard iterator requirements"
    "and a framework of components for building iterators based on these"
    "extended concepts and includes several useful iterator adaptors."
  DEPENDS
    concept_check
    config
    conversion
    core
    detail
    function_types
    mpl
    smart_ptr
    static_assert
    tuple
    type_traits
    utility
  TEST_DIRECTORIES
    test
  INCLUDE_DIRECTORIES
    include
  )
