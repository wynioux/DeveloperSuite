# DeveloperSuite

| Home                                    | Deeplink                                    | Log                               | Network                                   |
| --------------------------------------- | ------------------------------------------- | --------------------------------- | ----------------------------------------- |
| ![Module](/Resources/Images/Module.png) | ![Deeplink](/Resources/Images/Deeplink.png) | ![Log](/Resources/Images/Log.png) | ![Network](/Resources/Images/Network.png) |

A comprehensive tool designed to assist developers in debugging and optimizing their applications.

_DeveloperSuite offers an array of detailed information on various aspects of the application; Developers can easily access crucial information pertaining to the application's performance and functionality, facilitating identification and resolution of any issues._

![Swift](https://img.shields.io/badge/Swift-5.7-orange?style=flat-square)
![Platforms](https://img.shields.io/badge/Platform-iOS_iPadOS-blue?style=flat-square)
![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen?style=flat-square)

## Features

- [ ] Bundle
  - [ ] Info.plist
- [x] Deeplink
  - [x] Deeplink Logging (**no code required**)
- [ ] Device
  - [ ] MachO
  - [ ] MobileGestalt.plist
  - [ ] ProcessInfo
- [x] Log
  - [x] Native
  - [x] Support for [SwiftLog](https://github.com/apple/swift-log) backend
- [x] Network
  - [x] URLSession Logging (**no code required**)
  - [x] URLSession.shared Logging (**no code required**)
  - [x] Automatically supports URLSession based frameworks like [Alamofire](https://github.com/Alamofire/Alamofire)
- [ ] Notification
- [ ] UserDefaults
- [ ] Permission

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

You can add DeveloperSuite to an Xcode project by adding it as a package dependency.

1. In your Xcode project, navigate to **File** > **Swift Packages** > **Add Package Dependency**

2. Paste the following into the URL field: https://github.com/wynioux/DeveloperSuite/

## Getting Started

### Adding URL Types

Follow these steps to add URL Types to your iOS app:

1. Open your Xcode project.
2. Select your app target from the project navigator.
3. Go to the "Info" tab.
4. Look for the "URL Types" section.
5. If there are no URL Types defined, click the "+" button to add a new URL Type.

![Adding URL Type](/Resources/Images/URLTypes.png)

6. In the URL Schemes field, enter a unique identifier for your app's custom URL scheme. This scheme will be used to launch your app from other apps or web links. For example, if your app's name is "YourAppName", you can use "yourappname" as the URL scheme.

7. Save your changes.

### Collecting Network Logs

To collect network logs using `DeveloperSuite` in your iOS app, follow these steps:

1. First, make sure you have integrated `DeveloperSuite` into your Xcode project. If you haven't, follow the installation instructions provided in the repository.

2. In your Xcode project, navigate to the `@main` struct of your app. This is typically located in the `YourAppName.swift` file.

3. Import the `DeveloperSuite` module at the top of the file:

```swift
import DeveloperSuite
```

4. Inside the `@main` struct, add the following lines in the `init()` method:

```swift
@main
struct YourAppNameApp: App {
    init() {
        // Enable URLProtocolMiddleware to collect `URLSession.shared` network logs
        URLProtocolMiddleware.shared.enable()

        // Enable URLSessionDelegateMiddleware to collect `URLSession` with delegate network logs
        URLSessionDelegateMiddleware.enable()
    }

    // Your app's entry point and other code...
}
```

5. To log decoding errors in network responses, you need to implement the `NetworkLogger.log(_:didFinishDecodingWithError:)` function from DeveloperSuite.

Here's an example Alamofire implementation:

```swift
import Alamofire
import DeveloperSuite
import Foundation

final class DeveloperSuiteEventMonitor: EventMonitor {
    let networkLogger = NetworkLogger.default

    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        guard let task = request.task else { return }
        networkLogger.log(task, didFinishDecodingWithError: response.error?.underlyingError)
    }
}
```

```swift
import Alamofire
import Foundation

final class NetworkService {
    let session = Session(eventMonitors: [DeveloperSuiteEventMonitor()])

    ...
}
```

### Opening DeveloperSuite with Deep Links

1. You can open DeveloperSuite using deep links in two ways:

Type the following URL in Safari, Notes, or any other app that supports URL linking:

```text
yourappname://suite
```

Replace "yourappname" with your actual app's custom URL scheme.

2. In-App

In your app, you can programmatically open DeveloperSuite using the following code:

```swift
if let url = URL(string: "yourappname://suite") {
    UIApplication.shared.open(url)
}
```

Replace "yourappname" with your actual app's custom URL scheme.

3. Open Other Modules with Deep Links:

To open other modules, replace the last part of the URL with the desired module name. Here are the available options:

- Bundle: "yourappname://suite/bundle"
- Deeplink: "yourappname://suite/deeplink"
- Device: "yourappname://suite/device"
- Log: "yourappname://suite/log"
- Notification: "yourappname://suite/notification"
- UserDefaults: "yourappname://suite/userdefaults"
- Permission: "yourappname://suite/permission"
- Settings: "yourappname://suite/settings"

That's it! Now users can open `DeveloperSuite` using deep links either by typing the URL directly or using `UIApplication.shared.open(url)` in your app. Enjoy exploring the network logs and debugging your app with ease!

## Minimum Requirements

| Swift     | Platforms             |
| --------- | --------------------- |
| Swift 5.7 | iOS 15.0, iPadOS 15.0 |

## Credits

This Swift package is heavily inspired by the fantastic work of [Pulse](https://github.com/kean/Pulse) by Kean, which served as a valuable source of inspiration and reference for the development of this project.

If you find this package helpful, we encourage you to check out the original project, [Pulse](https://github.com/kean/Pulse), and support its development as well.

## License

DeveloperSuite is released under the MIT license. See [LICENSE](https://github.com/wynioux/DeveloperSuite/blob/master/LICENSE) for details.
