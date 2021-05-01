// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let name = "xcode-scheme-converter"
let package = Package(
    name: name,
    platforms: [.macOS(.v11)],
    dependencies: [
    ],
    targets: [
        .executableTarget(
            name: name,
            dependencies: [],
            path: "Sources"
        )
    ],
    swiftLanguageVersions: [.v5]
)
