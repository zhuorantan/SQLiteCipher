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
      checksum: "721230002b4ea81d1055c3de605b7058f1fc4cca28f0a9404ffd14c61f7df7f8"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/zhuorantan/SQLiteCipher/releases/download/0.15.3/SQLCipher.xcframework.zip",
      checksum: "617d999dd2c8f58912ada56566acbfa14799f5734a9157f74876fa2f2401f427"
    ),
  ]
)
