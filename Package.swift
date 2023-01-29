// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "DeveloperSuite",
    platforms: [
        .iOS(.v15),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "DeveloperSuite",
            targets: [
                "DeveloperSuite"
            ]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DeveloperSuite",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "DeveloperSuiteTests",
            dependencies: [
                "DeveloperSuite"
            ],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
