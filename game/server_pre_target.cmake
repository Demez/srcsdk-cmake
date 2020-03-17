project(server)

set(SERVER_DEPENDENCIES)
set(SERVER_LIBS)

set(SERVER_DEFINITIONS 
	GAME_DLL SERVER_DLL
	${GAME_NAME_UPPER}_GAME_DLL ${GAME_NAME_UPPER}_SERVER_DLL
)
set(SERVER_INCLUDE_DIRS 
	"${SRC_DIR}/game/server"
	"${SRC_DIR}/game/server/mapbase"
	"${SRC_DIR}/game/server/${GAME_NAME}"
)

ucm_add_files(
	"${SRC_DIR}/public/dt_send.cpp"
	"${SRC_DIR}/public/dt_utlvector_send.cpp"
	"${SRC_DIR}/public/editor_sendcommand.cpp"
	"${SRC_DIR}/public/keyframe/keyframe.cpp"
	"${SRC_DIR}/public/map_utils.cpp"
	"${SRC_DIR}/public/registry.cpp"
	"${SRC_DIR}/public/server_class.cpp"
TO SERVER_SOURCES)

ucm_add_dirs("${SRC_DIR}/game/server" TO SERVER_SOURCES NO_HEADERS)
ucm_add_dirs(
	"${SRC_DIR}/game/server/mapbase" 
	"${SRC_DIR}/game/server/${GAME_NAME}"
TO SERVER_SOURCES NO_HEADERS RECURSIVE)

ucm_remove_files(
	"${SRC_DIR}/game/server/GameStats.cpp"
	"${SRC_DIR}/game/server/data_collector.cpp"
	"${SRC_DIR}/game/server/logic_mirror_movement.cpp"
FROM SERVER_SOURCES)
