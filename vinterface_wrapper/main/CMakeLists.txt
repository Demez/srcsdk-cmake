project(main)

ucm_add_dirs("${SRC_DIR}/vinterface_wrapper/main" TO MAIN_SOURCES NO_HEADERS RECURSIVE)

include("dll")
add_dependencies(main vinterface_wrapper)
target_link_libraries(main vinterface_wrapper)
set_target_properties(main PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${GAME_DIR}/bin")