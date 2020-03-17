include("shared.cmake")
include("client_pre_target.cmake")
include("server_pre_target.cmake")

include("${GAME_NAME}/pre_target.cmake" OPTIONAL)

list(APPEND CLIENT_SOURCES ${SHARED_SOURCES})
list(APPEND SERVER_SOURCES ${SHARED_SOURCES})

ucm_remove_files(
	"${SRC_DIR}/game/shared/ModelSoundsCache.cpp"
FROM CLIENT_SOURCES)

set(PROJECT_NAME client)
set(PROJECT_NAME_UPPER CLIENT)
include("client_post_target.cmake")

set(PROJECT_NAME server)
set(PROJECT_NAME_UPPER SERVER)
include("server_post_target.cmake")

include("${GAME_NAME}/post_target.cmake" OPTIONAL)
