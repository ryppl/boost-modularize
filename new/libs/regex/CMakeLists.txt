# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    concept_check
    config
    core
    detail
    exception
    functional
    integer
    iterator
    mpl
    smart_ptr
    static_assert
    test
    timer
    type_traits
    utility
    xpressive
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Regex
  AUTHORS
    "John Maddock <john -at- johnmaddock.co.uk>"
  DESCRIPTION
    "A regular expression library"
  DEPENDS
    date_time
    thread
  )

if(MSVC)
  add_definitions(/wd4005) # 'BOOST_REGEX_SOURCE': macro redefinition
endif(MSVC)

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers_this_function_is_deprecated(${headers} PREFIX "!include!!")

find_package(ICU)
if(ICU_FOUND)
  add_definitions(-DBOOST_HAS_ICU=1)
endif()

# <toolset>gcc-cygwin:<link>static

boost_add_library(regex NO_SYMBOL
  SOURCES
    src/c_regex_traits.cpp
    src/cpp_regex_traits.cpp
    src/cregex.cpp
    src/fileiter.cpp
    src/icu.cpp
    src/instances.cpp
    src/posix_api.cpp
    src/regex.cpp
    src/regex_debug.cpp
    src/regex_raw_buffer.cpp
    src/regex_traits_defaults.cpp
    src/static_mutex.cpp
    src/w32_regex_traits.cpp
    src/wc_regex_traits.cpp
    src/wide_posix_api.cpp
    src/winstances.cpp 
    src/usinstances.cpp
  LINK_LIBRARIES
    ${ICU_LIBRARIES}
    ${ICU_I18N_LIBRARIES}
  )
