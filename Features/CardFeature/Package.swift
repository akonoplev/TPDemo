// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CardFeature",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "CardFeature",
            targets: ["CardFeature"]),
    ],
    dependencies: [
        .package(path: "./BaseArch"),
        .package(path: "./DipCore"),
        .package(path: "./SuperCore")
        
    ],
    targets: [
        .target(
            name: "CardFeature",
            dependencies: [
                "BaseArch",
                "DipCore",
                "SuperCore"
            ]),
        .testTarget(
            name: "CardFeatureTests",
            dependencies: ["CardFeature"]),
    ]
)
