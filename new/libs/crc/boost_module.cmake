# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(CRC
  AUTHORS
    "Daryle Walker <darylew -at- hotmail.com>"
  DESCRIPTION
    "The Boost CRC Library provides two implementations of CRC (cyclic"
    "redundancy code) computation objects and two implementations of CRC"
    "computation functions. The implementations are template-based."
  DEPENDS
    config
    core
    integer
  INCLUDE_DIRECTORIES
    include
  )
