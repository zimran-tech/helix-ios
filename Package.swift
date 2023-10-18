// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Helix",
    products: [
        .library(
            name: "HelixAnalytics",
            targets: ["HelixAnalytics"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/aws-amplify/aws-sdk-ios-spm",
            from: "2.33.0"
        )
    ],
    targets: [
        .target(
            name: "HelixAnalytics",
            dependencies: [
                .product(name: "AWSKinesis", package: "aws-sdk-ios-spm"),
                .product(name: "AWSCore", package: "aws-sdk-ios-spm")
            ]
        ),
        .testTarget(
            name: "HelixAnalyticsTests",
            dependencies: ["HelixAnalytics"]),
    ]
)
