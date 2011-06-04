# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS conversion graph mpi utility NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project("Graph Parallel"
  AUTHORS
    "Douglas Gregor <doug.gregor -at- gmail.com>"
    "Nicholas Edmonds <ngedmond -at- osl.iu.edu>"
    "Jeremiah Willcock <jewillco -at- osl.iu.edu>"
    "Andrew Lumsdaine"
  DESCRIPTION
    "Parallel support using MPI for Boost.Graph."
  DEPENDS
    mpi
    graph
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

if(MSVC)
  add_definitions(
    /wd4251 # class needs to have dll-interface to be used by clients
    /wd4275 # non dll-interface class used as base for dll-interface class
    /wd4800 # forcing value to bool 'true' or 'false' (performance warning)
    )
endif(MSVC)

find_package(MPI)
if(NOT MPI_FOUND)
  message(STATUS "Graph library does not contain MPI-based parallel components.")
  return()
endif()

include_directories(${MPI_INCLUDE_PATH})

if(BOOST_DEBIAN_PACKAGES)
  set(mpi_library openmpi)
else()
  set(mpi_library mpi)
endif()

boost_add_library(graph_parallel
  SOURCES
    src/mpi_process_group.cpp
    src/tag_allocator.cpp
  LINK_BOOST_LIBRARIES
    ${mpi_library}
  LINK_LIBRARIES
    ${MPI_LIBRARIES}
  # <define>BOOST_GRAPH_NO_LIB=1
  # <link>shared:<define>BOOST_GRAPH_DYN_LINK=1
  # <toolset>intel-vc71-win-9.1:<optimization>off
  # <toolset>msvc-7.1:<cxxflags>-GR-
  )
