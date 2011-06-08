# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    bind
    config
    conversion
    core
    detail
    foreach
    function
    graph
    integer
    iterator
    mpl
    numeric
    preprocessor
    property_map
    smart_ptr
    static_assert
    tuple
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Python
  AUTHORS
    "David Abrahams <dave -at- boostpro.com>"
  DESCRIPTION
    "A framework for interfacing Python and C++. It allows you to quickly and"
    "seamlessly expose C++ classes functions and objects to Python, and vice-versa,"
    "using no special tools -- just your C++ compiler."
  DEPENDS
    bind
    config
    conversion
    core
    detail
    foreach
    function
    iterator
    mpl
    numeric
    preprocessor
    smart_ptr
    static_assert
    tuple
    type_traits
    utility
  DEB_DEPENDS
    DEV python2.7-dev
    LIB libpython2.7
  )

boost_add_headers(
  include/boost/python
  include/boost/python.hpp
  )

find_package(PythonLibs)

if(NOT PYTHONLIBS_FOUND)
  return()
endif()

include_directories(${PYTHON_INCLUDE_DIRS})

set(sources
  src/numeric.cpp
  src/list.cpp
  src/long.cpp
  src/dict.cpp
  src/tuple.cpp
  src/str.cpp
  src/slice.cpp
  src/converter/from_python.cpp
  src/converter/registry.cpp
  src/converter/type_id.cpp
  src/object/enum.cpp
  src/object/class.cpp
  src/object/function.cpp
  src/object/inheritance.cpp
  src/object/life_support.cpp
  src/object/pickle_support.cpp
  src/errors.cpp
  src/module.cpp
  src/converter/builtin_converters.cpp
  src/converter/arg_to_python_base.cpp
  src/object/iterator.cpp
  src/object/stl_iterator.cpp
  src/object_protocol.cpp
  src/object_operators.cpp
  src/wrapper.cpp
  src/import.cpp
  src/exec.cpp
  src/object/function_doc_signature.cpp
  )

set(sources_string "")
foreach(file ${sources})
  set(sources_string "${sources_string}\n  ${CMAKE_CURRENT_SOURCE_DIR}/${file}")
endforeach(file)

set(shared_lib_dir ${CMAKE_CURRENT_BINARY_DIR}/shared_lib)
file(WRITE ${shared_lib_dir}/CMakeLists.txt
  "boost_add_library(python SHARED\n"
  "  SOURCES ${sources_string}\n"
  "  LINK_LIBRARIES ${PYTHON_LIBRARIES}\n"
  "  )\n"
  )
add_subdirectory(${shared_lib_dir} ${shared_lib_dir}-build)

set(static_lib_dir ${CMAKE_CURRENT_BINARY_DIR}/static_lib)
file(WRITE ${static_lib_dir}/CMakeLists.txt
  "add_definitions(-DBOOST_PYTHON_STATIC_LIB=1)\n"
  "boost_add_library(python STATIC\n"
  "  SOURCES ${sources_string}\n"
  "  LINK_LIBRARIES ${PYTHON_LIBRARIES}\n"
  "  )\n"
  )
add_subdirectory(${static_lib_dir} ${static_lib_dir}-build)


# Some explanation why the code above does not (yet) simply look like this:

##
# boost_add_library(python
#   SOURCES
#     ...
#   LINK_LIBRARIES
#     ${PYTHON_LIBRARIES}
#  )
##

# Most Boost libraries use BOOST_<name>_DYN_LINK and BOOST_<name>_SOURCE do
# distinguish between importing and exporting as shown below.

##
# if defined(BOOST_ALL_DYN_LINK) || defined(BOOST_SYSTEM_DYN_LINK)
#   if defined(BOOST_SYSTEM_SOURCE)
#     define BOOST_SYSTEM_DECL BOOST_SYMBOL_EXPORT
#   else
#     define BOOST_SYSTEM_DECL BOOST_SYMBOL_IMPORT
#   endif
# else
#   define BOOST_SYSTEM_DECL
# endif
##

# Boost.Python currently is the only exception to this 'rule': It requires
# BOOST_PYTHON_STATIC_LIB to be defined for building a static library.
# To keep the boost_add_library command as simple as possible, I decided against
# adding parameters to set custom definitions. This does not make it impossible
# to use custom definitions, but it requires some hacks, as can be seen above.
