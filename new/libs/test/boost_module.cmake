# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Test
  AUTHORS
    "Gennadiy Rozental <gennadiy.rozental -at- gmail.com>"
  DESCRIPTION
    "Support for simple program testing, full unit testing, and for program execution monitoring."
  DEPENDS
    bind
    config
    conversion
    core
    detail
    exception
    io
    iterator
    mpl
    numeric
    optional
    preprocessor
    smart_ptr
    static_assert
    timer
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
