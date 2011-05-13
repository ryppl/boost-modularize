# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost 1.45 NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Thread
  DEPENDS
    date_time
    bind
    optional
    range
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

find_package(Threads REQUIRED)

if(CMAKE_USE_WIN32_THREADS_INIT)
  set(sources
    ${CMAKE_CURRENT_SOURCE_DIR}/src/win32/thread.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/win32/tss_dll.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/win32/tss_pe.cpp
    )
else()
  set(sources
    ${CMAKE_CURRENT_SOURCE_DIR}/src/pthread/thread.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/pthread/once.cpp
    )
endif()

set(shared_lib_dir ${CMAKE_CURRENT_BINARY_DIR}/shared_lib)
file(WRITE ${shared_lib_dir}/CMakeLists.txt
  "add_definitions(-DBOOST_THREAD_BUILD_DLL=1)\n"
  "boost_add_library(thread SHARED\n"
  "  SOURCES ${sources}\n"
  "  LINK_BOOST_LIBRARIES date_time\n"
  "  LINK_LIBRARIES ${CMAKE_THREAD_LIBS_INIT}\n"
  "  )\n"
  )
add_subdirectory(${shared_lib_dir} ${shared_lib_dir}-build)

set(static_lib_dir ${CMAKE_CURRENT_BINARY_DIR}/static_lib)
file(WRITE ${static_lib_dir}/CMakeLists.txt
  "add_definitions(-DBOOST_THREAD_BUILD_LIB=1)\n"
  "boost_add_library(thread STATIC\n"
  "  SOURCES ${sources}\n"
  "  LINK_BOOST_LIBRARIES date_time\n"
  "  LINK_LIBRARIES ${CMAKE_THREAD_LIBS_INIT}\n"
  "  )\n"
  )
add_subdirectory(${static_lib_dir} ${static_lib_dir}-build)
