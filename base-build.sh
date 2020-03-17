function check_if_success
{
    if [ ! $? -eq 0 ]; then
        exit
    fi
}

if [[ "${build_type}" == "debug" ]]; then
    use_ccache=false
    use_ninja=false
    use_clang=true
else
    use_ccache=true
    use_ninja=true
    use_clang=false
fi

if [[ "${platform}" == "android" ]]; then
	arch=arm
    use_ccache=false
    use_clang=true
elif [[ "${platform}" == "windows" ]]; then
	use_clang=false
	use_ccache=false
fi

mkdir -p builds
cd builds

if [[ "${platform}" == "windows" ]]; then
	compiler_name="mingw"
elif [[ "${platform}" == "android" ]]; then
	compiler_name="clang"
elif [[ "${use_clang}" == true ]]; then
	compiler_name="clang"
else
	compiler_name="gcc"
fi

if [ -n "${engine}" ]; then
	folder="${compiler_name}_${game_name}_${engine}_${platform}_${arch}_${build_type}"
else
	folder="${compiler_name}_${platform}_${arch}_${build_type}"
fi
#rm -d -R "${folder}"
mkdir -p "${folder}"
cd "${folder}"

other_args="-DCMAKE_EXPORT_COMPILE_COMMANDS=True"

if [[ "${platform}" == "windows" ]]; then
	other_args="${other_args} -DWIN32=1 -DMINGW=1"
elif [[ "${platform}" == "linux" ]]; then
	other_args="${other_args} -DLINUX=1"
elif [[ "${platform}" == "android" ]]; then
	other_args="${other_args} -DCMAKE_TOOLCHAIN_FILE=/opt/android-ndk/build/cmake/android.toolchain.cmake -DANDROID_ABI=armeabi-v7a -DANDROID_NATIVE_API_LEVEL=android-29 -DANDROID=1"
fi

if [[ "${arch}" == "x64" ]]; then
    other_args="${other_args} -D64_BITS=1"
elif [[ "${arch}" == "x86" ]]; then
    other_args="${other_args} -D32_BITS=1"
fi

if [[ "${use_ninja}" == true ]]; then
    other_args="${other_args} -G Ninja"
else
    #other_args="${other_args} -G \"Unix Makefiles\""
    :
fi

if [[ "${use_ccache}" == true ]]; then
    bin_dir="/usr/lib/ccache/bin"
    other_args="${other_args} -DCMAKE_CXX_COMPILER_LAUNCHER=ccache"
else
    if [[ "${platform}" == "windows" ]]; then
        bin_dir="/usr/bin"
    else
        bin_dir="/bin"
    fi
fi

if [[ "${platform}" == "android" ]]; then
	compiler_args=""
else
	if [[ "${platform}" == "windows" ]]; then
		if [[ "${arch}" == "x64" ]]; then
			cc_name="x86_64-w64-mingw32-gcc"
			cxx_name="x86_64-w64-mingw32-g++"
		else
			#cc_name="i686-w64-mingw32-gcc"
			#cxx_name="i686-w64-mingw32-g++"
			cc_name="x86_64-w64-mingw32-gcc"
			cxx_name="x86_64-w64-mingw32-g++"
		fi
	else
		if [[ "${use_clang}" == true ]]; then
			cc_name="clang"
			cxx_name="clang++"
		else
			cc_name="gcc"
			cxx_name="g++"
		fi
	fi
	compiler_args="-DCMAKE_C_COMPILER=${bin_dir}/${cc_name} -DCMAKE_CXX_COMPILER=${bin_dir}/${cxx_name}"
	if [[ "${use_clang}" == true ]]; then
		compiler_args="${compiler_args} -D_CMAKE_TOOLCHAIN_PREFIX=llvm-"
	fi
fi

if [[ "${platform}" == "windows" ]]; then
	if [[ "${arch}" == "x64" ]]; then
		cmake_cmd="x86_64-w64-mingw32-cmake"
	else
		cmake_cmd="i686-w64-mingw32-cmake"
	fi
else
	cmake_cmd="cmake"
fi

if [ -n "${game_name}" ]; then
	other_args="${other_args} -DGAME_NAME=${game_name}"
fi

if [ -n "${engine}" ]; then
	other_args="${other_args} -DTARGET_ENGINE=${engine}"
fi

${cmake_cmd} "${src_dir}" -DCMAKE_BUILD_TYPE=${build_type} ${compiler_args} ${other_args} ${extra_args}
check_if_success

if [[ "${use_ninja}" == true ]]; then
    ninja -j 6 -k 1 #2>&1 | tee "build.log"
else
    make -j 6 -S -s #2>&1 | tee "build.log"
fi

check_if_success

exit

