project(dme_controls)

ucm_add_dirs("${SRC_DIR}/vgui2/dme_controls" TO DME_CONTROLS_SOURCES NO_HEADERS RECURSIVE)

include("lib")
target_precompile_headers(dme_controls PRIVATE "${SRC_DIR}/public/vgui_controls/pch_vgui_controls.h")
