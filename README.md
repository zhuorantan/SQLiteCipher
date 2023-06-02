# SQLiteCipher

Swift Package support for [SQLite.swift](https://github.com/stephencelis/SQLite.swift) + [SQLCipher](https://www.zetetic.net/sqlcipher).
SQLite.swift only provides SQLCipher support via CocoaPods. SQLiteCipher makes it possible to integrate SQLite.swift with SQLCipher as a Swift Package.

## Usage

Add SQLiteCipher to `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/zhuorantan/SQLiteCipher", .upToNextMajor(from: "0.14.1")),
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "SQLiteCipher", package: "SQLiteCipher"),
        ]
    ),
]
```

Import `SQLite` and use it the same way as SQLite.swift:

```swift
import SQLite

let db = try Connection("path/to/encrypted.sqlite3")
try db.key("secret")
```
