ucm_add_dirs("${SRC_DIR}/game/client/replay" TO CLIENT_SOURCES NO_HEADERS RECURSIVE)
ucm_add_dirs("${SRC_DIR}/game/server/replay" TO SERVER_SOURCES NO_HEADERS RECURSIVE)

list(APPEND SERVER_INCLUDE_DIRS "${SRC_DIR}/game/server/replay")
list(APPEND CLIENT_INCLUDE_DIRS "${SRC_DIR}/game/client/replay")

list(APPEND SHARED_DEFINITIONS REPLAY_ENABLED)
