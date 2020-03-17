project(tier1)

ucm_add_dirs("${SRC_DIR}/tier1" TO TIER1_SOURCES NO_HEADERS RECURSIVE)

if(LINUX OR ANDROID OR MINGW)
	ucm_remove_files(
		"${SRC_DIR}/tier1/processor_detect.cpp"
		FROM TIER1_SOURCES
	)
elseif(WIN32)
	ucm_remove_files(
		"${SRC_DIR}/tier1/processor_detect_linux.cpp"
		FROM TIER1_SOURCES
	)
endif()

include("lib")
add_dependencies(tier1 lzma)
target_link_libraries(tier1 lzma)

if(WIN32)
	target_link_libraries(tier1 rpcrt4)
endif()
