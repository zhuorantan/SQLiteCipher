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
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.1/SQLite.xcframework.zip",
      checksum: "d728f22c450cd4eee6a152f4dc07e71a25bd5c3fe315acc261db57616dc8b6e4"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.1/SQLCipher.xcframework.zip",
      checksum: "b7358655a863050cffb3daa3e2a5dbc95e5e84e6c9295f399fef004ee55beae2"
    ),
  ]
)
