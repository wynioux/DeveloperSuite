//
//  Project+MakeTargets.swift
//  Tuist
//
//  Copyright (c) 2023 Bahadır A. Güder
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import ProjectDescription

// MARK: MakeTargets

extension Project {
    static func makeTargets(
        name: String,
        baseBundleID: String,
        dependencies: [TargetDependency],
        createUnitTest: Bool = true,
        createDemoApp: Bool = true
    ) -> [Target] {
        var targets: [Target] = []

        // MARK: Default Parameters

        let platform: Platform = .iOS

        let deploymentTarget: DeploymentTarget = .iOS(
            targetVersion: "14.0",
            devices: [
                .iphone,
                .ipad
            ]
        )

        // MARK: Framework

        let frameworkTarget = Target(
            name: name,
            platform: platform,
            product: .framework,
            bundleId: "\(baseBundleID).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: .file(path: .relativeToManifest("\(name)/Info.plist")),
            sources: [
                .glob("\(name)/Sources/**/*.swift")
            ],
            dependencies: dependencies,
            settings: .settings(configurations: [
                .debug(
                    name: .debug,
                    xcconfig: .relativeToRoot("Tuist/BuildConfigurations/FrameworkTarget-Debug.xcconfig")
                ),
                .release(
                    name: .release,
                    xcconfig: .relativeToRoot("Tuist/BuildConfigurations/FrameworkTarget-Release.xcconfig")
                )
            ])
        )

        targets.append(frameworkTarget)

        // MARK: Unit Test

        if createUnitTest {
            let unitTestTarget = Target(
                name: "\(name)Tests",
                platform: platform,
                product: .unitTests,
                bundleId: "\(baseBundleID).\(name)Tests",
                deploymentTarget: deploymentTarget,
                infoPlist: .file(path: .relativeToManifest("\(name)Tests/Info.plist")),
                sources: [
                    .glob("\(name)Tests/Sources/**/*.swift")
                ],
                dependencies: [
                    .xctest,
                    .target(name: name)
                ],
                settings: .settings(configurations: [
                    .debug(
                        name: .debug,
                        xcconfig: .relativeToRoot("Tuist/BuildConfigurations/TestTarget-Debug.xcconfig")
                    ),
                    .release(
                        name: .release,
                        xcconfig: .relativeToRoot("Tuist/BuildConfigurations/TestTarget-Release.xcconfig")
                    )
                ])
            )

            targets.append(unitTestTarget)
        }

        // MARK: Demo

        if createDemoApp {
            let demoTarget = Target(
                name: "\(name)Demo",
                platform: platform,
                product: .app,
                bundleId: "\(baseBundleID).\(name)Demo",
                deploymentTarget: deploymentTarget,
                infoPlist: .file(path: .relativeToManifest("\(name)Demo/Info.plist")),
                sources: [
                    .glob("\(name)Demo/Sources/**/*.swift")
                ],
                dependencies: [
                    .target(name: name)
                ],
                settings: .settings(configurations: [
                    .debug(
                        name: .debug,
                        xcconfig: .relativeToRoot("Tuist/BuildConfigurations/DemoTarget-Debug.xcconfig")
                    ),
                    .release(
                        name: .release,
                        xcconfig: .relativeToRoot("Tuist/BuildConfigurations/DemoTarget-Release.xcconfig")
                    )
                ]),
                additionalFiles: [
                    .glob(pattern: "\(name)Demo/Resources")
                ]
            )

            targets.append(demoTarget)
        }

        return targets
    }
}
