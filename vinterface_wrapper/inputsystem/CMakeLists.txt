project(vinterface_inputsystem_wrap)

ucm_add_dirs("${SRC_DIR}/vinterface_wrapper/inputsystem" TO VINTERFACE_INPUTSYSTEM_WRAP_SOURCES NO_HEADERS RECURSIVE)

include("dll")
add_dependencies(vinterface_inputsystem_wrap vinterface_wrapper tier0 tier1 interfaces vstdlib)
target_link_libraries(vinterface_inputsystem_wrap vinterface_wrapper tier0 tier1 interfaces vstdlib)
set_target_properties(vinterface_inputsystem_wrap PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${GAME_DIR}/bin")
set_target_properties(vinterface_inputsystem_wrap PROPERTIES OUTPUT_NAME inputsystem)