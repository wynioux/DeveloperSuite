//
//  TextRenderer.swift
//  DSUI
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

import DSModel
import UIKit

// MARK: TextRenderer

public final class TextRenderer {
    let helper: TextHelper

    public init() {
        self.helper = TextHelper()
    }

    func render(_ string: String, role: TextRole, style: TextFontStyle = .proportional, weight: UIFont.Weight = .regular, width: TextWidth = .standard, color: UIColor = .label) -> NSAttributedString {
        let attributes = helper.attributes(role: role, style: style, weight: weight, width: width, color: color)
        return NSAttributedString(string: string, attributes: attributes)
    }

    public func preformatted(_ string: String, color: UIColor? = nil) -> NSAttributedString {
        render(string, role: .body2, style: .monospaced, color: color ?? .label)
    }

    public func render(json: Any, codableDecodingError: CodableDecodingError? = nil) -> NSAttributedString {
        TextRendererJSON(json: json, codableDecodingError: codableDecodingError).render()
    }
}

enum TextRole {
    /// Large title.
    case title
    /// Section headline (small).
    ///
    /// Font size: iOS 12, macOS 10, tvOS 21, watchOS 11
    case subheadline
    /// Regular-sized body.
    ///
    /// Font size: iOS 17, macOS 13, tvOS 29, watchOS 16.
    case body
    /// Smaller body for console and other views where information has to be
    /// condensed.
    ///
    /// Font size: iOS 15, macOS 12, tvOS 26, watchOS 14.
    case body2
}

enum TextFontStyle {
    case proportional
    case monospaced
    case monospacedDigital
}

enum TextWidth {
    case condensed
    case standard
}

struct TextStyle: Hashable {
    var role: TextRole
    var style: TextFontStyle = .proportional
    var weight: UIFont.Weight = .regular
    var width: TextWidth = .standard
}
