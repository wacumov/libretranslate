// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "LibreTranslate",
    platforms: [.iOS(.v13), .macOS(.v10_15), .watchOS(.v6), .tvOS(.v13)],
    products: [
        .library(
            name: "LibreTranslate",
            targets: ["LibreTranslate"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "LibreTranslate",
            dependencies: []
        ),
        .testTarget(
            name: "LibreTranslateTests",
            dependencies: ["LibreTranslate"]
        ),
    ]
)
