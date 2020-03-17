include("base_project_pre_target")

ucm_add_target(NAME ${PROJECT_NAME} TYPE STATIC SOURCES "${${PROJECT_NAME_UPPER}_SOURCES}")

include("base_project_post_target")

if(LINUX OR ANDROID)
	target_compile_definitions(${PROJECT_NAME} PRIVATE 
		_DLL_EXT=.a
		_EXTERNAL_DLL_EXT=.a
	)
else()
	target_compile_definitions(${PROJECT_NAME} PRIVATE 
		_DLL_EXT=.lib
		_EXTERNAL_DLL_EXT=.lib
	)
endif()

target_compile_definitions(${PROJECT_NAME} PRIVATE _LIB ${PROJECT_NAME_UPPER}_STATIC_LIB ${PROJECT_NAME_UPPER}_LIB)
