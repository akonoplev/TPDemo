// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MainPage",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MainPage",
            targets: ["MainPage"]),
    ],
    dependencies: [
        .package(path: "./BaseArch"),
        .package(path: "./DipCore")
    ],
    targets: [

        .target(
            name: "MainPage",
            dependencies: [
                "BaseArch",
                "DipCore"
            ]),
        .testTarget(
            name: "MainPageTests",
            dependencies: ["MainPage"]),
    ]
)
