//
//  File.swift
//
//
//  Created by Bahadır A. Güder on 27.01.2023.
//

import Foundation

// MARK: BundleViewModel

extension DeveloperSuiteView.DeveloperSuiteViewModel.Module.BundleView {
    @MainActor final class BundleViewModel: ObservableObject {
        private let infoDictionary = Bundle.main.infoDictionary

        // MARK: - init

        init() {}

        // MARK: - getValueFromInfoDictionary

        private func getValueFromInfoDictionary(for key: InfoDictionaryKey) -> Any? {
            guard let infoDictionary else { return nil }
            return infoDictionary[key.rawValue]
        }

        // MARK: - normalizeVersionNumber

        private func normalizeVersionNumber(for string: String) -> String {
            var version = string
            version.insert(".", at: version.index(version.endIndex, offsetBy: -1))
            version.insert(".", at: version.index(version.endIndex, offsetBy: -3))

            return version
                .replacingOccurrences(of: ".0", with: "")
        }

        // MARK: - App

        var appName: String {
            if let value = getValueFromInfoDictionary(for: .cfBundleName) {
                return "\(value)"
            }

            return "Unknown"
        }

        var appVersion: String {
            if let versionValue = getValueFromInfoDictionary(for: .cfBundleShortVersionString),
               let buildValue = getValueFromInfoDictionary(for: .cfBundleVersion)
            {
                return "\(versionValue) (\(buildValue))"
            }

            return "Unknown"
        }

        var appNumericVersion: String {
            if let value = getValueFromInfoDictionary(for: .cfBundleNumericVersion) {
                return "\(value)"
            }

            return "Unknown"
        }

        var appIdentifier: String {
            if let value = getValueFromInfoDictionary(for: .cfBundleIdentifier) {
                return "\(value)"
            }

            return "Unknown"
        }

        var appDevelopmentRegion: String {
            if let value = getValueFromInfoDictionary(for: .cfBundleDevelopmentRegion) {
                return "\(value)"
            }

            return "Unknown"
        }

        var appMinimumOSVersion: String {
            if let value = getValueFromInfoDictionary(for: .minimumOSVersion) {
                return "\(value)"
            }

            return "Unknown"
        }

        // MARK: Build Machine

        var buildMachineBuild: String {
            if let value = getValueFromInfoDictionary(for: .buildMachineOSBuild) {
                return "(\(value))"
            }

            return "Unknown"
        }

        var buildMachineXcodeVersion: String {
            if let versionValue = getValueFromInfoDictionary(for: .dtXcode),
               let buildValue = getValueFromInfoDictionary(for: .dtXcodeBuild)
            {
                let version = normalizeVersionNumber(for: "\(versionValue)")

                return "\(version) (\(buildValue))"
            }

            return "Unknown"
        }

        var buildMachineXcodeCompiler: String {
            if let value = getValueFromInfoDictionary(for: .dtCompiler) {
                return "\(value)"
            }

            return "Unknown"
        }

        // MARK: Info Dictionary

        var infoDictionaryVersion: String {
            if let value = getValueFromInfoDictionary(for: .cfBundleInfoDictionaryVersion) {
                return "\(value)"
            }

            return "Unknown"
        }

        var infoPackageType: String {
            if let value = getValueFromInfoDictionary(for: .cfBundlePackageType) {
                return "\(value)"
            }

            return "Unknown"
        }

        // MARK: Platform

        var platformName: String {
            if let value = getValueFromInfoDictionary(for: .dtPlatformName) {
                return "\(value)"
            }

            return "Unknown"
        }

        var platformVersion: String {
            if let versionValue = getValueFromInfoDictionary(for: .dtPlatformVersion),
               let buildValue = getValueFromInfoDictionary(for: .dtPlatformBuild)
            {
                return "\(versionValue) (\(buildValue))"
            }

            return "Unknown"
        }
    }
}
