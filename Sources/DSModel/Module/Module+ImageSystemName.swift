//
//  Module+ImageSystemName.swift
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

import UIKit

// MARK: ImageSystemName

public extension Module {
    var imageSystemName: String {
        switch self {
        // swiftformat:disable all
        case .bundle:       return "app"
        case .deeplink:     return "app.connected.to.app.below.fill"
        case .device:
            switch UIDevice.current.userInterfaceIdiom {
            case .phone: return "iphone"
            case .pad:   return "ipad"
            case .tv:    return "appletv"
            case .mac:   return "macpro.gen3.fill"
            default:     return "apple.logo"
            }
            
        case .log:          return "doc.plaintext"
        case .network:      return "network"
        case .notification: return "app.badge"
        case .userdefaults: return "list.bullet.rectangle"
        case .permission:   return "lock"
        case .settings:     return "gearshape"
        // swiftformat:enable all
        }
    }
}
