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
      checksum: "a5fb6774e9412403fc8ee57547f9d26edaa90ab9ceadd248618f64a69c0ab529"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.3/SQLCipher.xcframework.zip",
      checksum: "1b40f82fa69e483a428b12c6dc6212dda21a37f6a3006f356ee1f24ac46b5fbc"
    ),
  ]
)
