//
//  TextHelper.swift
//  UI
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

// MARK: TextHelper

final class TextHelper {
    private var cachedAttributes: [AttributesKey: [NSAttributedString.Key: Any]] = [:]
    private var cachedFonts: [TextStyle: UIFont] = [:]
    
    
    
    private func scaled(font: UIFont) -> UIFont {
        return UIFontMetrics.default.scaledFont(for: font)
    }
    
    private func getPreferredFontSize(for style: UIFont.TextStyle) -> CGFloat {
        UIFont.preferredFont(forTextStyle: style).fontDescriptor.pointSize
    }
    
    private func makeFont(style: TextStyle) -> UIFont {
        var size: CGFloat
        let body2Size = (0.7 * getPreferredFontSize(for: .body)).rounded()
        switch style.role {
        case .title: size = getPreferredFontSize(for: .title1)
        case .subheadline: size = (0.84 * body2Size).rounded()
        case .body: size = getPreferredFontSize(for: .body)
        case .body2: size = body2Size
        }
        return scaled(font: {
            switch style.style {
            case .proportional: return .systemFont(ofSize: size, weight: style.weight)
            case .monospaced: return .monospacedSystemFont(ofSize: size, weight: style.weight)
            case .monospacedDigital: return .monospacedDigitSystemFont(ofSize: size, weight: style.weight)
            }
        }())
    }
    
    private let titleParagraphStyle: NSParagraphStyle = {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = -6
        return paragraphStyle
    }()

    private let bodyParagraphStyle: NSParagraphStyle = {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        return paragraphStyle
    }()
    
    func font(style: TextStyle) -> UIFont {
        if let font = cachedFonts[style] {
            return font
        }
        let font = makeFont(style: style)
        cachedFonts[style] = font
        return font
    }
    
    private func makeAttributes(style: TextStyle, color: UIColor?) -> [NSAttributedString.Key: Any] {
        var attributes: [NSAttributedString.Key: Any] = [:]
        let font = self.font(style: style)
        attributes[.font] = font
        attributes[.paragraphStyle] = style.role == .title ? titleParagraphStyle : bodyParagraphStyle
        if style.width == .condensed {
            attributes[.kern] = -0.4
        } else if style.style == .monospaced {
            attributes[.kern] = -0.3
        }
        attributes[.foregroundColor] = color
        if style.role == .subheadline {
            attributes[.subheadline] = true
        }
        return attributes
    }
    
    private func attributes(style: TextStyle, color: UIColor?) -> [NSAttributedString.Key: Any] {
        let key = AttributesKey(textStyle: style, color: color)
        if let attributes = cachedAttributes[key] {
            return attributes
        }
        let attributes = makeAttributes(style: style, color: color)
        cachedAttributes[key] = attributes
        return attributes
    }

    func attributes(
        role: TextRole,
        style: TextFontStyle = .proportional,
        weight: UIFont.Weight = .regular,
        width: TextWidth = .standard,
        color: UIColor? = .label
    ) -> [NSAttributedString.Key: Any] {
        attributes(style: .init(role: role, style: style, weight: weight, width: width), color: color)
    }
}

struct AttributesKey: Hashable {
    let textStyle: TextStyle
    let color: UIColor?
}
