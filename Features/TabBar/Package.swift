// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TabBar",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "TabBar",
            targets: ["TabBar"]),
    ],
    dependencies: [
        .package(path: "./BaseArch"),
        .package(path: "./DipCore"),
        .package(path: "./ProfileFeature"),
        .package(path: "./MainFeature")
    ],
    targets: [
        .target(
            name: "TabBar",
            dependencies: [
                "BaseArch",
                "DipCore",
                "ProfileFeature",
                "MainFeature"
            ]),
        .testTarget(
            name: "TabBarTests",
            dependencies: ["TabBar"]),
    ]
)
