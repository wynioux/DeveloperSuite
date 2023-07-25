//
//  CodableDecodingError.swift
//  Model
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

// MARK: CodableDecodingError

public enum CodableDecodingError: Error, Codable, CustomDebugStringConvertible {
    case typeMismatch(String, CodableContext)
    case valueNotFound(String, CodableContext)
    case keyNotFound(CodableCodingKey, CodableContext)
    case dataCorrupted(CodableContext)
    case unknown

    public init(_ decodingError: DecodingError) {
        switch decodingError {
        case .typeMismatch(let any, let context): self = .typeMismatch(String(describing: any), .init(context))
        case .valueNotFound(let any, let context): self = .valueNotFound(String(describing: any), .init(context))
        case .keyNotFound(let codingKey, let context): self = .keyNotFound(.init(codingKey), .init(context))
        case .dataCorrupted(let context): self = .dataCorrupted(.init(context))
        @unknown default: self = .unknown
        }
    }

    public var domain: String {
        return "DecodingError"
    }

    public var debugDescription: String {
        switch self {
        case .typeMismatch(let type, let context):
            return "\(domain).typeMismatch(type: \"\(type)\", path: \"\(context.formattedPath)\", \"\(context.debugDescription)\")"

        case .valueNotFound(let type, let context):
            return "\(domain).valueNotFound(type: \"\(type)\", path: \"\(context.formattedPath)\", \"\(context.debugDescription)\")"

        case .keyNotFound(let codingKey, let context):
            return "\(domain).keyNotFound(key: \"\(codingKey.debugDescription)\", path: \"\(context.formattedPath)\", \"\(context.debugDescription)\")"

        case .dataCorrupted(let context):
            return "\(domain).dataCorrupted(path: \(context.formattedPath), \"\(context.debugDescription)\")"

        case .unknown:
            return "\(domain).unknown"
        }
    }

    public var context: CodableContext? {
        switch self {
        case .typeMismatch(_, let codableContext): return codableContext
        case .valueNotFound(_, let codableContext): return codableContext
        case .keyNotFound(_, let codableContext): return codableContext
        case .dataCorrupted(let codableContext): return codableContext
        case .unknown: return nil
        }
    }
}
