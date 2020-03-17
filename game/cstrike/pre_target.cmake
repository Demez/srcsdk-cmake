ucm_remove_files(
	"${SRC_DIR}/game/client/cstrike/cs_achievements_and_stats_interface.cpp"
	"${SRC_DIR}/game/client/hud_chat.cpp"
	"${SRC_DIR}/game/client/death.cpp"
FROM CLIENT_SOURCES)

ucm_remove_files(
	"${SRC_DIR}/game/shared/playerclass_info_parse.cpp"
	"${SRC_DIR}/game/shared/weapon_parse_default.cpp"
FROM SHARED_SOURCES)

ucm_remove_files(
	"${SRC_DIR}/game/server/base_gameinterface.cpp"
FROM SERVER_SOURCES)

list(APPEND CLIENT_INCLUDE_DIRS 
  "${SRC_DIR}/game/client/cstrike/VGUI"
  "${SRC_DIR}/game/client/cstrike/buy_presets"
)
