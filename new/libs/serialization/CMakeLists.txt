# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    array
    config
    core
    detail
    exception
    function
    functional
    integer
    io
    iterator
    mpl
    optional
    preprocessor
    smart_ptr
    spirit
    static_assert
    timer
    type_traits
    utility
    uuid
    variant
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Serialization
  AUTHORS
    "<ramey -at- rrsd.com>"
  DESCRIPTION
    "Serialization for persistence and marshalling."
  DEPENDS
    spirit
    io
    bind # because we have a dependency on boost/mem_fn.hpp
    array
    variant
  )

if(MSVC)
  add_definitions(
    /Gy
    /wd4244 # converting 'std::streamsize' in 'size_t'
    /D_CRT_SECURE_NO_WARNINGS
    /D_SCL_SECURE_NO_WARNINGS
    )
endif(MSVC)

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers_this_function_is_deprecated(${headers} PREFIX "!include!!")

# if(GCC)
#   add_definitions(-fvisibility=hidden)
# endif(GCC)

boost_add_library(serialization NO_SYMBOL
  src/basic_archive
  src/basic_iarchive
  src/basic_iserializer
  src/basic_oarchive
  src/basic_oserializer
  src/basic_pointer_iserializer
  src/basic_pointer_oserializer
  src/basic_serializer_map
  src/basic_text_iprimitive
  src/basic_text_oprimitive
  src/basic_xml_archive
  src/binary_iarchive
  src/binary_oarchive
  src/extended_type_info
  src/extended_type_info_typeid
  src/extended_type_info_no_rtti
  src/polymorphic_iarchive
  src/polymorphic_oarchive
  src/stl_port
  src/text_iarchive
  src/text_oarchive
  src/void_cast
  src/archive_exception
  src/xml_grammar
  src/xml_iarchive
  src/xml_oarchive
  src/xml_archive_exception
  src/shared_ptr_helper
  )

boost_add_library(wserialization
  SOURCES
    src/basic_text_wiprimitive
    src/basic_text_woprimitive
    src/text_wiarchive
    src/text_woarchive
    src/utf8_codecvt_facet
    src/xml_wgrammar
    src/xml_wiarchive
    src/xml_woarchive
    src/codecvt_null
  LINK_BOOST_LIBRARIES
    serialization 
  )
