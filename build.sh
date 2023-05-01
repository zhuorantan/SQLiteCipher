#!/bin/sh

set -xe

VERSION=$1

BUILD_DIR="./build"
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
cd $BUILD_DIR

cat <<EOF > Podfile
use_frameworks!

install! 'cocoapods', :deterministic_uuids => false, :integrate_targets => false

platform :ios, '16.0'

pod 'SQLite.swift/SQLCipher', '$VERSION'
EOF

bundle install
bundle exec pod install

xcodebuild archive \
  -project ./Pods/Pods.xcodeproj \
  -scheme SQLite.swift \
  -destination "generic/platform=iOS" \
  -archivePath "archives/SQLiteCipher-iOS" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

xcodebuild archive \
  -project ./Pods/Pods.xcodeproj \
  -scheme SQLite.swift \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "archives/SQLiteCipher-iOS_Simulator" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

xcodebuild -create-xcframework \
  -archive archives/SQLiteCipher-iOS.xcarchive -framework SQLite.framework \
  -archive archives/SQLiteCipher-iOS_Simulator.xcarchive -framework SQLite.framework \
  -output SQLite.xcframework

xcodebuild -create-xcframework \
  -archive archives/SQLiteCipher-iOS.xcarchive -framework SQLCipher.framework \
  -archive archives/SQLiteCipher-iOS_Simulator.xcarchive -framework SQLCipher.framework \
  -output SQLCipher.xcframework

zip -r SQLite.xcframework.zip SQLite.xcframework
zip -r SQLCipher.xcframework.zip SQLCipher.xcframework
