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
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.5/SQLite.xcframework.zip",
      checksum: "8d68a29303e4e4514ce1d1c1160a0fb891f9d9fe4a904e8427f163ddd66bd10e"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.5/SQLCipher.xcframework.zip",
      checksum: "1bc0c31d3ae1c861c629327a278718777b602901ec29260a7dc168a1eb8c5c9a"
    ),
  ]
)
