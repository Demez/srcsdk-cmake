project(vgui_surfacelib)

ucm_add_dirs("${SRC_DIR}/vgui2/vgui_surfacelib" TO VGUI_SURFACELIB_SOURCES NO_HEADERS RECURSIVE)
if(NOT WIN32)
	ucm_remove_files(
		"${SRC_DIR}/vgui2/vgui_surfacelib/Win32Font.cpp"
		FROM VGUI_SURFACELIB_SOURCES
	)
endif()

include("lib")

target_include_directories(vgui_surfacelib PRIVATE
	"${SRC_DIR}/common/vgui_surfacelib"
)
