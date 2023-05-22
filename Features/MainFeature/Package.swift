// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MainFeature",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "MainFeature",
            targets: ["MainFeature"]),
    ],
    dependencies: [
        .package(path: "./BaseArch"),
        .package(path: "./DipCore"),
        
    ],
    targets: [
        .target(
            name: "MainFeature",
            dependencies: [
                "BaseArch",
                "DipCore"
            ]),
        .testTarget(
            name: "MainFeatureTests",
            dependencies: ["MainFeature"]),
    ]
)
