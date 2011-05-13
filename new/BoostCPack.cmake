##########################################################################
# Copyright (C) 2007-2008 Douglas Gregor <doug.gregor@gmail.com>         #
# Copyright (C) 2007-2009 Troy Straszheim <troy@resophonic.com>          #
# Copyright (C) 2010-2011 Daniel Pfeifer <daniel@pfeifer-mail.de>        #
#                                                                        #
# Distributed under the Boost Software License, Version 1.0.             #
# See accompanying file LICENSE_1_0.txt or copy at                       #
#   http://www.boost.org/LICENSE_1_0.txt                                 #
##########################################################################

set(CPACK_PACKAGE_NAME "Boost")
set(CPACK_PACKAGE_VENDOR "http://www.boost.org")
set(CPACK_PACKAGE_CONTACT "Daniel Pfeifer <daniel@pfeifer-mail.de>")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Boost ${Boost_VERSION}")
set(CPACK_PACKAGE_FILE_NAME "Boost-${Boost_VERSION}-${CMAKE_SYSTEM_NAME}-${BOOST_TOOLSET}")

set(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_SOURCE_DIR}/README.txt")
set(CPACK_RESOURCE_FILE_README "${CMAKE_SOURCE_DIR}/README.txt")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/LICENSE_1_0.txt")

if(EXISTS "${CMAKE_SOURCE_DIR}/Welcome.txt")
  set(CPACK_RESOURCE_FILE_WELCOME "${CMAKE_SOURCE_DIR}/Welcome.txt")
endif()

set(CPACK_PACKAGE_VERSION_MAJOR "${Boost_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${Boost_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${Boost_VERSION_PATCH}")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "Boost")

set(CPACK_NSIS_INSTALLED_ICON_NAME "Uninstall.exe")
set(CPACK_NSIS_DISPLAY_NAME "Boost ${Boost_VERSION}")
set(CPACK_NSIS_HELP_LINK "http:\\\\\\\\www.boost.org")
set(CPACK_NSIS_URL_INFO_ABOUT "http:\\\\\\\\www.boost.org")
set(CPACK_NSIS_CONTACT "boost-users@lists.boost.org")

# Encode the compiler name in the package 
if (MSVC60)
  set(CPACK_PACKAGE_FILE_NAME "Boost-${Boost_VERSION}-vc6")
  set(CPACK_NSIS_DISPLAY_NAME "${CPACK_NSIS_DISPLAY_NAME} for Microsoft Visual C++ 6")
elseif (MSVC70)
  set(CPACK_PACKAGE_FILE_NAME "Boost-${Boost_VERSION}-vc7")
  set(CPACK_NSIS_DISPLAY_NAME "${CPACK_NSIS_DISPLAY_NAME} for Microsoft Visual Studio 2002")
elseif (MSVC71)
  set(CPACK_PACKAGE_FILE_NAME "Boost-${Boost_VERSION}-vc71")
  set(CPACK_NSIS_DISPLAY_NAME "${CPACK_NSIS_DISPLAY_NAME} for Microsoft Visual Studio 2003")
elseif (MSVC80)
  set(CPACK_PACKAGE_FILE_NAME "Boost-${Boost_VERSION}-vc8")
  set(CPACK_NSIS_DISPLAY_NAME "${CPACK_NSIS_DISPLAY_NAME} for Microsoft Visual Studio 2005")    
elseif (MSVC90)
  set(CPACK_PACKAGE_FILE_NAME "Boost-${Boost_VERSION}-vc9")
  set(CPACK_NSIS_DISPLAY_NAME "${CPACK_NSIS_DISPLAY_NAME} for Microsoft Visual Studio 2008")
elseif (MSVC10)
  set(CPACK_PACKAGE_FILE_NAME "Boost-${Boost_VERSION}-vc10")
  set(CPACK_NSIS_DISPLAY_NAME "${CPACK_NSIS_DISPLAY_NAME} for Microsoft Visual Studio 2010")
elseif (BORLAND)
  set(CPACK_PACKAGE_FILE_NAME "Boost-${Boost_VERSION}-borland")  
  set(CPACK_NSIS_DISPLAY_NAME "${CPACK_NSIS_DISPLAY_NAME} for Borland C++ Builder")    
endif ()
