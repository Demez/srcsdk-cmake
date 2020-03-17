project(lzma)

ucm_add_files(
	"${SRC_DIR}/utils/lzma/C/LzmaEnc.c"
	"${SRC_DIR}/utils/lzma/C/LzmaDec.c"
	"${SRC_DIR}/utils/lzma/C/LzFind.c"
TO LZMA_SOURCES)

include("lib")
target_compile_definitions(lzma PUBLIC _7ZIP_ST _LZMA_PROB32)
