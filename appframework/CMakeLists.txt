project(appframework)

ucm_add_dirs("${SRC_DIR}/appframework" TO APPFRAMEWORK_SOURCES NO_HEADERS RECURSIVE)

if(NOT WIN32)
	ucm_remove_files(
		"${SRC_DIR}/appframework/WinApp.cpp"
		"${SRC_DIR}/appframework/VguiMatSysApp.cpp"
	FROM APPFRAMEWORK_SOURCES)
else()
	ucm_remove_files(
		"${SRC_DIR}/appframework/linuxapp.cpp"
	FROM APPFRAMEWORK_SOURCES)
endif()

include("lib")
