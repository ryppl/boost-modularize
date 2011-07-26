# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS config core NO_MODULE)
include("${Boost_DEV_FILE}")

boost_add_headers(
  include/boost/cstdint.hpp
  include/boost/integer
  include/boost/integer.hpp
  include/boost/integer_fwd.hpp
  include/boost/integer_traits.hpp
  )
