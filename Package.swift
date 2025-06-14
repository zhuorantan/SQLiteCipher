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
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.4/SQLite.xcframework.zip",
      checksum: "e99ec3da83cce33faaf19fab03e6b24d718916ca0b57feb12c9aa895c39c8122"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.4/SQLCipher.xcframework.zip",
      checksum: "e2151d2386519f6896914ba5e0bafb3fb8331290afdb2ca706bd25e3e3c52c6b"
    ),
  ]
)
