ucm_add_dirs("${SRC_DIR}/game/shared/deferred" TO SHARED_SOURCES NO_HEADERS RECURSIVE)
ucm_add_dirs("${SRC_DIR}/game/client/deferred" TO CLIENT_SOURCES NO_HEADERS RECURSIVE)
ucm_add_dirs("${SRC_DIR}/game/server/deferred" TO SERVER_SOURCES NO_HEADERS RECURSIVE)

list(APPEND SHARED_INCLUDE_DIRS "${SRC_DIR}/game/shared/deferred")
list(APPEND SERVER_INCLUDE_DIRS "${SRC_DIR}/game/server/deferred")
list(APPEND CLIENT_INCLUDE_DIRS "${SRC_DIR}/game/client/deferred")

list(APPEND SHARED_DEFINITIONS DEFERRED)
