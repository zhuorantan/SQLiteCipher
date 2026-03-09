// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SQLiteCipher",
  platforms: [
    .iOS(.v11),
  ],
  products: [
    .library(name: "SQLiteCipher", targets: ["SQLite", "SQLCipher"]),
  ],
  targets: [
    .binaryTarget(
      name: "SQLite",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.16.0/SQLite.xcframework.zip",
      checksum: "f0b61023394fbcf3c52877f4bef371c32f4098704668a5986992bcad8ce31c03"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.16.0/SQLCipher.xcframework.zip",
      checksum: "cb13b28fecf0d651a451d29545f4904af7c2781e9774c1d4da2cd442126f420b"
    ),
  ]
)
