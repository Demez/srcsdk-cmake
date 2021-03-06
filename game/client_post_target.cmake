include("dll")
add_dependencies(client ${SHARED_DEPENDENCIES} ${CLIENT_DEPENDENCIES})

target_link_libraries(client ${SHARED_LIBS} ${CLIENT_LIBS})
target_compile_definitions(client PUBLIC ${SHARED_DEFINITIONS} ${CLIENT_DEFINITIONS})
target_include_directories(client PUBLIC ${SHARED_INCLUDE_DIRS} ${CLIENT_INCLUDE_DIRS})
target_precompile_headers(client PRIVATE "${SRC_DIR}/game/client/cbase.h")
if(ANDROID)
	set_target_properties(client PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${GAME_DIR}/bin")
elseif(WIN32)
	set_target_properties(client PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${GAME_DIR}/${GAME_NAME}/bin")
else()
	set_target_properties(client PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${GAME_DIR}/${GAME_NAME}/bin")
endif()

if(NOT ANDROID)
	set_target_properties(client PROPERTIES PREFIX "")
	set_target_properties(client PROPERTIES OUTPUT_NAME client)
else()
	set_target_properties(client PROPERTIES OUTPUT_NAME client_original)
endif()

target_link_libraries(client steam_api)

if(LINUX OR ANDROID)
	install(TARGETS client LIBRARY DESTINATION "bin")
else()
	install(TARGETS client RUNTIME DESTINATION "bin")
endif()
