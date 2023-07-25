//
//  TextRendererJSON.swift
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

import Foundation
import Model

// MARK: TextRendererJSON

final class TextRendererJSON {
    private let json: Any
    private var codableDecodingError: CodableDecodingError?
    private let helper: TextHelper = .init()

    private let spaces = 2

    private var string = ""
    private var previousElement: JSONElement?
    private var elements: [(NSRange, JSONElement, JSONContainerNode?)] = []

    private var indentation = 0
    private var index = 0
    private var errorRange: NSRange?
    private var codingPath: [CodableDecodingError.CodableCodingKey] = []

    init(json: Any, codableDecodingError: CodableDecodingError? = nil) {
        self.json = json
        self.codableDecodingError = codableDecodingError
    }

    private func render(json: Any, key: CodableDecodingError.CodableCodingKey, isFree: Bool) {
        codingPath.append(key)
        render(json: json, isFree: isFree)
        codingPath.removeLast()
    }

    private func newline() {
        append("\n", .punctuation)
    }

    private func renderObject(_ object: [String: Any]) {
        let node = JSONContainerNode(kind: .object, json: object)
        append("{", .punctuation, node)
        newline()
        let keys = object.keys.sorted()
        for index in keys.indices {
            let key = keys[index]
            indent()
            append(String(repeating: " ", count: spaces), .punctuation)
            append("\"\(key)\"", .key)
            append(": ", .punctuation)
            indentation += 1
            render(json: object[key]!, key: .stringValue(key), isFree: false)
            indentation -= 1
            if index < keys.endIndex - 1 {
                append(",", .punctuation)
            }
            newline()
        }
        indent()
        append("}", .punctuation, node)
    }

    private func renderArray(_ array: [Any]) {
        let node = JSONContainerNode(kind: .array, json: array)
        if array is [String] || array is [Int] || array is [NSNumber] {
            append("[", .punctuation, node)
            for index in array.indices {
                render(json: array[index], key: .intValue(index), isFree: true)
                if index < array.endIndex - 1 {
                    append(", ", .punctuation)
                }
            }
            append("]", .punctuation, node)
        } else {
            append("[", .punctuation, node)
            append("\n", .punctuation)
            indentation += 1
            for index in array.indices {
                render(json: array[index], key: .intValue(index), isFree: true)
                if index < array.endIndex - 1 {
                    append(",", .punctuation)
                }
                newline()
            }
            indentation -= 1
            indent()
            append("]", .punctuation, node)
        }
    }

    private func renderString(_ string: String) {
        append("\"\(string)\"", .valueString)
    }

    private func renderNumber(_ number: NSNumber) {
        if number === kCFBooleanTrue {
            append("true", .valueOther)
        } else if number === kCFBooleanFalse {
            append("false", .valueOther)
        } else {
            append("\(number)", .valueOther)
        }
    }

    private func append(_ string: String, _ element: JSONElement, _ node: JSONContainerNode? = nil) {
        let length = string.utf16.count
        self.string += string

        if element != .key { // Style for keys is the default one
            if previousElement == element, element != .punctuation { // Coalesce the same elements
                elements[elements.endIndex - 1].0.length += length
            } else {
                elements.append((NSRange(location: index, length: length), element, node))
            }
        }
        previousElement = element

        if let codableDecodingError, errorRange == nil, codingPath == codableDecodingError.context?.codingPath {
            switch codableDecodingError {
            case .keyNotFound:
                // Display error on the first key in the object regardless of what it is
                if element == .key {
                    errorRange = NSRange(location: index, length: length)
                }
            default:
                errorRange = NSRange(location: index, length: length)
            }
        }

        index += length
    }

    private func indent() {
        append(String(repeating: " ", count: indentation * spaces), .punctuation)
    }

    private func render(json: Any, isFree: Bool) {
        switch json {
        case let object as [String: Any]:
            if isFree {
                indent()
            }
            renderObject(object)
        case let string as String:
            renderString(string)
        case let array as [Any]:
            renderArray(array)
        case let number as NSNumber:
            renderNumber(number)
        default:
            if json is NSNull {
                append("null", .null)
            } else {
                append("\(json)", .valueOther)
            }
        }
    }

    private func color(for element: JSONElement) -> UIColor {
        switch element {
        case .punctuation: return JSONColors.punctuation
        case .key: return JSONColors.key
        case .valueString: return JSONColors.valueString
        case .valueOther: return JSONColors.valueOther
        case .null: return JSONColors.null
        }
    }

    func makeErrorAttributes() -> [NSAttributedString.Key: Any] {
        return [
            .backgroundColor: UIColor.systemRed,
            .foregroundColor: UIColor.white,
            .underlineColor: UIColor.clear
        ]
    }

    func render() -> NSAttributedString {
        render(json: json, isFree: true)

        let output = NSMutableAttributedString(string: string, attributes: helper.attributes(role: .body2, style: .monospaced, color: color(for: .key)))
        for (range, element, _) in elements {
            output.addAttribute(.foregroundColor, value: color(for: element), range: range)
        }
        if let range = errorRange {
            output.addAttributes(makeErrorAttributes(), range: range)
        }
        return output
    }
}

enum JSONElement {
    case punctuation
    case key
    case valueString
    case valueOther
    case null
}

final class JSONContainerNode {
    enum Kind {
        case object
        case array
    }

    let kind: Kind
    let json: Any
    var isExpanded = true
    var expanded: NSAttributedString?

    init(kind: Kind, json: Any) {
        self.kind = kind
        self.json = json
    }

    var openingCharacter: String {
        switch kind {
        case .object: return "{"
        case .array: return "["
        }
    }

    var closingCharacter: String {
        switch kind {
        case .object: return "}"
        case .array: return "]"
        }
    }
}

import UIKit
struct JSONColors {
    static let punctuation = UIColor.dynamic(
        light: .init(red: 113.0/255.0, green: 128.0/255.0, blue: 141.0/255.0, alpha: 1.0),
        dark: .init(red: 113.0/255.0, green: 128.0/255.0, blue: 141.0/255.0, alpha: 1.0)
    )
    static let key = UIColor.label
    static let valueString = UIColor.dynamic(
        light: .init(red: 196.0/255.0, green: 26.0/255.0, blue: 22.0/255.0, alpha: 1.0),
        dark: .init(red: 254.0/255.0, green: 129.0/255.0, blue: 112.0/255.0, alpha: 1.0)
    )
    static let valueOther = UIColor.dynamic(
        light: .init(red: 28.0/255.0, green: 0.0/255.0, blue: 207.0/255.0, alpha: 1.0),
        dark: .init(red: 208.0/255.0, green: 191.0/255.0, blue: 105.0/255.0, alpha: 1.0)
    )
    static let null = UIColor.dynamic(
        light: .init(red: 155.0/255.0, green: 35.0/255.0, blue: 147.00/255.0, alpha: 1.0),
        dark: .init(red: 252.0/255.0, green: 95.0/255.0, blue: 163.0/255.0, alpha: 1.0)
    )
}

extension UIColor {
    static func dynamic(light: UIColor, dark: UIColor) -> UIColor {
        UIColor {
            switch $0.userInterfaceStyle {
            case .dark:
                return dark
            default:
                return light
            }
        }

        // return dark
    }
}
