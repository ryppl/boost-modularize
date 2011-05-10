# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Signals
  AUTHORS
    "Douglas Gregor <doug.gregor -at- gmail.com>"
  DESCRIPTION
    "Managed signals & slots callback implementation."
  DEPENDS
    smart_ptr
    any
    intrusive
    bind
  )

if(MSVC)
  add_definitions(
    /wd4005 # 'BOOST_SIGNALS_SOURCE': macro redefinition
    /wd4251 # class needs to have dll-interface to be used by clients
    /wd4275 # 'boost::noncopyable' used as base for dll-interface class 
    )
endif(MSVC)

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/boost/*.?pp)
boost_add_headers(${headers})

boost_add_library(signals NO_SYMBOL
  src/trackable.cpp
  src/connection.cpp
  src/named_slot_map.cpp
  src/signal_base.cpp
  src/slot.cpp
  )
