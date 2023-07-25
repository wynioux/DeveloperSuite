# DeveloperSuite

A comprehensive tool designed to assist developers in debugging and optimizing their applications.

_DeveloperSuite offers an array of detailed information on various aspects of the application; Developers can easily access crucial information pertaining to the application's performance and functionality, facilitating identification and resolution of any issues._

![Swift](https://img.shields.io/badge/Swift-5.7-orange?style=flat-square)
![Platforms](https://img.shields.io/badge/Platform-iOS_iPadOS-blue?style=flat-square)
![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen?style=flat-square)

## Features

- [ ] [Bundle](#bundle)
  - [ ] Info.plist
- [x] [Deeplink](#deeplink)
  - [x] Deeplink Logging (**no code required**)
- [ ] [Device](#device)
  - [ ] MachO
  - [ ] MobileGestalt.plist
  - [ ] ProcessInfo
- [x] [Log](#log)
  - [x] Native
  - [x] [swift-log](https://github.com/apple/swift-log) support
- [x] [Network](#network)
  - [x] URLSession Logging (**no code required**)
  - [x] URLSession.shared Logging (**no code required**)
  - [x] [Alamofire](https://github.com/Alamofire/Alamofire) support
- [ ] [Notification](#notification)
- [ ] [UserDefaults](#userdefaults)
- [ ] [Permission](#permission)

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

You can add DeveloperSuite to an Xcode project by adding it as a package dependency.

1. In your Xcode project, navigate to **File** > **Swift Packages** > **Add Package Dependency**

2. Paste the following into the URL field: https://github.com/wynioux/DeveloperSuite/

## Getting Started

## Credits

This Swift package is heavily inspired by the fantastic work of [Pulse](https://github.com/kean/Pulse) by Kean, which served as a valuable source of inspiration and reference for the development of this project.

If you find this package helpful, we encourage you to check out the original project, [Pulse](https://github.com/kean/Pulse), and support its development as well.

## License

DeveloperSuite is released under the MIT license. See [LICENSE](https://github.com/wynioux/DeveloperSuite/blob/master/LICENSE) for details.
