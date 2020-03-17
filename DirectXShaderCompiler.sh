#!/bin/bash

build_type=release
arch=x64
platform=linux

sh_dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")")
src_dir="${sh_dir}/../src/thirdparty/DirectXShaderCompiler"

extra_args="$(cat "${src_dir}/utils/cmake-predefined-config-params")"

source "base-build.sh"
