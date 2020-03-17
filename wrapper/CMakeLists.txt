project(wrapper)

ucm_add_dirs("${SRC_DIR}/wrapper" TO WRAPPER_SOURCES NO_HEADERS RECURSIVE)

include("dll")
set_target_properties(wrapper PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${GAME_DIR}/bin")