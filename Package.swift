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
      checksum: "8cb61cc74e3d04cc26f9bb3a693929ba1f047d378f88cbe2e4f27023b6c12475"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.14.1/SQLCipher.xcframework.zip",
      checksum: "b8e62b4104ba8b1b4f6496b0fa5c3bd76ecf710e461b65ebcec74532788a2446"
    ),
  ]
)
