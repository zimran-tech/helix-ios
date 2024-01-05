// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Helix",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "HelixShimmer",
            targets: ["HelixShimmer"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(name: "HelixShimmer"),
        .testTarget(name: "HelixShimmerTests")
    ]
)
