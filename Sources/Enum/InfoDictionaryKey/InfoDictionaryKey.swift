//
//  InfoDictionaryKey.swift
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

// MARK: InfoDictionaryKey

enum InfoDictionaryKey {
    // MARK: - Regular

    /**
     BuildMachineOSBuild

     Example:
     ```
     22A400
     ```
     */
    case buildMachineOSBuild

    /**
     CFBundleDevelopmentRegion

     Example:
     ```
     en
     ```
     */
    case cfBundleDevelopmentRegion

    /**
     CFBundleExecutable

     Example:
     ```
     iOS Example
     ```
     */
    case cfBundleExecutable

    /**
     CFBundleIcons

     Example:
     ```json
     {
        CFBundlePrimaryIcon = {
            CFBundleIconFiles = (
                AppIcon60x60
            );
            CFBundleIconName = AppIcon;
        };
     }
     ```
     */
    case cfBundleIcons

    /**
     CFBundleIdentifier

     Example Value:
     ```
     io.github.wynioux.DeveloperSuite.iOS-Example
     ```
     */
    case cfBundleIdentifier

    /**
     CFBundleInfoDictionaryVersion

     Example Value:
     ```
     6.0
     ```
     */
    case cfBundleInfoDictionaryVersion

    /**
     CFBundleName

     Example Value:
     ```
     iOS Example
     ```
     */
    case cfBundleName

    /**
     CFBundleNumericVersion

     Example Value:
     ```
     16809984
     ```
     */
    case cfBundleNumericVersion

    /**
     CFBundlePackageType

     Example Value:
     ```
     APPL
     ```
     */
    case cfBundlePackageType

    /**
     CFBundleShortVersionString

     Example Value:
     ```
     1.0
     ```
     */
    case cfBundleShortVersionString

    /**
     CFBundleSupportedPlatforms

     Example Value:
     ```
     (
        iPhoneOS
     )
     ```
     */
    case cfBundleSupportedPlatforms

    /**
     CFBundleVersion

     Example Value:
     ```
     1
     ```
     */
    case cfBundleVersion

    /**
     DTCompiler

     Example Value:
     ```
     com.apple.compilers.llvm.clang.1_0
     ```
     */
    case dtCompiler

    /**
     DTPlatformBuild

     Example Value:
     ```
     20C52
     ```
     */
    case dtPlatformBuild

    /**
     DTPlatformName

     Example Value:
     ```
     iphoneos
     ```
     */
    case dtPlatformName

    /**
     DTPlatformVersion

     Example Value:
     ```
     16.2
     ```
     */
    case dtPlatformVersion

    /**
     DTSDKBuild

     Example Value:
     ```
     20C52
     ```
     */
    case dtSDKBuild

    /**
     DTSDKName

     Example Value:
     ```
     iphoneos16.2
     ```
     */
    case dtSDKName

    /**
     DTXcode

     Example Value:
     ```
     1420
     ```
     */
    case dtXcode

    /**
     DTXcodeBuild

     Example Value:
     ```
     14C18
     ```
     */
    case dtXcodeBuild

    /**
     LSRequiresIPhoneOS

     Example Value:
     ```
     1
     ```
     */
    case lsRequiresIPhoneOS

    /**
     MinimumOSVersion

     Example Value:
     ```
     15.0
     ```
     */
    case minimumOSVersion

    /**
     UIApplicationSceneManifest

     Example Value:
     ```
     {
        UIApplicationSupportsMultipleScenes = 1;
     }
     ```
     */
    case uiApplicationSceneManifest

    /**
     UIApplicationSupportsIndirectInputEvents

     Example Value:
     ```
     1
     ```
     */
    case uiApplicationSupportsIndirectInputEvents

    /**
     UIDeviceFamily

     Example Value:
     ```
     (
        1,
        2
     )
     ```
     */
    case uiDeviceFamily

    /**
     UILaunchScreen

     Example Value:
     ```
     {
        UILaunchScreen = {
        };
     }
     ```
     */
    case uiLaunchScreen

    /**
     UIRequiredDeviceCapabilities

     Example Value:
     ```
     arm64
     ```
     */
    case uiRequiredDeviceCapabilities

    /**
     UISupportedInterfaceOrientations

     Example Value:
     ```
     (
        UIInterfaceOrientationPortrait,
        UIInterfaceOrientationLandscapeLeft,
        UIInterfaceOrientationLandscapeRight
     )
     ```
     */
    case uiSupportedInterfaceOrientations

    // MARK: - Unknown

    /**
     Custom
     */
    case unknown(String)
}
