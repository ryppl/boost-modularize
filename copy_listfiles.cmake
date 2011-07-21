file(COPY "${CMAKE_CURRENT_LIST_DIR}/../boost/"
  DESTINATION "${CMAKE_CURRENT_LIST_DIR}/new"
  FILES_MATCHING
    PATTERN ".git"                 EXCLUDE
    PATTERN "boost/build"          EXCLUDE # binary dir
    PATTERN "boost/tools/cmake"    EXCLUDE # has its own listfiles
    PATTERN "boost/CMakeLists.txt" EXCLUDE
    PATTERN "CMakeLists.txt"
  )
