#!/bin/sh

set -xe

VERSION=$1
PLATFORM=$2

case $PLATFORM in
  iOS)
    POD_PLATFORM="ios, 17.0"
    INCLUDES_SIMULATOR=true
    ;;
  tvOS)
    POD_PLATFORM="tvos, 17.0"
    INCLUDES_SIMULATOR=true
    ;;
  macOS)
    POD_PLATFORM="macos, 14.0"
    ;;
  watchOS)
    POD_PLATFORM="watchos, 10.0"
    ;;
  *)
    echo "Unknown platform: $PLATFORM"
    exit 1
    ;;
esac

BUILD_DIR="./build/$PLATFORM"
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
cd $BUILD_DIR

cat <<EOF > Podfile
use_frameworks!

install! 'cocoapods', :deterministic_uuids => false, :integrate_targets => false

platform :$POD_PLATFORM

pod 'SQLite.swift/SQLCipher', :git => 'https://github.com/stephencelis/SQLite.swift.git', :tag => '$VERSION'
EOF

bundle exec pod install

xcodebuild archive \
  -project ./Pods/Pods.xcodeproj \
  -scheme SQLite.swift \
  -destination "generic/platform=$PLATFORM" \
  -archivePath "./SQLiteCipher-$PLATFORM" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO \
  OTHER_SWIFT_FLAGS='$(inherited) -DSQLITE_SWIFT_SQLCIPHER' \
  GCC_PREPROCESSOR_DEFINITIONS='$(inherited) SQLITE_HAS_CODEC=1 SQLITE_SWIFT_SQLCIPHER=1'

if [ "$INCLUDES_SIMULATOR" = "true" ]; then
  xcodebuild archive \
    -project ./Pods/Pods.xcodeproj \
    -scheme SQLite.swift \
    -destination "generic/platform=$PLATFORM Simulator" \
    -archivePath "./SQLiteCipher-$PLATFORM Simulator" \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    SKIP_INSTALL=NO \
    OTHER_SWIFT_FLAGS='$(inherited) -DSQLITE_SWIFT_SQLCIPHER' \
    GCC_PREPROCESSOR_DEFINITIONS='$(inherited) SQLITE_HAS_CODEC=1 SQLITE_SWIFT_SQLCIPHER=1'
fi
