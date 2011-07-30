# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Exception
  AUTHORS
    "Emil Dotchevski <emil -at- revergestudios.com>"
  DESCRIPTION
    "A library for transporting of arbitrary data in exception objects, and"
    "transporting of exceptions between threads."
  DEPENDS
    config
    detail
    smart_ptr
    tuple
    units
    utility
  INCLUDE_DIRECTORIES
    include
  )
