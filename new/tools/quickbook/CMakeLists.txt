# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    algorithm
    bind
    config
    conversion
    core
    filesystem
    foreach
    iostreams
    iterator
    preprocessor
    program_options
    range
    smart_ptr
    spirit
    tuple
    unordered
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

if(MSVC)
  add_definitions(-D_SCL_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS
    /wd4244 /wd4267 /wd4355 /wd4511 /wd4512 /wd4701 /wd4702 /wd4800)
endif()

boost_add_executable(quickbook
  SOURCES
    src/quickbook.cpp
    src/actions.cpp
    src/doc_info_actions.cpp
    src/actions_class.cpp
    src/utils.cpp
    src/input_path.cpp
    src/values.cpp
    src/id_generator.cpp
    src/post_process.cpp
    src/collector.cpp
    src/template_stack.cpp
    src/code_snippet.cpp
    src/markups.cpp
    src/syntax_highlight.cpp
    src/grammar.cpp
    src/main_grammar.cpp
    src/block_element_grammar.cpp
    src/phrase_element_grammar.cpp
    src/doc_info_grammar.cpp
  LINK_BOOST_LIBRARIES
    filesystem
    program_options
    system
  )

#boost_documentation(doc/quickbook.qbk
#  IMAGES
#    doc/html/images
#  )
