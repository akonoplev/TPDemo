// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DipCore",
    products: [
        .library(
            name: "DipCore",
            targets: ["DipCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AliSoftware/Dip", .upToNextMajor(from: "7.1.1"))
    ],
    targets: [
        .target(
            name: "DipCore",
            dependencies: ["Dip"]),
        .testTarget(
            name: "DipCoreTests",
            dependencies: ["DipCore"]),
    ]
)
