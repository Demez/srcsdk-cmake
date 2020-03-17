include_directories(
    "${SRC_DIR}/vinterface_wrapper"
    "${SRC_DIR}/vinterface_wrapper/shared"
    "${SRC_DIR}/common/GameUI"
)

add_subdirectory("vinterface_wrapper")
#add_subdirectory("first")
add_subdirectory("client")
add_subdirectory("gameui")
add_subdirectory("tierhook")
add_subdirectory("inputsystem")
add_subdirectory("main")

#add_subdirectory("vgui")