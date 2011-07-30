# Copyright (C) 2011 Ravikiran Rajagopal <lists_ravi@lavabit.com>
# Copyright (C) 2011 Daniel Pfeifer <daniel@pfeifer-mail.de>
# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

function( boost_python_test_add name )
  cmake_parse_arguments( BPTEST_TARGET
    ""
    "MODULE"
    "SOURCES;PYSOURCES;EXECUTABLE"
    ${ARGN}
    )
  if ( BPTEST_TARGET_MODULE )
    set( target ${BPTEST_TARGET_MODULE} )
  else()
    set( target ${name}_ext )
  endif()
  if( NOT BPTEST_TARGET_SOURCES )
    set( BPTEST_TARGET_SOURCES ${name}.cpp )
  endif()
  if( NOT BPTEST_TARGET_EXECUTABLE )
    set( BPTEST_TARGET_EXECUTABLE ${name}.py )
  endif()
  #message( STATUS "${target}: ${BPTEST_TARGET_EXECUTABLE}, ${BPTEST_TARGET_SOURCES}" )
    
  add_library(${target} SHARED EXCLUDE_FROM_ALL ${BPTEST_TARGET_SOURCES})
  #target_link_libraries(${target} boost_python)
  boost_link_libraries(${target} python SHARED)
  set_property(TARGET ${target} APPEND PROPERTY
    COMPILE_DEFINITIONS "BOOST_ALL_DYN_LINK=1;BOOST_ALL_NO_LIB=1")
  set_target_properties(${target} PROPERTIES
    PREFIX ""
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
    FOLDER "${BOOST_CURRENT_NAME}"
    PROJECT_LABEL "${target} (python extension)"
    # VERSION "${Boost_VERSION}"
    )
  # To do: add dependencies to ${BPTEST_TARGET_PYSOURCES}

  set( bp_test_run_script "${CMAKE_CURRENT_SOURCE_DIR}/bp_test_run_script.cmake" )
  foreach( executable ${BPTEST_TARGET_EXECUTABLE} )
    set( test_run_args
      "-DPYSCRIPT=${CMAKE_CURRENT_SOURCE_DIR}/${executable}"
      "-DPYWD=${CMAKE_CURRENT_BINARY_DIR}"
      )
    add_custom_command(TARGET ${target} POST_BUILD
      COMMAND ${CMAKE_COMMAND} ${test_run_args} -P "${bp_test_run_script}"
      )
  endforeach()

  set(project_test "${BOOST_CURRENT}-test")
  if(NOT TARGET ${project_test})
    add_custom_target(${project_test})
    if(TARGET test)
      add_dependencies(test ${project_test})
    endif(TARGET test)
  endif(NOT TARGET ${project_test})
  add_dependencies(${project_test} ${target})
endfunction()

function( boost_python_link_test name )
  cmake_parse_arguments( BPTEST_TARGET
    ""
    "MODULE"
    "SOURCES"
    ${ARGN}
    )
  if ( BPTEST_TARGET_MODULE )
    set( target ${BPTEST_TARGET_MODULE} )
  else()
    set( target ${name}_ext )
  endif()
  if( NOT BPTEST_TARGET_SOURCES )
    set( BPTEST_TARGET_SOURCES ${name}.cpp )
  endif()
  add_library(${target} SHARED EXCLUDE_FROM_ALL ${BPTEST_TARGET_SOURCES})
  #target_link_libraries(${target} boost_python)
  boost_link_libraries(${target} python SHARED)
  set_property(TARGET ${target} APPEND PROPERTY
    COMPILE_DEFINITIONS "BOOST_ALL_DYN_LINK=1;BOOST_ALL_NO_LIB=1")
  set_target_properties(${target} PROPERTIES
    PREFIX ""
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
    FOLDER "${BOOST_CURRENT_NAME}"
    PROJECT_LABEL "${target} (python extension)"
    # VERSION "${Boost_VERSION}"
    )
  # To do: add dependencies to ${BPTEST_TARGET_PYSOURCES}
  
  set(project_test "${BOOST_CURRENT}-test")
  if(NOT TARGET ${project_test})
    add_custom_target(${project_test})
    if(TARGET test)
      add_dependencies(test ${project_test})
    endif(TARGET test)
  endif(NOT TARGET ${project_test})
  add_dependencies(${project_test} ${target})
endfunction()  

# TODO:
#boost_python_test_add( crossmod_exception
#  SOURCES crossmod_exception_a.cpp crossmod_exception_b.cpp
#)

boost_python_test_add( injected )
boost_python_test_add( properties )
boost_python_test_add( return_arg )
boost_python_test_add( staticmethod )
boost_python_test_add( shared_ptr )
boost_python_test_add( enable_shared_from_this )
boost_python_test_add( andreas_beyer )
boost_python_test_add( wrapper_held_type )

boost_python_test_add( polymorphism2_auto_ptr 
  EXECUTABLE polymorphism2_auto_ptr.py polymorphism2.py SOURCES polymorphism2_auto_ptr.cpp )

boost_python_test_add( polymorphism )
boost_python_test_add( polymorphism2 )

boost_python_test_add( auto_ptr )

