target_compile_definitions(${PROJECT_NAME} PRIVATE 
	LIBNAME=${PROJECT_NAME}
	MEMOVERRIDE_MODULE=${PROJECT_NAME}
	_DLL_PREFIX
	PROJECTDIR="${SRC_DIR}/${PROJECT_NAME}"
)