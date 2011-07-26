# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Xpressive
  AUTHORS
    "Eric Niebler <eric -at- boost-consulting.com>"
  DESCRIPTION
    "Regular expressions that can be written as strings or as expression templates,"
    "and which can refer to each other and themselves recursively with the power of"
    "context-free grammars."
  DEPENDS
    config
    conversion
    core
    detail
    exception
    fusion
    integer
    iterator
    mpl
    numeric
    optional
    preprocessor
    proto
    range
    smart_ptr
    spirit
    type_traits
    typeof
    utility
  )
