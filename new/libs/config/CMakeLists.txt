# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS core filesystem regex test NO_MODULE)
include("${Boost_DEV_FILE}")

boost_project(Config
  AUTHORS
    "John Maddock <john -at- johnmaddock.co.uk>"
  DESCRIPTION
    "Helps Boost library developers adapt to compiler idiosyncrasies; not intended for library users."
  )

file(GLOB_RECURSE headers ${CMAKE_CURRENT_SOURCE_DIR}/include/*.?pp)
boost_add_headers(${headers} PREFIX "!include/boost!boost!")

#boost_documentation(doc/config.qbk
#  doc/configuring_boost.qbk
#  doc/macro_reference.qbk
#  doc/guidelines.qbk
#  doc/rationale.qbk
#  doc/acknowledgements.qbk
#  )
