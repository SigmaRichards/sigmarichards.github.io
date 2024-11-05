#!/bin/bash

ROOT_DIR=$(pwd)
SRC_DIR="apps"
ROOT_APP="root"
BUILD_DIR="build"

PREBUILT_DIR="build"
SKELETON_FILE="index.html"
DEFAULTS="defaults"

build-app () {
	c_dir=$1
	mkdir -p $ROOT_DIR/$BUILD_DIR/$c_dir
	if [[ -d $PREBUILT_DIR ]]; then
		# Prebuilt
		cp -r $PREBUILT_DIR/* $ROOT_DIR/$BUILD_DIR/$c_dir/.
		return 0
	fi
	if [[ -f $SKELETON_FILE ]]; then
		# Use supplied skeleton
		elm make src/Main.elm --output="main.js" --optimize
		rm -r elm-stuff
		mv main.js $ROOT_DIR/$BUILD_DIR/$c_dir/.
		cp $SKELETON_FILE $ROOT_DIR/$BUILD_DIR/$c_dir/.
		return 0
	fi
	if [[ -f $ROOT_DIR/$DEFAULTS/$SKELETON_FILE ]]; then
		# Use default skeleton
		elm make src/Main.elm --output="main.js" --optimize
		rm -r elm-stuff
		mv main.js $ROOT_DIR/$BUILD_DIR/$c_dir/.
		cp $ROOT_DIR/$DEFAULTS/$SKELETON_FILE $ROOT_DIR/$BUILD_DIR/$c_dir/.
		return 0
	fi
	# Use elm generated index
	elm make src/Main.elm
	rm -r elm-stuff
	mv index.html $ROOT_DIR/$BUILD_DIR/$c_dir/.
	return 0
}

mkdir -p $BUILD_DIR
cd $SRC_DIR
for c_dir in ./*; do
	if [[ -d $c_dir ]]; then
		cd $c_dir
		build-app $c_dir
		cd ..
	fi
done
cd $ROOT_DIR/$BUILD_DIR
mv $ROOT_APP/* .
rm -r $ROOT_APP
cd $ROOT_DIR
