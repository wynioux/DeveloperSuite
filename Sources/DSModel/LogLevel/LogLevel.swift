//
//  LogLevel.swift
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

// MARK: LogLevel

public enum LogLevel: String, CaseIterable {
    /// Appropriate for messages that contain information normally of use only when
    /// tracing the execution of a program.
    case trace = "Trace"

    /// Appropriate for messages that contain information normally of use only when
    /// debugging a program.
    case debug = "Debug"

    /// Appropriate for informational messages.
    case info = "Info"

    /// Appropriate for conditions that are not error conditions, but that may require
    /// special handling.
    case notice = "Notice"

    /// Appropriate for messages that are not error conditions, but more severe than
    /// `.notice`.
    case warning = "Warning"

    /// Appropriate for error conditions.
    case error = "Error"

    /// Appropriate for critical error conditions that usually require immediate
    /// attention.
    ///
    /// When a `critical` message is logged, the logging backend (`LogHandler`) is free to perform
    /// more heavy-weight operations to capture system state (such as capturing stack traces) to facilitate
    /// debugging.
    case critical = "Critical"
}
