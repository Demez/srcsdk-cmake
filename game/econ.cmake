ucm_add_dirs("${SRC_DIR}/game/shared/econ" TO SHARED_SOURCES NO_HEADERS RECURSIVE)
ucm_add_dirs("${SRC_DIR}/game/client/econ" TO CLIENT_SOURCES NO_HEADERS RECURSIVE)
ucm_add_dirs("${SRC_DIR}/game/server/econ" TO SERVER_SOURCES NO_HEADERS RECURSIVE)

list(APPEND SHARED_INCLUDE_DIRS "${SRC_DIR}/game/shared/econ")
list(APPEND SERVER_INCLUDE_DIRS "${SRC_DIR}/game/server/econ")
list(APPEND CLIENT_INCLUDE_DIRS "${SRC_DIR}/game/client/econ")

list(APPEND SHARED_DEFINITIONS USES_ECON_ITEMS)
