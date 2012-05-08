#!/usr/bin/env cmake -P
#
# Copyright (C) 2012 Daniel Pfeifer <daniel@pfeifer-mail.de>
#
# Distributed under the Boost Software License, Version 1.0.
# See accompanying file LICENSE_1_0.txt or copy at
#   http://www.boost.org/LICENSE_1_0.txt

# On Windows, symlinks are available since Vista, but they require the
# /Create Symbolic Link/ privilege, which only administrators have by default.
if(CMAKE_HOST_WIN32)
  set(test_file "${CMAKE_CURRENT_LIST_DIR}/symlinktest")
  file(TO_NATIVE_PATH "${CMAKE_CURRENT_LIST_FILE}" file)
  file(TO_NATIVE_PATH "${test_file}" target)
  execute_process(COMMAND cmd /C mklink "${target}" "${file}" OUTPUT_QUIET)
  if(EXISTS "${test_file}")
    set(MKLINK_WORKING TRUE)
  else()
    set(MKLINK_WORKING FALSE)
    message(STATUS "Symlinks are NOT supported.")
  endif()
endif(CMAKE_HOST_WIN32)

# Make a header file available from another path.
#
# This function creates symlinks where available. As a fallback it simply
# creates a file at the target position that `#include`s the appropriate header.
function(forward_header file target)
  get_filename_component(directory "${target}" PATH)
  file(MAKE_DIRECTORY "${directory}")
  if(NOT CMAKE_HOST_WIN32)
    execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink "${file}" "${target}")
  elseif(MKLINK_WORKING)
    file(TO_NATIVE_PATH "${target}" target)
    file(TO_NATIVE_PATH "${file}" file)
    execute_process(COMMAND cmd /C mklink "${target}" "${file}" OUTPUT_QUIET)
  else()
    file(WRITE "${target}" "#include \"${file}\"\n")
  endif()
endfunction(forward_header)


file(REMOVE_RECURSE boost)
file(GLOB_RECURSE headers "libs/*/include/boost/*.?pp")

foreach(file ${headers})
  string(REGEX REPLACE ".*//include//boost//" "" relative "${file}")
  forward_header("${file}" "${CMAKE_CURRENT_LIST_DIR}/boost/${relative}")
endforeach(file)
