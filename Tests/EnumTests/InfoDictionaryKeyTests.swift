//
//  InfoDictionaryKeyTests.swift
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

@testable import DeveloperSuite
import XCTest

// MARK: InfoDictionaryKeyTests

final class InfoDictionaryKeyTests: XCTestCase {
    // MARK: - test_rawValue

    func test_rawValue() {
        // swiftformat:disable all
        // Regular --------------------------------------------------------------------------------------------------------------------
        XCTAssertEqual(InfoDictionaryKey.buildMachineOSBuild.rawValue,                      "BuildMachineOSBuild")
        XCTAssertEqual(InfoDictionaryKey.cfBundleDevelopmentRegion.rawValue,                "CFBundleDevelopmentRegion")
        XCTAssertEqual(InfoDictionaryKey.cfBundleExecutable.rawValue,                       "CFBundleExecutable")
        XCTAssertEqual(InfoDictionaryKey.cfBundleIcons.rawValue,                            "CFBundleIcons")
        XCTAssertEqual(InfoDictionaryKey.cfBundleIdentifier.rawValue,                       "CFBundleIdentifier")
        XCTAssertEqual(InfoDictionaryKey.cfBundleInfoDictionaryVersion.rawValue,            "CFBundleInfoDictionaryVersion")
        XCTAssertEqual(InfoDictionaryKey.cfBundleName.rawValue,                             "CFBundleName")
        XCTAssertEqual(InfoDictionaryKey.cfBundleNumericVersion.rawValue,                   "CFBundleNumericVersion")
        XCTAssertEqual(InfoDictionaryKey.cfBundlePackageType.rawValue,                      "CFBundlePackageType")
        XCTAssertEqual(InfoDictionaryKey.cfBundleShortVersionString.rawValue,               "CFBundleShortVersionString")
        XCTAssertEqual(InfoDictionaryKey.cfBundleSupportedPlatforms.rawValue,               "CFBundleSupportedPlatforms")
        XCTAssertEqual(InfoDictionaryKey.cfBundleVersion.rawValue,                          "CFBundleVersion")
        XCTAssertEqual(InfoDictionaryKey.dtCompiler.rawValue,                               "DTCompiler")
        XCTAssertEqual(InfoDictionaryKey.dtPlatformBuild.rawValue,                          "DTPlatformBuild")
        XCTAssertEqual(InfoDictionaryKey.dtPlatformName.rawValue,                           "DTPlatformName")
        XCTAssertEqual(InfoDictionaryKey.dtPlatformVersion.rawValue,                        "DTPlatformVersion")
        XCTAssertEqual(InfoDictionaryKey.dtSDKBuild.rawValue,                               "DTSDKBuild")
        XCTAssertEqual(InfoDictionaryKey.dtSDKName.rawValue,                                "DTSDKName")
        XCTAssertEqual(InfoDictionaryKey.dtXcode.rawValue,                                  "DTXcode")
        XCTAssertEqual(InfoDictionaryKey.dtXcodeBuild.rawValue,                             "DTXcodeBuild")
        XCTAssertEqual(InfoDictionaryKey.lsRequiresIPhoneOS.rawValue,                       "LSRequiresIPhoneOS")
        XCTAssertEqual(InfoDictionaryKey.minimumOSVersion.rawValue,                         "MinimumOSVersion")
        XCTAssertEqual(InfoDictionaryKey.uiApplicationSceneManifest.rawValue,               "UIApplicationSceneManifest")
        XCTAssertEqual(InfoDictionaryKey.uiApplicationSupportsIndirectInputEvents.rawValue, "UIApplicationSupportsIndirectInputEvents")
        XCTAssertEqual(InfoDictionaryKey.uiDeviceFamily.rawValue,                           "UIDeviceFamily")
        XCTAssertEqual(InfoDictionaryKey.uiLaunchScreen.rawValue,                           "UILaunchScreen")
        XCTAssertEqual(InfoDictionaryKey.uiRequiredDeviceCapabilities.rawValue,             "UIRequiredDeviceCapabilities")
        XCTAssertEqual(InfoDictionaryKey.uiSupportedInterfaceOrientations.rawValue,         "UISupportedInterfaceOrientations")
        // ----------------------------------------------------------------------------------------------------------------------------
        
        // Unknown --------------------------------------------------------------------------------------------------------------------
        XCTAssertEqual(InfoDictionaryKey.unknown("CustomKey").rawValue,                     "CustomKey")
        // ----------------------------------------------------------------------------------------------------------------------------
        // swiftformat:enable all
    }

    // MARK: - test_initWithRawValue

