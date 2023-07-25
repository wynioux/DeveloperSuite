// swift-tools-version: 5.7

// 7hqjzrwjg23txuxlsmv5f56pht5sjpbsmmvbtx373ilziot5gyrq

import PackageDescription

let package = Package(
    name: "DeveloperSuite",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DeveloperSuite",
            targets: [
                "DeveloperSuite"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Deeplink",
            dependencies: [
                "Persistence"
            ]
        ),
        .testTarget(
            name: "DeeplinkTests",
            dependencies: [
                "Deeplink"
            ]
        ),

        .target(
            name: "DeveloperSuite",
            dependencies: [
                "Deeplink",
                "Logs",
                "Network",
                "Persistence"
            ]
        ),
        .testTarget(
            name: "DeveloperSuiteTests",
            dependencies: [
                "DeveloperSuite"
            ]
        ),

        .target(
            name: "Logs",
            dependencies: [
                //.product(name: "Logging", package: "swift-log")
            ]
        ),
        .testTarget(
            name: "LogsTests",
            dependencies: [
                "Logs"
            ]
        ),

        .target(
            name: "Extension",
            dependencies: [
                "Model"
            ]
        ),
        .testTarget(
            name: "ExtensionTests",
            dependencies: [
                "Extension"
            ]
        ),

        .target(
            name: "Model",
            dependencies: []
        ),
        .testTarget(
            name: "ModelTests",
            dependencies: [
                "Model"
            ]
        ),

        .target(
            name: "Network",
            dependencies: [
                "Extension",
                "Persistence",
                "UI"
            ]
        ),
        .testTarget(
            name: "NetworkTests",
            dependencies: [
                "Network"
            ]
        ),

        .target(
            name: "Persistence",
            dependencies: [
                "Model"
            ]
        ),
        .testTarget(
            name: "PersistenceTests",
            dependencies: [
                "Persistence"
            ]
        ),

        .target(
            name: "UI",
            dependencies: [
                "Persistence"
            ]
        ),
        .testTarget(
            name: "UITests",
            dependencies: [
                "UI"
            ]
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
