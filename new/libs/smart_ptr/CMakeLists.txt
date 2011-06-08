# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    core
    detail
    exception
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project("Smart Ptr"
  AUTHORS
    "Darin Adler"
    "Greg Colvin"
    "Beman Dawes <bdawes -at- acm.org>"
    "Peter Dimov <pdimov -at- mmltd.net>"
  DESCRIPTION
    "Five smart pointer class templates."
  DEPENDS
    config
    core
    detail
    exception
    type_traits
    utility
  )

boost_add_headers(
  include/boost/enable_shared_from_this.hpp
  include/boost/get_pointer.hpp
  include/boost/intrusive_ptr.hpp
  include/boost/make_shared.hpp
  include/boost/pointer_cast.hpp
  include/boost/pointer_to_other.hpp
  include/boost/scoped_array.hpp
  include/boost/scoped_ptr.hpp
  include/boost/shared_array.hpp
  include/boost/shared_ptr.hpp
  include/boost/smart_ptr
  include/boost/smart_ptr.hpp
  include/boost/weak_ptr.hpp
  )
