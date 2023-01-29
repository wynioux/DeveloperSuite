//
//  BundleView.swift
//
//
//  Created by Bahadır A. Güder on 27.01.2023.
//

import SwiftUI

// MARK: View

extension DeveloperSuiteView.DeveloperSuiteViewModel.Module {
    struct BundleView: View {
        @StateObject private var viewModel = BundleViewModel()

        // MARK: - App

        var App: some View {
            Section("App") {
                StandardLabelView(key: "Name", value: viewModel.appName)
                StandardLabelView(key: "Version", value: viewModel.appVersion)
                StandardLabelView(key: "Numeric Version", value: viewModel.appNumericVersion)
                DetailedLabelView(key: "Identifier", value: viewModel.appIdentifier)
                StandardLabelView(key: "Development Region", value: viewModel.appDevelopmentRegion)
                StandardLabelView(key: "Minimum OS Version", value: viewModel.appMinimumOSVersion)
            }
        }

        // MARK: - BuildMachine

        var BuildMachine: some View {
            Section("Build Machine") {
                StandardLabelView(key: "macOS Build", value: viewModel.buildMachineBuild)
                StandardLabelView(key: "Xcode Version", value: viewModel.buildMachineXcodeVersion)
                DetailedLabelView(key: "Xcode Compiler", value: viewModel.buildMachineXcodeCompiler)
            }
        }

        // MARK: - InfoDictionary

        var InfoDictionary: some View {
            Section("Info Dictionary") {
                StandardLabelView(key: "Version", value: viewModel.infoDictionaryVersion)
                StandardLabelView(key: "Package Type", value: viewModel.infoPackageType)
            }
        }

        // MARK: - Platform

        var Platform: some View {
            Section("Platform") {
                StandardLabelView(key: "Name", value: viewModel.platformName)
                StandardLabelView(key: "Version", value: viewModel.platformVersion)
            }
        }

        // MARK: - body

        var body: some View {
            List {
                App
                BuildMachine
                InfoDictionary
                Platform
            }
        }
    }
}

// MARK: Preview

struct BundleView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperSuiteView.DeveloperSuiteViewModel.Module.BundleView()
    }
}
