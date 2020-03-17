project(srcsdk)

cmake_minimum_required(VERSION 3.16.2)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include("ucm")

set(SRC_DIR "${CMAKE_SOURCE_DIR}/../src")
set(GAME_DIR "${CMAKE_SOURCE_DIR}/../game")
string(TOUPPER ${GAME_NAME} GAME_NAME_UPPER)

add_compile_definitions(
	VPROF_LEVEL=1 RAD_TELEMETRY_DISABLED
	VPC BINK_VIDEO AVI_VIDEO WMV_VIDEO FRAME_POINTER_OMISSION_DISABLED
	SOURCE1=1 CROSS_PLATFORM_VERSION=0 THREAD_MUTEX_TRACING_ENABLED
	VERSION_SAFE_STEAM_API_INTERFACES
	#PROTECTED_THINGS_ENABLE
	DISABLE_PROTECTED_THINGS
	DISABLE_PROTECTED_STRINGS
	#sprintf=use_Q_snprintf_instead_of_sprintf
	#_snprintf=use_Q_snprintf_instead
	#strncpy=use_Q_strncpy_instead
	#fopen=dont_use_fopen
	VPCGAME=${GAME_NAME} VPCGAMECAPS=${GAME_NAME_UPPER}
	$<$<CONFIG:Debug>:DEV_BUILD>
	$<$<CONFIG:Debug>:DEVELOPMENT_ONLY>
	$<$<CONFIG:Debug>:DEBUG>
	$<$<CONFIG:Debug>:_DEBUG>
	$<$<CONFIG:Release>:NDEBUG>
	$<$<CONFIG:Release>:_NDEBUG>
	NO_STEAM
)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

ucm_set_runtime(STATIC)

if(LINUX OR ANDROID OR MINGW)
	add_compile_definitions(
		_POSIX POSIX
		GNUC
	)

	if(NOT ANDROID)
		ucm_add_flags(
			-march=native -mtune=native
		)
		if(32_BITS)
			ucm_add_flags(
				-m32 -msse4.2 -mfpmath=sse
			)
		endif()
	endif()

	ucm_add_flags(
		-ffast-math -ftree-vectorize -funswitch-loops
		-w -fpermissive -fno-strict-aliasing -fno-omit-frame-pointer
		-Wall -Wno-multichar -Wno-narrowing -Wno-write-strings -Wno-unused-variable
		-Wno-unused-but-set-variable -Wno-unused-function -Wno-unused-local-typedefs
		-Wno-unused-result -Wno-unknown-pragmas -Wno-unused-parameter -Wno-unused-value
		-Wno-missing-field-initializers -Wno-sign-compare -Wno-float-equal
		-Werror=return-type -Wno-attributes -fdiagnostics-show-option
		-Wformat -Wformat-security -Wfatal-errors
	)

	ucm_add_flags(CXX
		-Wno-register -Wno-reorder -Wno-invalid-offsetof
		-Wno-overloaded-virtual
	)
endif()

if(LINUX OR ANDROID)
	add_compile_definitions(
		_LINUX LINUX
		USE_SDL GL_GLEXT_PROTOTYPES DX_TO_GL_ABSTRACTION
		NO_HOOK_MALLOC NO_MALLOC_OVERRIDE
	)

	if(ANDROID)
		add_compile_definitions(
			COMPILER_CLANG
		)
	else()
		if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
			add_compile_definitions(
				COMPILER_CLANG
			)
		elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
			add_compile_definitions(
				COMPILER_GCC
			)
		endif()
	endif()
else()
	add_compile_definitions(
		VECTOR _WINDOWS WINDOWS _CRT_SECURE_NO_DEPRECATE
		_CRT_SECURE_NO_WARNINGS _CRT_NONSTDC_NO_DEPRECATE
		_CRT_NONSTDC_NO_WARNINGS _SCL_SECURE_NO_WARNINGS
		_SILENCE_ALL_CXX17_DEPRECATION_WARNINGS STRICT
		WINDOWS_IGNORE_PACKING_MISMATCH _ALLOW_RUNTIME_LIBRARY_MISMATCH
		_ALLOW_ITERATOR_DEBUG_LEVEL_MISMATCH _ALLOW_MSC_VER_MISMATCH
		COMPILER_MSVC NOMINMAX USE_ACTUAL_DX _HAS_ITERATOR_DEBUGGING=0
		_MBCS _ALLOW_KEYWORD_MACROS
		COMPILER_MSVC32
		WIN32 _WIN32
	)

	if(MINGW)
		add_compile_definitions(
			COMPILER_GCC
		)
	endif()
endif()

if(ANDROID)
	set(TARGET_ENGINE sdk2013sp)
endif()

string(TOUPPER ${TARGET_ENGINE} TARGET_ENGINE_UPPER)

