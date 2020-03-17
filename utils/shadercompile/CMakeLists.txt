project(shadercompile)

ucm_add_dirs("${SRC_DIR}/utils/shadercompile" TO SHADERCOMPILE_SOURCES NO_HEADERS RECURSIVE)

include("dll")
target_include_directories(shadercompile PUBLIC "${SRC_DIR}/utils/shadercompile/include")
set_target_properties(shadercompile PROPERTIES OUTPUT_NAME shadercompile_dll)
if(WIN32)
	set_target_properties(shadercompile PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${GAME_DIR}/bin")
else()
	set_target_properties(shadercompile PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${GAME_DIR}/bin")
endif()