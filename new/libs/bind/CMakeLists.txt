# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS config core detail smart_ptr utility NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Bind
  AUTHORS
    "Peter Dimov <pdimov -at- mmltd.net>"
  DESCRIPTION
    "A generalization of the standard functions std::bind1st and std::bind2nd."
    "It supports arbitrary function objects, functions, function pointers, and"
    "member function pointers, and is able to bind any argument to a specific"
    "value or route input arguments into arbitrary positions."
  DEPENDS
    utility
    mpl
    detail
    config
  )

boost_add_headers(
  include/boost/bind
  include/boost/bind.hpp
  include/boost/is_placeholder.hpp
  include/boost/mem_fn.hpp
  )

boost_documentation(doc/ref.xml)
