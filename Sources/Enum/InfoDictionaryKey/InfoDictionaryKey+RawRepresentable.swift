//
//  InfoDictionaryKey+RawRepresentable.swift
//  DeveloperSuite
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

import Foundation

// MARK: RawRepresentable

extension InfoDictionaryKey: RawRepresentable {
    typealias RawValue = String

    // MARK: - init

    public init?(rawValue: String) {
        let trimmedRawValue = rawValue
            .trimmingCharacters(in: .whitespaces)

        guard !trimmedRawValue.isEmpty else { return nil }

        switch trimmedRawValue {
        // swiftformat:disable all
        // Regular --------------------------------------------------------------------------------------
        case "BuildMachineOSBuild":                      self = .buildMachineOSBuild
        case "CFBundleDevelopmentRegion":                self = .cfBundleDevelopmentRegion
        case "CFBundleExecutable":                       self = .cfBundleExecutable
        case "CFBundleIcons":                            self = .cfBundleIcons
        case "CFBundleIdentifier":                       self = .cfBundleIdentifier
        case "CFBundleInfoDictionaryVersion":            self = .cfBundleInfoDictionaryVersion
        case "CFBundleName":                             self = .cfBundleName
        case "CFBundleNumericVersion":                   self = .cfBundleNumericVersion
        case "CFBundlePackageType":                      self = .cfBundlePackageType
        case "CFBundleShortVersionString":               self = .cfBundleShortVersionString
        case "CFBundleSupportedPlatforms":               self = .cfBundleSupportedPlatforms
        case "CFBundleVersion":                          self = .cfBundleVersion
        case "DTCompiler":                               self = .dtCompiler
        case "DTPlatformBuild":                          self = .dtPlatformBuild
        case "DTPlatformName":                           self = .dtPlatformName
        case "DTPlatformVersion":                        self = .dtPlatformVersion
        case "DTSDKBuild":                               self = .dtSDKBuild
        case "DTSDKName":                                self = .dtSDKName
        case "DTXcode":                                  self = .dtXcode
        case "DTXcodeBuild":                             self = .dtXcodeBuild
        case "LSRequiresIPhoneOS":                       self = .lsRequiresIPhoneOS
        case "MinimumOSVersion":                         self = .minimumOSVersion
        case "UIApplicationSceneManifest":               self = .uiApplicationSceneManifest
        case "UIApplicationSupportsIndirectInputEvents": self = .uiApplicationSupportsIndirectInputEvents
        case "UIDeviceFamily":                           self = .uiDeviceFamily
        case "UILaunchScreen":                           self = .uiLaunchScreen
        case "UIRequiredDeviceCapabilities":             self = .uiRequiredDeviceCapabilities
        case "UISupportedInterfaceOrientations":         self = .uiSupportedInterfaceOrientations
        // ----------------------------------------------------------------------------------------------
            
        // Unknown --------------------------------------------------------------------------------------
        default:                                         self = .unknown(trimmedRawValue)
        // ----------------------------------------------------------------------------------------------
        // swiftformat:enable all
        }
    }

    // MARK: - rawValue

    var rawValue: String {
        switch self {
        // swiftformat:disable all
        // Regular --------------------------------------------------------------------------------------
        case .buildMachineOSBuild:                      return "BuildMachineOSBuild"
        case .cfBundleDevelopmentRegion:                return "CFBundleDevelopmentRegion"
        case .cfBundleExecutable:                       return "CFBundleExecutable"
        case .cfBundleIcons:                            return "CFBundleIcons"
        case .cfBundleIdentifier:                       return "CFBundleIdentifier"
        case .cfBundleInfoDictionaryVersion:            return "CFBundleInfoDictionaryVersion"
        case .cfBundleName:                             return "CFBundleName"
        case .cfBundleNumericVersion:                   return "CFBundleNumericVersion"
        case .cfBundlePackageType:                      return "CFBundlePackageType"
        case .cfBundleShortVersionString:               return "CFBundleShortVersionString"
        case .cfBundleSupportedPlatforms:               return "CFBundleSupportedPlatforms"
        case .cfBundleVersion:                          return "CFBundleVersion"
        case .dtCompiler:                               return "DTCompiler"
        case .dtPlatformBuild:                          return "DTPlatformBuild"
        case .dtPlatformName:                           return "DTPlatformName"
        case .dtPlatformVersion:                        return "DTPlatformVersion"
        case .dtSDKBuild:                               return "DTSDKBuild"
        case .dtSDKName:                                return "DTSDKName"
        case .dtXcode:                                  return "DTXcode"
        case .dtXcodeBuild:                             return "DTXcodeBuild"
        case .lsRequiresIPhoneOS:                       return "LSRequiresIPhoneOS"
        case .minimumOSVersion:                         return "MinimumOSVersion"
        case .uiApplicationSceneManifest:               return "UIApplicationSceneManifest"
        case .uiApplicationSupportsIndirectInputEvents: return "UIApplicationSupportsIndirectInputEvents"
        case .uiDeviceFamily:                           return "UIDeviceFamily"
        case .uiLaunchScreen:                           return "UILaunchScreen"
        case .uiRequiredDeviceCapabilities:             return "UIRequiredDeviceCapabilities"
        case .uiSupportedInterfaceOrientations:         return "UISupportedInterfaceOrientations"
        // ----------------------------------------------------------------------------------------------
            
        // Unknown --------------------------------------------------------------------------------------
        case .unknown(let rawValue):                    return rawValue
        // ----------------------------------------------------------------------------------------------
        // swiftformat:enable all
        }
    }
}
