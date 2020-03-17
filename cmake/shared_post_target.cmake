target_compile_definitions(${PROJECT_NAME} PRIVATE 
	_SHARED_LIB
)

add_dependencies(${PROJECT_NAME} tier1 tier0 vstdlib)
target_link_libraries(${PROJECT_NAME} tier1 tier0 vstdlib)
if(NOT ANDROID AND LINUX)
	target_link_libraries(${PROJECT_NAME} m dl pthread ldap rt util nsl)
endif()