    func test_initWithRawValue() {
        // swiftformat:disable all
        // Regular ----------------------------------------------------------------------------------------------------------------------------------------
        XCTAssertEqual(InfoDictionaryKey(rawValue: "BuildMachineOSBuild"),                      InfoDictionaryKey.buildMachineOSBuild)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "CFBundleDevelopmentRegion"),                InfoDictionaryKey.cfBundleDevelopmentRegion)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "CFBundleExecutable"),                       InfoDictionaryKey.cfBundleExecutable)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "CFBundleIcons"),                            InfoDictionaryKey.cfBundleIcons)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "CFBundleIdentifier"),                       InfoDictionaryKey.cfBundleIdentifier)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "CFBundleInfoDictionaryVersion"),            InfoDictionaryKey.cfBundleInfoDictionaryVersion)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "CFBundleName"),                             InfoDictionaryKey.cfBundleName)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "CFBundleNumericVersion"),                   InfoDictionaryKey.cfBundleNumericVersion)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "CFBundlePackageType"),                      InfoDictionaryKey.cfBundlePackageType)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "CFBundleShortVersionString"),               InfoDictionaryKey.cfBundleShortVersionString)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "CFBundleSupportedPlatforms"),               InfoDictionaryKey.cfBundleSupportedPlatforms)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "CFBundleVersion"),                          InfoDictionaryKey.cfBundleVersion)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "DTCompiler"),                               InfoDictionaryKey.dtCompiler)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "DTPlatformBuild"),                          InfoDictionaryKey.dtPlatformBuild)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "DTPlatformName"),                           InfoDictionaryKey.dtPlatformName)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "DTPlatformVersion"),                        InfoDictionaryKey.dtPlatformVersion)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "DTSDKBuild"),                               InfoDictionaryKey.dtSDKBuild)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "DTSDKName"),                                InfoDictionaryKey.dtSDKName)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "DTXcode"),                                  InfoDictionaryKey.dtXcode)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "DTXcodeBuild"),                             InfoDictionaryKey.dtXcodeBuild)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "LSRequiresIPhoneOS"),                       InfoDictionaryKey.lsRequiresIPhoneOS)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "MinimumOSVersion"),                         InfoDictionaryKey.minimumOSVersion)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "UIApplicationSceneManifest"),               InfoDictionaryKey.uiApplicationSceneManifest)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "UIApplicationSupportsIndirectInputEvents"), InfoDictionaryKey.uiApplicationSupportsIndirectInputEvents)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "UIDeviceFamily"),                           InfoDictionaryKey.uiDeviceFamily)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "UILaunchScreen"),                           InfoDictionaryKey.uiLaunchScreen)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "UIRequiredDeviceCapabilities"),             InfoDictionaryKey.uiRequiredDeviceCapabilities)
        XCTAssertEqual(InfoDictionaryKey(rawValue: "UISupportedInterfaceOrientations"),         InfoDictionaryKey.uiSupportedInterfaceOrientations)
        // ------------------------------------------------------------------------------------------------------------------------------------------------
        
        // Unknown ----------------------------------------------------------------------------------------------------------------------------------------
        XCTAssertEqual(InfoDictionaryKey(rawValue: "CustomKey"),                                InfoDictionaryKey.unknown("CustomKey"))
        // ------------------------------------------------------------------------------------------------------------------------------------------------
        // swiftformat:enable all
    }

    // MARK: - test_initWithRawValueWithWhitespaces

    func test_initWithRawValueWithWhitespaces() {
        XCTAssertEqual(InfoDictionaryKey(rawValue: "BuildMachineOSBuild "), InfoDictionaryKey.buildMachineOSBuild, "String with trailing spaces should be handled.")
        XCTAssertEqual(InfoDictionaryKey(rawValue: " BuildMachineOSBuild"), InfoDictionaryKey.buildMachineOSBuild, "String with leading spaces should be handled.")
    }

    // MARK: - test_initWithRawValueWithEmptyString

    func test_initWithRawValueWithEmptyString() {
        XCTAssertNil(InfoDictionaryKey(rawValue: ""), "Empty string should return nil.")
        XCTAssertNil(InfoDictionaryKey(rawValue: " "), "String with only spaces should return nil.")
    }

    // MARK: - test_equatable

    func test_equatable() {
        // swiftformat:disable all
        let buildMachineOSBuildKey        = InfoDictionaryKey.buildMachineOSBuild
        let buildMachineOSBuildKeyFromRaw = InfoDictionaryKey(rawValue: "BuildMachineOSBuild")
        // swiftformat:enable all
        XCTAssertEqual(buildMachineOSBuildKey, buildMachineOSBuildKeyFromRaw, "Expected to be equal as they both represent the key 'BuildMachineOSBuild' in Info.plist.")

        // swiftformat:disable all
        let unknownKey        = InfoDictionaryKey.unknown("CustomKey")
        let unknownKeyFromRaw = InfoDictionaryKey(rawValue: "CustomKey")
        // swiftformat:enable all
        XCTAssertEqual(unknownKey, unknownKeyFromRaw, "Expected to be equal as they both represent the custom key 'CustomKey' in Info.plist.")
    }
}
