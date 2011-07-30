# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(Iostreams
  AUTHORS
    "Jonathan Turkanis <turkanis -at- coderage.com>"
  DESCRIPTION
    "Framework for defining streams, stream buffers and i/o filters"
  DEPENDS
    bind
    config
    core
    detail
    exception
    function
    integer
    mpl
    preprocessor
    random
    range
    regex
    smart_ptr
    static_assert
    type_traits
    utility
  DEB_DEPENDS
    DEV libbz2-dev zlib1g-dev
    LIB libbz2-1.0 zlib1g
  INCLUDE_DIRECTORIES
    include
  )
