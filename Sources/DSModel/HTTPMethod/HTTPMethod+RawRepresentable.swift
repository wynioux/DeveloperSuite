//
//  HTTPMethod+RawRepresentable.swift
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

// MARK: RawRepresentable

extension HTTPMethod: RawRepresentable {
    public typealias RawValue = String

    // MARK: - init

    public init?(rawValue: String) {
        let trimmedRawValue = rawValue.trimmingCharacters(in: .whitespaces)

        switch trimmedRawValue {
        // swiftformat:disable all
        // Regular -------------------------------------
        case "GET":     self = .get
        case "HEAD":    self = .head
        case "POST":    self = .post
        case "PUT":     self = .put
        case "DELETE":  self = .delete
        case "CONNECT": self = .connect
        case "OPTIONS": self = .options
        case "TRACE":   self = .trace
        case "PATCH":   self = .patch
        // ---------------------------------------------
            
        // Unknown -------------------------------------
        default:        self = .unknown(trimmedRawValue)
        // ---------------------------------------------
        // swiftformat:enable all
        }
    }

    // MARK: - rawValue

    public var rawValue: String {
        switch self {
        // swiftformat:disable all
        // Regular ---------------------------------
        case .get:                   return "GET"
        case .head:                  return "HEAD"
        case .post:                  return "POST"
        case .put:                   return "PUT"
        case .delete:                return "DELETE"
        case .connect:               return "CONNECT"
        case .options:               return "OPTIONS"
        case .trace:                 return "TRACE"
        case .patch:                 return "PATCH"
        // -----------------------------------------
            
        // Unknown ---------------------------------
        case .unknown(let rawValue): return rawValue
        // -----------------------------------------
        // swiftformat:enable all
        }
    }
}
