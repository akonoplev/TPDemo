// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthorizationFeature",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "AuthorizationFeature",
            targets: ["AuthorizationFeature"]),
    ],
    dependencies: [
        .package(path: "./BaseArch"),
        .package(path: "./DipCore"),
        .package(path: "./SuperCore")
    ],
    targets: [
        .target(
            name: "AuthorizationFeature",
            dependencies: [
                "BaseArch",
                "DipCore",
                "SuperCore"
            ]),
        .testTarget(
            name: "AuthorizationFeatureTests",
            dependencies: ["AuthorizationFeature"]),
    ]
)
