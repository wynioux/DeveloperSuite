//
//  SearchOptions.swift
//  DSModel
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

// MARK: SearchOptions

public struct SearchOptions: Equatable, Hashable, Codable {
    public static let `default` = SearchOptions()

    public var kind: Kind = .text
    public var caseSensitivity: CaseSensitivity = .ignoringCase
    public var matchingRule: MatchingRule = .contains

    public func eligibleMatchingRules() -> [MatchingRule]? {
        switch kind {
        case .text, .wildcard: return MatchingRule.allCases
        case .regex: return nil
        }
    }

    public static func regexForWildcard(_ pattern: String, matchingRule: MatchingRule) -> String {
        let pattern = NSRegularExpression.escapedPattern(for: pattern)
            .replacingOccurrences(of: "\\?", with: ".")
            .replacingOccurrences(of: "\\*", with: "[^\\s]*")

        switch matchingRule {
        case .begins: return "^" + pattern
        case .contains: return pattern
        case .ends: return pattern + "$"
        }
    }
}
