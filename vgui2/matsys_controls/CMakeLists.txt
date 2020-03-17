project(matsys_controls)

ucm_add_dirs("${SRC_DIR}/vgui2/matsys_controls" TO MATSYS_CONTROLS_SOURCES NO_HEADERS RECURSIVE)

include("lib")
target_precompile_headers(matsys_controls PRIVATE "${SRC_DIR}/public/vgui_controls/pch_vgui_controls.h")
