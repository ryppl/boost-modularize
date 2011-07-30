# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Tuple
  AUTHORS
    "Jaakko Jarvi <jarvi -at- cs.tamu.edu>"
  DESCRIPTION
    "Ease definition of functions returning multiple values, and more."
  DEPENDS
    config
    detail
    static_assert
    type_traits
    utility
  INCLUDE_DIRECTORIES
    include
  )
