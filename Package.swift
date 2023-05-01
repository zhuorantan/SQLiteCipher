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
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.14.1/SQLite.xcframework.zip",
      checksum: "f31a7715e76f739e8c730f694ba13d2a21991b9df529b0580c0f0a74019d5144"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.14.1/SQLCipher.xcframework.zip",
      checksum: "45bbb3701019ea6c790145447ca0ddcc678a2c7b1221ab4029b7f11cc74b8350"
    ),
  ]
)
