#!/bin/bash

game_name=cstrike
build_type=debug
engine=portal2
arch=x86
platform=linux

sh_dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")")
src_dir="${sh_dir}"

source "base-game-build.sh"
