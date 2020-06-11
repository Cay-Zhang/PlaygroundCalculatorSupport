// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PlaygroundCalculatorSupport",
    platforms: [.macOS(SupportedPlatform.MacOSVersion.v10_14), .iOS(.v12)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PlaygroundCalculatorSupport",
            targets: ["PlaygroundCalculatorSupport", "Electricity"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/phlegmaticprogrammer/LANumerics", from: "0.1.11")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        // Modules
        .target(
            name: "PlaygroundCalculatorSupport",
            dependencies: [.product(name: "LANumerics", package: "LANumerics")],
            path: "./Sources/PlaygroundCalculatorSupport"),
        .target(
            name: "Electricity",
            dependencies: [.target(name: "PlaygroundCalculatorSupport")],
            path: "./Sources/Electricity"),
        .testTarget(
            name: "PlaygroundCalculatorSupportTests",
            dependencies: ["PlaygroundCalculatorSupport"]),
    ]
)
