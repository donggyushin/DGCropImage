// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DGCropImage",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "DGCropImage",
            targets: ["DGCropImage"]),
    ],
    targets: [
        .target(
            name: "DGCropImage",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "DGCropImageTests",
            dependencies: ["DGCropImage"]),
    ]
)
