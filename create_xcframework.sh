#!/bin/sh

set -xe

VERSION=$1

BUILD_DIR="./build"
cd $BUILD_DIR

find . -type d -name "*SQLiteCipher-*.xcarchive" -print0 |
  while IFS= read -r -d '' dir; do
    xcodebuild -create-xcframework \
      -archive "$dir" -framework SQLite.framework \
      -output SQLite.xcframework

    xcodebuild -create-xcframework \
      -archive "$dir" -framework SQLCipher.framework \
      -output SQLCipher.xcframework
  done

zip -r SQLite.xcframework.zip SQLite.xcframework
zip -r SQLCipher.xcframework.zip SQLCipher.xcframework
