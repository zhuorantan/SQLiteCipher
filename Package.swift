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
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.3/SQLite.xcframework.zip",
      checksum: "6198933461750e34126b9b27afe9b90becaf277b529af0e019850aa28298c002"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.3/SQLCipher.xcframework.zip",
      checksum: "5016a3905a5c56fe992bcd7b317a99b3cd80a3c0eeaa2a3a7e7e88a710802552"
    ),
  ]
)
