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
      checksum: "237d3462ed3e61883d9edefaa1dd7365cb6d06a1bab43580f6d8eefd850c3a98"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.14.1/SQLCipher.xcframework.zip",
      checksum: "8ccf0a590196e660a1250ea8d9f6ee05a7a38d9cf4afbd5f60ce431be3007034"
    ),
  ]
)
