project(client)

set(CLIENT_DEPENDENCIES vtf bitmap matsys_controls vgui_controls)
set(CLIENT_LIBS ${CLIENT_DEPENDENCIES})

set(CLIENT_DEFINITIONS 
	CLIENT_DLL ENABLE_HTMLWINDOW NO_STRING_T
	MAPBASE_RPC DISCORD_RPC STEAM_RPC
	${GAME_NAME_UPPER}_CLIENT_DLL
)
set(CLIENT_INCLUDE_DIRS 
   "${SRC_DIR}/game/client"
   "${SRC_DIR}/game/client/game_controls"
   "${SRC_DIR}/game/client/mapbase"
   "${SRC_DIR}/game/client/${GAME_NAME}"
)

ucm_add_files(
	"${SRC_DIR}/common/compiledcaptionswap.cpp"
	"${SRC_DIR}/public/bone_accessor.cpp"
	"${SRC_DIR}/public/client_class.cpp"
	"${SRC_DIR}/public/crtmemdebug.cpp"
	"${SRC_DIR}/public/dt_recv.cpp"
	"${SRC_DIR}/public/dt_utlvector_recv.cpp"
	"${SRC_DIR}/public/jigglebones.cpp"
	"${SRC_DIR}/public/posedebugger.cpp"
	"${SRC_DIR}/public/renamed_recvtable_compat.cpp"
	"${SRC_DIR}/public/sentence.cpp"
	"${SRC_DIR}/public/vallocator.cpp"
	"${SRC_DIR}/public/closedcaptions.cpp"
	"${SRC_DIR}/public/tools/bonelist.cpp"
	"${SRC_DIR}/public/vgui_controls/vgui_controls.cpp"
TO CLIENT_SOURCES)

ucm_add_dirs("${SRC_DIR}/game/client" TO CLIENT_SOURCES NO_HEADERS)
ucm_add_dirs(
	"${SRC_DIR}/game/client/game_controls"
	"${SRC_DIR}/game/client/mapbase"
	"${SRC_DIR}/game/client/${GAME_NAME}"
TO CLIENT_SOURCES NO_HEADERS RECURSIVE)

ucm_remove_files(
	"${SRC_DIR}/game/client/vgui_textmessagepanel.cpp"
	"${SRC_DIR}/game/client/game_controls/basemodel_panel.cpp"
FROM CLIENT_SOURCES)
