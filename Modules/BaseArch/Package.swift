// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BaseArch",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BaseArch",
            targets: ["BaseArch"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "BaseArch",
            dependencies: []),
        .testTarget(
            name: "BaseArchTests",
            dependencies: ["BaseArch"]),
    ]
)
