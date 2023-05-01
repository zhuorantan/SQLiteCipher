#!/bin/sh

set -xe

# get latest SQLite.swift version

VERSION=$(curl -s https://api.github.com/repos/stephencelis/SQLite.swift/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/v//')

echo "SQLite.swift version: $VERSION"

cat <<EOF > Package.swift
// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SQLiteCipher",
  platforms: [
    .iOS(.v16),
  ],
  products: [
    .library(name: "SQLiteCipher", targets: ["SQLite", "SQLCipher"]),
  ],
  targets: [
    .binaryTarget(
      name: "SQLite",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/$VERSION/SQLite.xcframework.zip",
      checksum: "$(shasum -a 256 build/SQLite.xcframework.zip | awk '{print $1}')"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/$VERSION/SQLCipher.xcframework.zip",
      checksum: "$(shasum -a 256 build/SQLCipher.xcframework.zip | awk '{print $1}')"
    ),
  ]
)
EOF
