cmake_minimum_required(VERSION 3.20)

project(stellabind NONE)

set(CMAKE_INSTALL_DATADIR "share" CACHE PATH "Install directory for data files")

file(GLOB_RECURSE STELLABIND_SOURCES LIST_DIRECTORIES false CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.sl")

# Bindings are source modules compiled with the importing program. They are
# deliberately not included in stellalib.a.
add_custom_target(stella_bindings SOURCES ${STELLABIND_SOURCES})

install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/src/"
        DESTINATION ${CMAKE_INSTALL_DATADIR}/stella/bind
        FILES_MATCHING PATTERN "*.sl")