boost_python_test_add( minimal )
boost_python_test_add( args )
boost_python_test_add( raw_ctor )
boost_python_test_add( numpy
  EXECUTABLE printer.py numeric_tests.py numarray_tests.py numpy.py
  SOURCES numpy.cpp )
boost_python_test_add( enum )
boost_python_test_add( exception_translator )
boost_python_test_add( pearu1 EXECUTABLE test_cltree.py SOURCES cltree.cpp MODULE cltree )

# TODO:
#boost_python_test_add( try : EXECUTABLE newtest.py SOURCES m1.cpp m2.cpp )

boost_python_test_add( const_argument )
boost_python_test_add( keywords MODULE keywords
  SOURCES keywords.cpp EXECUTABLE keywords_test.py )

boost_python_test_add( builtin_converters
  EXECUTABLE test_builtin_converters.py
  SOURCES test_builtin_converters.cpp )

 boost_python_test_add( test_pointer_adoption )
 boost_python_test_add( operators )
 boost_python_test_add( operators_wrapper )
 boost_python_test_add( callbacks )
 boost_python_test_add( defaults )

boost_python_test_add( object )
boost_python_test_add( class )
boost_python_test_add( list )
boost_python_test_add( long )
boost_python_test_add( dict )
boost_python_test_add( tuple )
boost_python_test_add( str )
boost_python_test_add( slice )

boost_python_test_add( virtual_functions )
boost_python_test_add( back_reference )
boost_python_test_add( implicit )
boost_python_test_add( data_members )

boost_python_test_add( ben_scott1 )

boost_python_test_add( bienstman1 )
boost_python_test_add( bienstman2 )
boost_python_test_add( bienstman3 )

# TODO
# A bug in the Win32 intel compilers causes compilation of one of our
# tests to take forever when debug symbols are enabled. This rule
# turns them off when added to the requirements section
boost_python_test_add( multi_arg_constructor )

# TODO
#boost_python_test_add( iterator
#  SOURCES iterator.cpp input_iterator.cpp )

boost_python_test_add( stl_iterator )

boost_python_test_add( extract )

# TODO
#boost_python_test_add( crossmod_opaque
#  SOURCES crossmod_opaque_a.cpp crossmod_opaque_b.cpp
#)

boost_python_test_add( opaque )
boost_python_test_add( voidptr )

boost_python_test_add( pickle1 )
boost_python_test_add( pickle2 )
boost_python_test_add( pickle3 )
boost_python_test_add( pickle4 )

boost_python_test_add( nested )

boost_python_test_add( docstring )
boost_python_test_add( pytype_function )

boost_python_test_add( vector_indexing_suite )

# TODO
# Turn off this test on HP CXX, as the test hangs when executing.
# Whenever the cause for the failure of the polymorphism test is found
# and fixed, this should be retested.

boost_python_test_add( pointer_vector )
      
boost_python_test_add( map_indexing_suite
  SOURCES map_indexing_suite.cpp int_map_indexing_suite.cpp a_map_indexing_suite.cpp )

# TODO
#[ run import_.cpp /boost/python//boost_python $(PY) : : import_.py ]

# if $(TEST_BIENSTMAN_NON_BUGS)
# {
#     bpl-test bienstman4 ;
#     bpl-test bienstman5 ;
# }

if( WIN32 )
  boost_python_test_add( calling_conventions )
  boost_python_test_add( calling_conventions_mf )
endif()

# # --- unit tests of library components ---

boost_python_link_test( indirect_traits_test LINK indirect_traits_test.cpp LINK_BOOST_LIBRARIES python )
boost_add_test( destroy_test RUN destroy_test.cpp LINK_BOOST_LIBRARIES python )
boost_add_test( pointer_type_id_test RUN pointer_type_id_test.cpp LINK_BOOST_LIBRARIES python )
boost_add_test( bases RUN bases.cpp LINK_BOOST_LIBRARIES python )
boost_add_test( if_else RUN if_else.cpp LINK_BOOST_LIBRARIES python )
boost_add_test( pointee RUN pointee.cpp LINK_BOOST_LIBRARIES python )
boost_add_test( result RUN result.cpp LINK_BOOST_LIBRARIES python )

boost_add_test( string_literal LINK string_literal.cpp LINK_BOOST_LIBRARIES python )
boost_python_link_test(borrowed borrowed.cpp)
boost_python_link_test(object_manager object_manager.cpp)
boost_python_link_test(copy_ctor_mutates_rhs copy_ctor_mutates_rhs.cpp)

boost_add_test( upcast RUN upcast.cpp LINK_BOOST_LIBRARIES python )
  
boost_python_link_test(select_holder)

# TODO
# [ run select_from_python_test.cpp ../src/converter/type_id.cpp 
#   :   
#   :
#   : <define>BOOST_PYTHON_STATIC_LIB
#     <use>$(PY)

# ]

boost_add_test(select_arg_to_python_test COMPILE select_arg_to_python_test.cpp)

boost_add_test(raw_pyobject_fail1 COMPILE FAIL raw_pyobject_fail1.cpp)
boost_add_test(raw_pyobject_fail2 COMPILE FAIL raw_pyobject_fail2.cpp)
boost_add_test(as_to_python_function COMPILE_FAIL as_to_python_function.cpp)
boost_add_test(object_fail1 COMPILE FAIL object_fail1.cpp)
