include("base_project_pre_target")
include("shared_pre_target")

ucm_add_target(NAME ${PROJECT_NAME} TYPE SHARED SOURCES "${${PROJECT_NAME_UPPER}_SOURCES}")

include("base_project_post_target")
include("shared_post_target")

if(LINUX OR ANDROID)
	target_compile_definitions(${PROJECT_NAME} PRIVATE 
		_DLL_EXT=.so
		_EXTERNAL_DLL_EXT=.so
	)
else()
	target_compile_definitions(${PROJECT_NAME} PRIVATE 
		_USRDLL _WINDLL
		_DLL_EXT=.dll
		_EXTERNAL_DLL_EXT=.dll
	)
endif()
