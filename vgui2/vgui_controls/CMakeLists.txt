project(vgui_controls)

ucm_add_dirs("${SRC_DIR}/vgui2/vgui_controls" TO VGUI_CONTROLS_SOURCES NO_HEADERS RECURSIVE)
ucm_add_files(
	"${SRC_DIR}/vgui2/src/vgui_key_translation.cpp"
TO VGUI_CONTROLS_SOURCES)

include("lib")
target_precompile_headers(vgui_controls PRIVATE "${SRC_DIR}/public/vgui_controls/pch_vgui_controls.h")
