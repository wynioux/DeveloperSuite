//
//  Module+Color.swift
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

import SwiftUI

// MARK: Color

@available(iOS 15, *)
public extension Module {
    var color: Color {
        switch self {
        // swiftformat:disable all
        case .bundle:       return Color(.systemRed)
        case .deeplink:     return Color(.systemOrange)
        case .device:       return Color(.systemYellow)
        case .log:          return Color(.systemGreen)
        case .network:      return Color(.systemMint)
        case .notification: return Color(.systemTeal)
        case .userdefaults: return Color(.systemCyan)
        case .permission:   return Color(.systemIndigo)
        case .settings:     return Color(.systemPurple)
        // swiftformat:enable all
        }
    }
}
