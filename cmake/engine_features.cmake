if(TARGET_ENGINE STREQUAL "sdk2013sp" OR
	TARGET_ENGINE STREQUAL "sdk2013mp" OR
	TARGET_ENGINE STREQUAL "tf2" OR
	TARGET_ENGINE STREQUAL "gmod")
	add_compile_definitions(
		ENGINE_SDK2013_LIKE
	)
elseif(TARGET_ENGINE STREQUAL "portal2" OR
		TARGET_ENGINE STREQUAL "l4d2" OR
		TARGET_ENGINE STREQUAL "csgo")
	add_compile_definitions(
		ENGINE_ASW_LIKE
	)
endif()

if(TARGET_ENGINE STREQUAL "portal2" OR
	TARGET_ENGINE STREQUAL "l4d2")
	add_compile_definitions(
		ENGINE_PAINT_SUPPORTED
	)
endif()

if(TARGET_ENGINE STREQUAL "tf2" OR
	TARGET_ENGINE STREQUAL "sdk2013mp" OR
	TARGET_ENGINE STREQUAL "gmod")
	add_compile_definitions(
		ENGINE_TEXTURE_STREAMING_SUPPORTED
	)
endif()

add_compile_definitions(ENGINE_REPLAY_SUPPORTED)

if(TARGET_ENGINE STREQUAL "portal2")
	add_compile_definitions(
		ENGINE_PAINT_ENABLED
	)
endif()

if(TARGET_ENGINE STREQUAL "tf2")
	add_compile_definitions(
		ENGINE_TEXTURE_STREAMING_ENABLED
		ENGINE_REPLAY_ENABLED
	)
endif()