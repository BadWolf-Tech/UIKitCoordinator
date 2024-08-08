// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitCoordinator",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "UIKitCoordinator",
            targets: ["UIKitCoordinator"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "UIKitCoordinator",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "UIKitCoordinatorTests",
            dependencies: ["UIKitCoordinator"],
            path: "Tests"
        ),
    ]
)
