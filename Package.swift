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
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.2/SQLite.xcframework.zip",
      checksum: "0b3524faa38273304281b0e305f2efbdad64b58440e1782deeae8ee3b7d097ac"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.2/SQLCipher.xcframework.zip",
      checksum: "fc5b6b7e9d6eca83a6ac2c9bff7987f1802a41998582551e835d6a30986dc5a6"
    ),
  ]
)
