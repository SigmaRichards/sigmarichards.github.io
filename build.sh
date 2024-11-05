#!/bin/bash

ROOT_DIR=$(pwd)
SRC_DIR="src"
ROOT_APP="root"
BUILD_DIR="build"

mkdir -p $BUILD_DIR
cd $SRC_DIR
for c_dir in ./*; do
	if [[ -d $c_dir ]]; then
		mkdir -p $ROOT_DIR/$BUILD_DIR/$c_dir
		cd $c_dir
		elm make src/Main.elm
		cp index.html $ROOT_DIR/$BUILD_DIR/$c_dir/.
		rm -r elm-stuff
		cd ..
	fi
done
cd $ROOT_DIR/$BUILD_DIR
mv $ROOT_APP/* .
rm -r $ROOT_APP
cd $ROOT_DIR
