# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    conversion
    core
    detail
    exception
    filesystem
    regex
    smart_ptr
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(bcp TOOL
  DEPENDS
    filesystem
    regex
  )

boost_add_executable(bcp
  SOURCES
    add_dependent_lib.cpp
    add_path.cpp
    bcp_imp.cpp
    copy_path.cpp
    file_types.cpp
    fileview.cpp
    main.cpp
    path_operations.cpp
    scan_cvs_path.cpp 
    licence_info.cpp
    scan_licence.cpp
    output_licence_info.cpp
  LINK_BOOST_LIBRARIES
    filesystem
    regex
  )
