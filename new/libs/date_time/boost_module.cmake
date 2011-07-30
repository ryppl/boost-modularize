# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module("Date Time"
  AUTHORS
    "Jeff Garland <jeff -at- crystalclearsoftware.com>"
  DESCRIPTION
    "A set of date-time libraries based on generic programming concepts."
  DEPENDS
    algorithm
    config
    conversion
    core
    detail
    exception
    integer
    io
    mpl
    range
    serialization
    smart_ptr
    tokenizer
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
