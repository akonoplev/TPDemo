// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SuperCore",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "SuperCore",
            targets: ["SuperCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", .branchItem("master")),
        .package(path: "./DipCore")
    ],
    targets: [
        .target(
            name: "SuperCore",
            dependencies: [
                "DipCore",
                "KeychainAccess"
            ]),
        .testTarget(
            name: "SuperCoreTests",
            dependencies: ["SuperCore"]),
    ]
)
