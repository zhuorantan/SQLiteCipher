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

zip -r SQLite.xcframework.zip SQLite.xcframework
zip -r SQLCipher.xcframework.zip SQLCipher.xcframework
