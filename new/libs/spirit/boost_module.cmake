# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Spirit
  AUTHORS
    "Joel de Guzman <joel -at- boost-consulting.com>"
    "Hartmut Kaiser <hartmut.kaiser -at- gmail.com>"
    "Dan Nuffer"
  DESCRIPTION
    "LL parser framework represents parsers directly as EBNF grammars in inlined C++."
  DEPENDS
    algorithm
    array
    concept_check
    config
    conversion
    core
    detail
    exception
    foreach
    function
    function_types
    fusion
    integer
    io
    iostreams
    iterator
    math
    mpl
    optional
    phoenix
    pool
    preprocessor
    proto
    range
    regex
    serialization
    smart_ptr
    static_assert
    thread
    type_traits
    typeof
    unordered
    utility
    variant
  INCLUDE_DIRECTORIES
    include
  )
