project(movieobjects)

ucm_add_dirs("${SRC_DIR}/movieobjects" TO MOVIEOBJECTS_SOURCES NO_HEADERS RECURSIVE)
ucm_remove_files("${SRC_DIR}/movieobjects/dmetestmesh.cpp" FROM MOVIEOBJECTS_SOURCES)
	
include("lib")
