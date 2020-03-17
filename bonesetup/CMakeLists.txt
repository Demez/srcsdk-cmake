project(bonesetup)

ucm_add_dirs("${SRC_DIR}/bonesetup" TO BONESETUP_SOURCES NO_HEADERS RECURSIVE)

include("lib")
add_dependencies(bonesetup tier1)
target_link_libraries(bonesetup tier1)
