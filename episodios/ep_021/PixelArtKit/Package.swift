// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "PixelArtKit",
    platforms: [
        .iOS(.v15),
        .macCatalyst(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PixelArtKit",
            targets: ["PixelArtKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PixelArtKit",
            dependencies: []),
        .testTarget(
            name: "PixelArtKitTests",
            dependencies: ["PixelArtKit"]),
    ]
)
