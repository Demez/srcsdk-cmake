include_directories(
	"${SRC_DIR}/public/vgui"
	"${SRC_DIR}/public/vgui_controls"
	"${SRC_DIR}/public/VGuiMatSurface"
	"${SRC_DIR}/public/dme_controls"
	"${SRC_DIR}/public/matsys_controls"
)

add_subdirectory("vgui_controls")
add_subdirectory("matsys_controls")
add_subdirectory("dme_controls")
if(WIN32)
	add_subdirectory("vgui_surfacelib")
endif()