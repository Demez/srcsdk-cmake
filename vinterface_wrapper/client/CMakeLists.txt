project(vinterface_cdll_wrap)

ucm_add_dirs("${SRC_DIR}/vinterface_wrapper/client" TO VINTERFACE_CDLL_WRAP_SOURCES NO_HEADERS RECURSIVE)
ucm_remove_files(
    "${SRC_DIR}/vinterface_wrapper/client/touch_xash.cpp"
FROM VINTERFACE_CDLL_WRAP_SOURCES)

include("dll")
add_dependencies(vinterface_cdll_wrap vinterface_wrapper tier0 tier1 interfaces vstdlib)
target_link_libraries(vinterface_cdll_wrap vinterface_wrapper tier0 tier1 interfaces vstdlib)
set_target_properties(vinterface_cdll_wrap PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${GAME_DIR}/bin")
set_target_properties(vinterface_cdll_wrap PROPERTIES OUTPUT_NAME client)