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
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.14.1/SQLite.xcframework.zip",
      checksum: "1ad444ffe3f05f86941590a204394f6206c9de4b5e611bc407385886289d7bdd"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.14.1/SQLCipher.xcframework.zip",
      checksum: "7d5128d6a89346fc40fa3c9f7854900a16b8db49b05e8f48ffebb0c1b38ab7cc"
    ),
  ]
)
