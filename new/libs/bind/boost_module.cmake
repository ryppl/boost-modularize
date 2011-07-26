# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Bind
  AUTHORS
    "Peter Dimov <pdimov -at- mmltd.net>"
  DESCRIPTION
    "A generalization of the standard functions std::bind1st and std::bind2nd."
    "It supports arbitrary function objects, functions, function pointers, and"
    "member function pointers, and is able to bind any argument to a specific"
    "value or route input arguments into arbitrary positions."
  DEPENDS
    config
    core
    detail
    smart_ptr
    utility
  )
