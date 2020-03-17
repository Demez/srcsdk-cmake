project(dmxloader)

ucm_add_dirs("${SRC_DIR}/dmxloader" TO DMXLOADER_SOURCES NO_HEADERS RECURSIVE)

include("lib")
add_dependencies(dmxloader tier2)
target_link_libraries(dmxloader tier2)
