# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Interprocess
  AUTHORS
    "Ion Gaztanaga <igaztanaga -at- gmail.com>"
  DESCRIPTION
    "Shared memory, memory mapped files, process-shared mutexes, condition"
    "variables, containers and allocators."
  DEPENDS
    config
    core
    date_time
    detail
    integer
    intrusive
    math
    move
    mpl
    preprocessor
    smart_ptr
    static_assert
    type_traits
    unordered
    utility
  INCLUDE_DIRECTORIES
    include
  )
