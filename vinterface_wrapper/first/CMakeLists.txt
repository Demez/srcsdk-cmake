project(first)

ucm_add_dirs("${SRC_DIR}/vinterface_wrapper/first" TO FIRST_SOURCES NO_HEADERS RECURSIVE)

include("dll")
set_target_properties(first PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${GAME_DIR}/bin")