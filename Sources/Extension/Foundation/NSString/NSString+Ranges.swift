//
//  NSString+Ranges.swift
//  Extension
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

// MARK: Ranges

public extension NSString {
    func ranges(of substring: String, options: SearchOptions) -> [NSRange] {
        var ranges = [NSRange]()
        var startIndex = 0

        let substring = options.kind == .wildcard ? SearchOptions.regexForWildcard(substring, matchingRule: options.matchingRule) : substring
        let options = NSString.CompareOptions(options)

        while startIndex < length {
            let range = range(of: substring, options: options, range: NSRange(location: startIndex, length: length - startIndex), locale: nil)
            if range.location == NSNotFound {
                return ranges
            }
            ranges.append(range)
            startIndex = range.upperBound
        }
        return ranges
    }
}
