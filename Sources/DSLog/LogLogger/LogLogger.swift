//
//  LogLogger.swift
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
import DSPersistence
import Foundation

// MARK: LogLogger

public final class LogLogger {
    // MARK: Properties

    public static let `default` = LogLogger(label: "io.github.wynioux.DeveloperSuite.LogLogger")

    private let label: String
    private let store: PersistentStore

    init(label: String, persistence: Persistence) {
        self.label = label
        self.store = persistence.store
    }

    public convenience init(label: String) {
        self.init(label: label, persistence: .default)
    }

    func log(level: LogLevel, message: String, file: String, function: String, line: UInt, label: String) {
        store.perform { context in
            let entity = LogEntity(context: context)
            entity.id = UUID()
            entity.createdAt = Date()
            entity.rawLevel = level.rawValue
            entity.message = message
            entity.file = file
            entity.function = function
            entity.line = Int(line)
            entity.label = label
        }
    }

    public func trace(_ message: String, file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(level: .trace, message: message, file: file, function: function, line: line, label: label)
    }

    public func debug(_ message: String, file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(level: .debug, message: message, file: file, function: function, line: line, label: label)
    }

    public func info(_ message: String, file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(level: .info, message: message, file: file, function: function, line: line, label: label)
    }

    public func notice(_ message: String, file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(level: .notice, message: message, file: file, function: function, line: line, label: label)
    }

    public func warning(_ message: String, file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(level: .warning, message: message, file: file, function: function, line: line, label: label)
    }

    public func error(_ message: String, file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(level: .error, message: message, file: file, function: function, line: line, label: label)
    }

    public func critical(_ message: String, file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(level: .critical, message: message, file: file, function: function, line: line, label: label)
    }
}
