# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module("Program Options"
  AUTHORS
    "Vladimir Prus <ghost -at- cs.msu.su>"
  DESCRIPTION
    "Access to configuration data given on command line, in config files and other sources."
  DEPENDS
    any
    config
    conversion
    core
    detail
    exception
    function
    iterator
    smart_ptr
    static_assert
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