include_directories(
	"${SRC_DIR}"
	"${SRC_DIR}/common"
	"${SRC_DIR}/public"
	"${SRC_DIR}/public/mathlib"
	"${SRC_DIR}/public/tier0"
	"${SRC_DIR}/public/tier1"
	"${SRC_DIR}/public/tier2"
	"${SRC_DIR}/public/tier3"
	"${SRC_DIR}/public/vstdlib"
	"${SRC_DIR}/utils"
	"${SRC_DIR}/utils/common"
	"${SRC_DIR}/thirdparty"
	"${SRC_DIR}/public/enginecompat"
	"${SRC_DIR}/public/enginecompat/${TARGET_ENGINE}"
)

add_compile_definitions(
	TARGET_ENGINE_SDK2013SP=0
	TARGET_ENGINE_SDK2013MP=1
	TARGET_ENGINE_TF2=2
	TARGET_ENGINE_CSTRIKE=3
	TARGET_ENGINE_DODS=4
	TARGET_ENGINE_L4D2=5
	TARGET_ENGINE_L4D1=6
	TARGET_ENGINE_PORTAL1=7
	TARGET_ENGINE_PORTAL2=8
	TARGET_ENGINE_CSGO=9
	TARGET_ENGINE_GMOD=10

	TARGET_ENGINE=TARGET_ENGINE_${TARGET_ENGINE_UPPER}
)

include("engine_features")

set(BASE_PUBLIC_LIB_DIR "${SRC_DIR}/lib/${TARGET_ENGINE}/public")
set(BASE_COMMON_LIB_DIR "${SRC_DIR}/lib/${TARGET_ENGINE}/common")

if(ANDROID)
	set(PUBLIC_LIB_DIR "${BASE_PUBLIC_LIB_DIR}/android")
	set(COMMON_LIB_DIR "${BASE_COMMON_LIB_DIR}/android")
elseif(LINUX)
	if(32_BITS)
		set(PUBLIC_LIB_DIR "${BASE_PUBLIC_LIB_DIR}/linux32")
		set(COMMON_LIB_DIR "${BASE_COMMON_LIB_DIR}/linux32")
	elseif(64_BITS)
		set(PUBLIC_LIB_DIR "${BASE_PUBLIC_LIB_DIR}/linux64")
		set(COMMON_LIB_DIR "${BASE_COMMON_LIB_DIR}/linux64")
	endif()
else()
	set(PUBLIC_LIB_DIR "${BASE_PUBLIC_LIB_DIR}")
	set(COMMON_LIB_DIR "${BASE_COMMON_LIB_DIR}")
endif()

add_library(steam_api SHARED IMPORTED)
add_library(tier0 SHARED IMPORTED)
add_library(vstdlib SHARED IMPORTED)

if(LINUX OR ANDROID)
	set_target_properties(steam_api PROPERTIES
		IMPORTED_LOCATION "${PUBLIC_LIB_DIR}/libsteam_api.so"
		IMPORTED_SONAME "libsteam_api.so"
	)

	set_target_properties(tier0 PROPERTIES
		IMPORTED_LOCATION "${PUBLIC_LIB_DIR}/libtier0.so"
		IMPORTED_SONAME "libtier0.so"
	)

	set_target_properties(vstdlib PROPERTIES
		IMPORTED_LOCATION "${PUBLIC_LIB_DIR}/libvstdlib.so"
		IMPORTED_SONAME "libvstdlib.so"
	)
elseif(WIN32)
	set_target_properties(steam_api PROPERTIES
		IMPORTED_IMPLIB "${PUBLIC_LIB_DIR}/steam_api.lib"
	)

	set_target_properties(tier0 PROPERTIES
		IMPORTED_IMPLIB "${PUBLIC_LIB_DIR}/tier0.lib"
	)

	set_target_properties(vstdlib PROPERTIES
		IMPORTED_IMPLIB "${PUBLIC_LIB_DIR}/vstdlib.lib"
	)
endif()

if(ANDROID)
	link_libraries(log)
endif()

add_subdirectory("interfaces")
add_subdirectory("mathlib")
add_subdirectory("utils")
add_subdirectory("tier1")
add_subdirectory("tier2")
add_subdirectory("tier3")
add_subdirectory("datamodel")
add_subdirectory("dmxloader")
add_subdirectory("dmserializers")
add_subdirectory("movieobjects")
add_subdirectory("bonesetup")
add_subdirectory("choreoobjects")
add_subdirectory("vtf")
add_subdirectory("bitmap")
add_subdirectory("raytrace")
add_subdirectory("fgdlib")
add_subdirectory("particles")
add_subdirectory("appframework")
add_subdirectory("vgui2")
add_subdirectory("game")
if(ANDROID)
	add_subdirectory("vinterface_wrapper")
	#add_subdirectory("wrapper")
endif()


#add_subdirectory("materialsystem")
#add_subdirectory("tools")
