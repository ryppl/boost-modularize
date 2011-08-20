# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Locale
  DEPENDS
    config
    function
    integer
    iterator
    smart_ptr
    thread
    unordered
    utility
  DEB_DEPENDS
    DEV libicu-dev
    LIB libicu42
  INCLUDE_DIRECTORIES
    include
  )
