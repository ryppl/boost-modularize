if(NOT DEFINED BOOST_DIR)
  set(BOOST_DIR "${CMAKE_CURRENT_LIST_DIR}/../boost")
endif()

get_filename_component(boost ${BOOST_DIR} NAME)

file(COPY "${BOOST_DIR}/"
  DESTINATION "${CMAKE_CURRENT_LIST_DIR}/new"
  FILES_MATCHING
    PATTERN ".git"                    EXCLUDE
    PATTERN "${boost}/build"          EXCLUDE # binary dir
    PATTERN "${boost}/tools/cmake"    EXCLUDE # has its own listfiles
    PATTERN "${boost}/CMakeLists.txt" EXCLUDE
    PATTERN "CMakeLists.txt"
  )
