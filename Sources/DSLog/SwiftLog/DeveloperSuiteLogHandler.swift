//
//  DeveloperSuiteLogHandler.swift
//  DSLog
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
import Foundation
import Logging

// MARK: DeveloperSuiteLogHandler

public struct DeveloperSuiteLogHandler: LogHandler {
    // MARK: Properties

    private let logLogger: LogLogger

    public let label: String
    public var logLevel: Logger.Level = .trace
    public var metadata: Logger.Metadata = .init()

    public init(label: String, logLogger: LogLogger) {
        self.label = label
        self.logLogger = logLogger
    }

    public init(label: String) {
        self.init(label: label, logLogger: .default)
    }

    public subscript(metadataKey key: String) -> Logger.Metadata.Value? {
        get { return metadata[key] }
        set { metadata[key] = newValue }
    }

    public func log(level: Logger.Level, message: Logger.Message, metadata: Logger.Metadata?, file: String, function: String, line: UInt) {
        logLogger.log(level: level.toNative(), message: message.description, file: file, function: function, line: line, label: label)
    }
}

extension Logger.Level {
    func toNative() -> LogLevel {
        switch self {
        // swiftformat:disable all
        case .trace:    return .trace
        case .debug:    return .debug
        case .info:     return .info
        case .notice:   return .notice
        case .warning:  return .warning
        case .error:    return .error
        case .critical: return .critical
        // swiftformat:enable all
        }
    }
}
