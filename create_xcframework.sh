#!/bin/bash

set -xe

VERSION=$1

BUILD_DIR="./build"
cd $BUILD_DIR

SQLITE_COMMAND=("xcodebuild" "-create-xcframework" "-output" "SQLite.xcframework")
SQLCIPHER_COMMAND=("xcodebuild" "-create-xcframework" "-output" "SQLCipher.xcframework")

while IFS= read -r -d '' dir; do
  SQLITE_COMMAND+=("-archive" "$dir" "-framework" "SQLite.framework")
  SQLCIPHER_COMMAND+=("-archive" "$dir" "-framework" "SQLCipher.framework")
done < <(find . -type d -name "*SQLiteCipher-*.xcarchive" -print0)

command "${SQLITE_COMMAND[@]}"
command "${SQLCIPHER_COMMAND[@]}"

ditto -c -k --sequesterRsrc --keepParent SQLite.xcframework SQLite.xcframework.zip
ditto -c -k --sequesterRsrc --keepParent SQLCipher.xcframework SQLCipher.xcframework.zip
