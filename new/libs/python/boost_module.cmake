# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Python
  AUTHORS
    "David Abrahams <dave -at- boostpro.com>"
  DESCRIPTION
    "A framework for interfacing Python and C++. It allows you to quickly and"
    "seamlessly expose C++ classes functions and objects to Python, and vice-versa,"
    "using no special tools -- just your C++ compiler."
  DEPENDS
    bind
    config
    conversion
    core
    detail
    foreach
    function
    iterator
    mpl
    numeric
    preprocessor
    smart_ptr
    static_assert
    tuple
    type_traits
    utility
  DEB_DEPENDS
    DEV python2.7-dev
    LIB libpython2.7
  )
