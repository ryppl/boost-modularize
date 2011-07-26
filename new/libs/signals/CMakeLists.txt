# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    any
    config
    core
    function
    iterator
    mpl
    optional
    smart_ptr
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

if(MSVC)
  add_definitions(
    /wd4251 # class needs to have dll-interface to be used by clients
    /wd4275 # 'boost::noncopyable' used as base for dll-interface class 
    )
endif(MSVC)

boost_add_headers(
  include/boost/signals
  include/boost/signals.hpp
  include/boost/signal.hpp
  include/boost/last_value.hpp
  )

boost_add_library(signals NO_SYMBOL
  src/trackable.cpp
  src/connection.cpp
  src/named_slot_map.cpp
  src/signal_base.cpp
  src/slot.cpp
  )
