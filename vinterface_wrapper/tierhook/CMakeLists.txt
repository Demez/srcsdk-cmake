project(tierhook)

ucm_add_dirs("${SRC_DIR}/vinterface_wrapper/tierhook" TO TIERHOOK_SOURCES NO_HEADERS RECURSIVE)
ucm_remove_files(
	"${SRC_DIR}/vinterface_wrapper/tierhook/tierhook.c"
FROM TIERHOOK_SOURCES)

include("dll")
add_dependencies(tierhook vinterface_wrapper tier0 tier1 interfaces vstdlib)
target_link_libraries(tierhook vinterface_wrapper tier0 tier1 interfaces vstdlib)
set_target_properties(tierhook PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${GAME_DIR}/bin")
set_target_properties(tierhook PROPERTIES OUTPUT_NAME tier0)