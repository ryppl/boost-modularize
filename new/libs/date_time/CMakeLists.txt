# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    algorithm
    config
    conversion
    core
    detail
    exception
    integer
    io
    mpl
    range
    serialization
    smart_ptr
    tokenizer
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project("Date Time"
  AUTHORS
    "Jeff Garland <jeff -at- crystalclearsoftware.com>"
  DESCRIPTION
    "A set of date-time libraries based on generic programming concepts."
  DEPENDS
    algorithm
    bind
    io
    serialization
    smart_ptr
    tokenizer
  )

boost_add_headers(
  include/boost/date_time
  include/boost/date_time.hpp
  )

add_definitions(-DDATE_TIME_INLINE)

file(GLOB date_time_files boost/date_time/*.hpp)
file(GLOB gregorian_files boost/date_time/gregorian/*.hpp)
file(GLOB posix_time_files boost/date_time/posix_time/*.hpp)
file(GLOB local_time_files boost/date_time/local_time/*.hpp)

list(REMOVE_ITEM gregorian_files boost/date_time/gregorian/event_schedule.hpp)

boost_add_reference(date_time_autodoc ${date_time_files}
  DOXYGEN_PARAMETERS
    "ENABLE_PREPROCESSING = NO"
  XSLTPROC_PARAMETERS
    boost.doxygen.refid=date_time_reference
    boost.doxygen.reftitle="Date Time Reference"
  )

boost_add_reference(gregorian_autodoc ${gregorian_files}
  DOXYGEN_PARAMETERS
    "ENABLE_PREPROCESSING = NO"
  XSLTPROC_PARAMETERS
    boost.doxygen.refid=gregorian_reference
    boost.doxygen.reftitle="Gregorian Reference"
  )

boost_add_reference(posix_time_autodoc ${posix_time_files}
  DOXYGEN_PARAMETERS
    "ENABLE_PREPROCESSING = NO"
  XSLTPROC_PARAMETERS
    boost.doxygen.refid=posix_time_reference
    boost.doxygen.reftitle="Posix Time Reference"
  )

boost_add_reference(local_time_autodoc ${local_time_files}
  DOXYGEN_PARAMETERS
    "ENABLE_PREPROCESSING = NO"
  XSLTPROC_PARAMETERS
    boost.doxygen.refid=local_time_reference
    boost.doxygen.reftitle="Local Time Reference"
  )

file(GLOB date_time_xmldoc xmldoc/*.xml)
list(REMOVE_ITEM gregorian_files boost/date_time/gregorian/event_schedule.hpp)

boost_documentation(xmldoc/date_time.xml
  #<format>pdf:<xsl:param>boost.url.prefix=http://www.boost.org/doc/libs/release/doc/html
  date_time_autodoc.xml
  gregorian_autodoc.xml
  posix_time_autodoc.xml
  local_time_autodoc.xml
  #<xsl:param>boost.root=../../../..
  )

boost_add_library(date_time
  src/gregorian/greg_month.cpp
  src/gregorian/greg_weekday.cpp
  src/gregorian/date_generators.cpp
  )
