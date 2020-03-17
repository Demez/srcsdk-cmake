set(SHARED_DEPENDENCIES raytrace lzma tier2 tier3 dmxloader mathlib choreoobjects particles bonesetup interfaces)
set(SHARED_LIBS ${SHARED_DEPENDENCIES})
if(LINUX AND NOT ANDROID)
	list(APPEND SHARED_LIBS m dl pthread ldap rt util nsl)
endif()

set(SHARED_INCLUDE_DIRS 
	"${SRC_DIR}/public/choreoobjects"
	"${SRC_DIR}/public/bonesetup"
	"${SRC_DIR}/game/shared"
	"${SRC_DIR}/game/shared/mapbase"
	"${SRC_DIR}/game/shared/${GAME_NAME}"
)

set(SHARED_DEFINITIONS 
	${GAME_NAME_UPPER}_DLL
	${GAME_NAME_UPPER}_SHARED_DLL
)

ucm_add_files(
	"${SRC_DIR}/common/language.cpp"
	"${SRC_DIR}/common/randoverride.cpp"
	"${SRC_DIR}/public/collisionutils.cpp"
	"${SRC_DIR}/public/dt_utlvector_common.cpp"
	"${SRC_DIR}/public/filesystem_helpers.cpp"
	"${SRC_DIR}/public/interpolatortypes.cpp"
	"${SRC_DIR}/public/networkvar.cpp"
	"${SRC_DIR}/public/rope_physics.cpp"
	"${SRC_DIR}/public/scratchpad3d.cpp"
	"${SRC_DIR}/public/ScratchPadUtils.cpp"
	"${SRC_DIR}/public/simple_physics.cpp"
	"${SRC_DIR}/public/SoundParametersInternal.cpp"
	"${SRC_DIR}/public/stringregistry.cpp"
	"${SRC_DIR}/public/studio.cpp"
TO SHARED_SOURCES)

ucm_add_dirs("${SRC_DIR}/game/shared" TO SHARED_SOURCES NO_HEADERS)
ucm_add_dirs(
	"${SRC_DIR}/game/shared/mapbase" 
	"${SRC_DIR}/game/shared/${GAME_NAME}"
TO SHARED_SOURCES NO_HEADERS RECURSIVE)

ucm_remove_files(
	"${SRC_DIR}/game/shared/SharedFunctorUtils.cpp"
	"${SRC_DIR}/game/shared/env_meteor_shared.cpp"
	"${SRC_DIR}/game/shared/debugoverlay_null.cpp"
FROM SHARED_SOURCES)
