# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS config detail mpl utility NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Tokenizer
  DEPENDS
    utility
  )

boost_add_headers(
  include/boost/token_functions.hpp
  include/boost/token_iterator.hpp
  include/boost/tokenizer.hpp
  )
