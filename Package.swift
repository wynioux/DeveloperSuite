// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "DeveloperSuite",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "DeveloperSuite", targets: ["DeveloperSuite"]),
        .library(name: "DSDeeplink", targets: ["DSDeeplink"]),
        .library(name: "DSExtension", targets: ["DSExtension"]),
        .library(name: "DSLog", targets: ["DSLog"]),
        .library(name: "DSModel", targets: ["DSModel"]),
        .library(name: "DSNetwork", targets: ["DSNetwork"]),
        .library(name: "DSPersistence", targets: ["DSPersistence"]),
        .library(name: "DSUI", targets: ["DSUI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "DeveloperSuite", dependencies: ["DSDeeplink", "DSLog", "DSNetwork", "DSPersistence"], path: "Sources/DeveloperSuite"),
        .testTarget(name: "DeveloperSuiteTests", dependencies: ["DeveloperSuite"], path: "Tests/DeveloperSuiteTests"),
        
        .target(name: "DSDeeplink", dependencies: ["DSPersistence", "DSUI"], path: "Sources/DSDeeplink"),
        .testTarget(name: "DSDeeplinkTests", dependencies: ["DSDeeplink"], path: "Tests/DSDeeplinkTests"),
        
        .target(name: "DSExtension", dependencies: ["DSModel"], path: "Sources/DSExtension"),
        .testTarget(name: "DSExtensionTests", dependencies: ["DSExtension"], path: "Tests/DSExtensionTests"),

        .target(name: "DSLog", dependencies: [.product(name: "Logging", package: "swift-log"), "DSPersistence", "DSUI"], path: "Sources/DSLog"),
        .testTarget(name: "DSLogTests", dependencies: ["DSLog"], path: "Tests/DSLogTests"),
        
        .target(name: "DSModel", dependencies: [], path: "Sources/DSModel"),
        .testTarget(name: "DSModelTests", dependencies: [], path: "Tests/DSModelTests"),
        
        .target(name: "DSNetwork", dependencies: ["DSExtension", "DSPersistence", "DSUI"], path: "Sources/DSNetwork"),
        .testTarget(name: "DSNetworkTests", dependencies: ["DSNetwork"], path: "Tests/DSNetworkTests"),
        
        .target(name: "DSPersistence", dependencies: ["DSExtension", "DSModel"], path: "Sources/DSPersistence"),
        .testTarget(name: "DSPersistenceTests", dependencies: ["DSPersistence"], path: "Tests/DSPersistenceTests"),
        
        .target(name: "DSUI", dependencies: ["DSPersistence"], path: "Sources/DSUI"),
        .testTarget(name: "DSUITests", dependencies: ["DSUI"], path: "Tests/DSUITests")
    ],
    swiftLanguageVersions: [.v5]
)
