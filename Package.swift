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
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.0/SQLite.xcframework.zip",
      checksum: "817411fbe93d00edb6a9f6cec7f9b4792c13c8c10df73fba12f3dd83f8f58b40"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.0/SQLCipher.xcframework.zip",
      checksum: "9e3d0eaaeeddcb82b3a071b29d722f106037d696bf8ad4ed8e4bed89e25da9c7"
    ),
  ]
)
