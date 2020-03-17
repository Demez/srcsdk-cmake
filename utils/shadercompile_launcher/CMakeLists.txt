project(shadercompile_launcher)

ucm_add_dirs("${SRC_DIR}/utils/shadercompile_launcher" TO SHADERCOMPILE_LAUNCHER_SOURCES NO_HEADERS RECURSIVE)

include("exe")
set_target_properties(shadercompile_launcher PROPERTIES OUTPUT_NAME shadercompile)
set_target_properties(shadercompile_launcher PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${GAME_DIR}/bin")
