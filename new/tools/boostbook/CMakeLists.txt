# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost NO_MODULE)
include("${Boost_DEV_FILE}")

include(BoostExtract)

add_subdirectory(doc)

if(WIN32)
  set(BOOSTBOOK_DIR "boostbook")
else(WIN32)
  set(BOOSTBOOK_DIR "share/boost/boostbook")
endif(WIN32)

set(BOOSTBOOK_DTD_DIR "${CMAKE_CURRENT_SOURCE_DIR}/dtd")
set(BOOSTBOOK_XSL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/xsl")

# Find the DocBook DTD (version 4.2)
find_path(DOCBOOK_DTD_DIR docbookx.dtd PATHS
  "/usr/share/xml/docbook/schema/dtd/4.2"
  "/opt/local/share/xml/docbook/4.2"
  )
if(NOT DOCBOOK_DTD_DIR)
  set(DOCBOOK_DTD_DIR "${CMAKE_CURRENT_BINARY_DIR}/docbook-dtd")
  boost_extract("${DOCBOOK_DTD_DIR}" DOWNLOAD
    http://www.oasis-open.org/docbook/xml/4.2/docbook-xml-4.2.zip
    73fe50dfe74ca631c1602f558ed8961f
    )
  set(install_docbook_dtd ON)
endif(NOT DOCBOOK_DTD_DIR)

# Find the DocBook XSL stylesheets
find_path(DOCBOOK_XSL_DIR html/html.xsl PATHS
  "/usr/share/xml/docbook/stylesheet/nwalsh"
  "/opt/local/share/xsl/docbook-xsl"
  )
if(NOT DOCBOOK_XSL_DIR)
  set(DOCBOOK_XSL_DIR "${CMAKE_CURRENT_BINARY_DIR}/docbook-xsl")
  boost_extract("${DOCBOOK_XSL_DIR}" DOWNLOAD
    http://sourceforge.net/projects/docbook/files/docbook-xsl/1.75.2/docbook-xsl-1.75.2.tar.bz2/download
    0c76a58a8e6cb5ab49f819e79917308f
    )
  set(install_docbook_xsl ON)
endif(NOT DOCBOOK_XSL_DIR)

set(catalog "${CMAKE_CURRENT_BINARY_DIR}/catalog.xml")
configure_file(catalog.xml.in "${catalog}")


if(WIN32)
  set(install_docbook_dtd ON)
  set(install_docbook_xsl ON)
endif(WIN32)

install(DIRECTORY dtd xsl
  DESTINATION "${BOOSTBOOK_DIR}"
  COMPONENT "${BOOST_RUNTIME_COMPONENT}"
  )
set(BOOSTBOOK_DTD_DIR "dtd")
set(BOOSTBOOK_XSL_DIR "xsl")

if(install_docbook_dtd)
  install(DIRECTORY "${DOCBOOK_DTD_DIR}/"
    DESTINATION "${BOOSTBOOK_DIR}/docbook-dtd"
    COMPONENT "${BOOST_RUNTIME_COMPONENT}"
    )
  set(DOCBOOK_DTD_DIR "docbook-dtd")
endif(install_docbook_dtd)

if(install_docbook_xsl)
  install(DIRECTORY "${DOCBOOK_XSL_DIR}/"
    DESTINATION "${BOOSTBOOK_DIR}/docbook-xsl"
    COMPONENT "${BOOST_RUNTIME_COMPONENT}"
    )
  set(DOCBOOK_XSL_DIR "docbook-xsl")
endif(install_docbook_xsl)

set(catalog "${CMAKE_CURRENT_BINARY_DIR}/install/catalog.xml")
configure_file(catalog.xml.in "${catalog}")

install(FILES "${catalog}"
  DESTINATION "${BOOSTBOOK_DIR}"
  COMPONENT "${BOOST_RUNTIME_COMPONENT}"
  )

file(WRITE ${BOOST_EXPORT_FILE}
  "set(BOOSTBOOK_CATALOG \"\${CMAKE_CURRENT_LIST_DIR}/../boostbook/catalog.xml\")\n"
  "set(BOOSTBOOK_XSL_DIR \"\${CMAKE_CURRENT_LIST_DIR}/../boostbook/xsl\")\n"
  )
