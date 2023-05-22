// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProfileFeature",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ProfileFeature",
            targets: ["ProfileFeature"]),
    ],
    dependencies: [
        .package(path: "./BaseArch"),
    ],
    targets: [
        .target(
            name: "ProfileFeature",
            dependencies: ["BaseArch"]),
        .testTarget(
            name: "ProfileFeatureTests",
            dependencies: ["ProfileFeature"]),
    ]
)
