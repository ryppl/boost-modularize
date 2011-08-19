# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_add_test(assoc_cont_factory RUN
  test_assoc_cont_factory.cpp
  test_assoc_cont_fact_main.cpp
  )

boost_add_test(basic RUN
  test_basic.cpp
  test_basic_main.cpp
  )

boost_add_test(custom_factory RUN
  test_basic.cpp
  test_basic_main.cpp
  )

boost_add_test(init RUN
  test_init.cpp
  test_init_main.cpp
  )

boost_add_test(intermod_holder RUN
  SOURCES
    test_intermod_holder.cpp
    test_intermod_holder_main.cpp
  LINK_LIBRARIES
    intermod_holder_dll
  )

boost_add_test(multictor RUN
  test_multictor.cpp
  test_multictor_main.cpp
  )

boost_add_test(no_locking RUN
  test_no_locking.cpp
  test_no_locking_main.cpp
  )

boost_add_test(no_tracking RUN
  test_no_tracking.cpp
  test_no_tracking_main.cpp
  )

boost_add_test(set_factory RUN
  test_set_factory.cpp
  test_set_factory_main.cpp
  )

add_library(intermod_holder_dll SHARED
  intermod_holder_dll.cpp
  )
set_property(TARGET intermod_holder_dll APPEND PROPERTY
  COMPILE_DEFINITIONS "BOOST_FLYWEIGHT_TEST_INTERMOD_HOLDER_DLL_SOURCE=1"
  )
