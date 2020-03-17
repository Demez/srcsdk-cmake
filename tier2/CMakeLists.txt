project(tier2)

ucm_add_dirs("${SRC_DIR}/tier2" TO TIER2_SOURCES NO_HEADERS RECURSIVE)
ucm_add_files("${SRC_DIR}/public/materialsystem/MaterialSystemUtil.cpp" TO TIER2_SOURCES)

include("lib")
